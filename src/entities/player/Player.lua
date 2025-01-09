Player = Class{__includes = Entity}

function Player:init(def)
    self.highScores = def.highScores

    self.movingDirection = 'down'

    self.name = def.name

    self.animations = Entity.createAnimations(self, ENTITY_DEFS[self.name].animation)
    self.data = ENTITY_DEFS[self.name].data
    
    self.patternData = ENTITY_DEFS[self.name].patterns
    self.timesShoted = 0
    self.timeToShot = 0
    self.timeSinceLastShot = 0
    self.shotingEnable = true

    self.immune = false
    self.immuneDuration = 3
    self.immuneTimer = 0
    self.flashTimer = 0

    self.x = def.x
    self.y = def.y
    self.width = self.data.width
    self.height = self.data.height
    self.hitboxX = self.x + 13
    self.hitboxY = self.y + 18
    self.hitboxWidth = 5
    self.hitboxHeight = 5

    self.health = self.data.hp
    self.bombs = self.data.bombs

    self.score = def.score

    self.stateMachine = StateMachine {
        ['still'] = function() return PlayerStillState(self) end,
        ['moving'] = function () return PlayerMovingState(self) end,
        ['stillFocus'] = function() return PlayerStillFocusState(self) end,
        ['movingFocus'] = function () return PlayerMovingFocusState(self) end,
        ['explode'] = function () return PlayerExplodeState(self.highScores, self, self.score) end,
    }
    self.stateMachine:change('still')
end

function Player:render()

    if self.immune and self.flashTimer > 0.06 then
        self.flashTimer = 0
        love.graphics.setColor(1, 1, 1, 64/255)
    end

    self.stateMachine:render()
    if GShowHitboxs then
        love.graphics.setColor(1,0,0,1)
        love.graphics.rectangle("line", self.hitboxX, self.hitboxY, self.hitboxWidth, self.hitboxHeight)
    end
    love.graphics.setColor(1,1,1,1)
end

function Player:changeState(name)
    Entity.changeState(self, name)
end

function Player:changeAnimation(name)
    Entity.changeAnimation(self, name)
end

function Player:getAnimation()
    Entity.getAnimation(self)
end

function Player:createAnimations(animations)
    Entity.createAnimations(self, animations)
end

function Player:update(dt)
    Entity.update(self, dt)
    self.hitboxX = self.x + 13
    self.hitboxY = self.y + 18
    if self.immune then
        self.flashTimer = self.flashTimer + dt
        self.immuneTimer = self.immuneTimer + dt

        if self.immuneTimer > self.immuneDuration then
            self.immune = false
            self.immuneTimer = 0
            self.flashTimer = 0
        end
    end
end

function Player:attack(bulletsTable, player, dt)
    Entity.attack(self, bulletsTable, player, dt)
end

function Player:getHurt(bulletsTable)
    if self.immune == false then
        local hitted = false
        local bulletDamage = 0
        for i, bullet in ipairs(bulletsTable) do
            if bullet.bulletType == 'enemy' then
                if not (bullet.hitboxX > self.hitboxX + self.hitboxWidth or self.hitboxX > bullet.hitboxX + bullet.hitboxWidth or
                bullet.hitboxY > self.hitboxY + self.hitboxHeight or self.hitboxY > bullet.hitboxY + bullet.hitboxHeight) then
                    gSounds['Explosion']:stop()
                    gSounds['Explosion']:play()
                    self.immune = true
                    hitted = true
                    bulletDamage = bullet.damage
                    table.remove(bulletsTable, i)
                    self:changeState('explode')
                end
            end
        end
        if hitted == true then
            self.health = self.health - bulletDamage
            hitted = false
        end
    end
end

function Player:specialAttack(enemiesTable, bulletsTable, specialTable)
    local special = Special{
        x = self.hitboxX + 4,
        y = self.hitboxY + 4,
        texture = gTextures['playerSpecialAttack'],
        specialTable = specialTable,
        enemiesTable = enemiesTable,
        bulletsTable = bulletsTable
    }
    table.insert(specialTable, special)
end