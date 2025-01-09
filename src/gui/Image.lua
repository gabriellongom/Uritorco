Image = Class()

function Image:init(def)
    self.x = def.x
    self.y = def.y
    self.texture = def.texture
    self.frame = def.frame or nil
    self.frameN = def.frameN or nil
    self.r = def.r or 0
    self.sizeX = def.sizeX or 1
    self.sizeY = def.sizeY or 1
end

function Image:render()
    if self.frame ~= nil and self.frameN ~= nil then
        love.graphics.draw(self.texture, self.frame[self.frameN], self.x, self.y, self.r, self.sizeX, self.sizeY)
    else
        love.graphics.draw(self.texture, self.x, self.y, self.r, self.sizeX, self. sizeY)
    end
end