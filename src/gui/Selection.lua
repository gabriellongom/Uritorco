Selection = Class{}

function Selection:init(def)
    self.items = def.items
    self.x = def.x
    self.y = def.y

    self.height = def.height
    self.width = def.width
    self.font = def.font

    self.gapHeight = self.height / #self.items

    self.currentSelection = 1

    self.hidden = def.hidden
    gSounds['MenuIn']:stop()
    gSounds['MenuIn']:play()
end

function Selection:update(dt)
    if love.keyboard.wasPressed('up') then
        gSounds['Cursor']:stop()
        gSounds['Cursor']:play()
        if self.currentSelection == 1 then
            self.currentSelection = #self.items
        else
            self.currentSelection = self.currentSelection - 1
        end
    elseif love.keyboard.wasPressed('down') then
        gSounds['Cursor']:stop()
        gSounds['Cursor']:play()
        if self.currentSelection == #self.items then
            self.currentSelection = 1
        else
            self.currentSelection = self.currentSelection + 1
        end
    elseif love.keyboard.wasPressed('return') or love.keyboard.wasPressed('space') then
        gSounds['Select']:stop()
        gSounds['Select']:play()
        self.items[self.currentSelection].onSelect()
    end
end

function Selection:render()
    if self.hidden == false then
        local currentY = self.y

        for i = 1, #self.items do
            local paddedY = currentY + (self.gapHeight / 2) - self.font:getHeight() / 2

            if i == self.currentSelection then
                love.graphics.draw(gTextures['cursor'], self.x - 8, paddedY)
            end

            love.graphics.setFont(self.font)
            love.graphics.printf(self.items[i].text, self.x, paddedY, self.width, 'center')

            currentY = currentY + self.gapHeight
        end
    end
end