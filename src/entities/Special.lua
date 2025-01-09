Special = Class{__includes = Entity}

function Special:init(def)
    self.x = def.x
    self.y = def.y
    self.width = 16
    self.height = 16
    self.damage = 150
    self.texture = def.texture
    self.r = def.r or 0
    self.sizeX = def.sizeX or 1
    self.sizeY = def.sizeY or 1
    self.specialTable = def.specialTable
    self.enemiesTable = def.enemiesTable
    self.bulletsTable = def.bulletsTable

    gSounds['Special']:stop()
    gSounds['Special']:play()
    
    Timer.tween(1, {
        [self] = {sizeX = 100, sizeY = 100, x = -600, y = -480, width = VIRTUAL_WIDTH + 1400, height = VIRTUAL_HEIGHT + 1280}
    })

    :finish(function ()
        for i, special in ipairs(self.specialTable) do
            if special == self then
                table.remove(self.specialTable, i)
            end
        end
    end)
end

function Special:update(dt)
    for i, special in ipairs(self.specialTable) do
        for i2, bullet in ipairs(self.bulletsTable) do
            if bullet.bulletType ~= 'player' then
                if not (bullet.x > special.x + special.width or special.x > bullet.x + bullet.width or bullet.y > special.y + special.height or special.y > bullet.y + bullet.height) then
                    table.remove(self.bulletsTable, i2)
                end
            end
        end
        for i2, enemy in ipairs(self.enemiesTable) do
            if enemy.hittedBySpecial == false then
                if not (enemy.x > special.x + special.width or special.x > enemy.x + enemy.width or enemy.y > special.y + special.height or special.y > enemy.y + enemy.height) then
                    enemy.health = enemy.health - self.damage
                    enemy.hittedBySpecial = true
                    if enemy.health <= 0 then
                        enemy:changeState('explode')
                    end
                    
                end
            end
        end
    end
end

function Special:render()
    love.graphics.draw(self.texture, self.x, self.y, self.r, self.sizeX, self.sizeY)
    if GShowHitboxs then
        love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
    end
end