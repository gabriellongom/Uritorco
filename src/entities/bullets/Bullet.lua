---@diagnostic disable: undefined-global
Bullet = Class{__includes = Entity}

function Bullet:init(def)
    self.animations = Entity.createAnimations(self, BULLET_DEFS[def.bullet].animation)

    self.data = BULLET_DEFS[def.bullet].data
    self.patternData = BULLET_DEFS[def.bullet].pattern

    self.pattern = Pattern {
        entity = self,
        patternArray = self.patternData
    }

    self.x = def.x
    self.y = def.y
    self.dx = def.dx
    self.dy = def.dy
    self.width = self.data.width
    self.height = self.data.height
    self.hitboxX = self.x + self.data.hitboxInsetX
    self.hitboxY = self.y + self.data.hitboxInsetY
    self.hitboxWidth = self.data.hitboxWidth
    self.hitboxHeight = self.data.hitboxHeight
    self.bulletType = self.data.bulletType
    self.damage = self.data.damage
    self.scoreOnDodge = self.data.scoreOnDodge
    self.dodgeChecked = false

    self.stateMachine = StateMachine {
        ['flying'] = function() return BulletFlyingState(self) end
    }
    self.stateMachine:change('flying')
end

function Bullet:changeState(name)
    Entity.changeState(self, name)
end

function Bullet:changeAnimation(name)
    Entity.changeAnimation(self, name)
end

function Bullet:update(dt)
    Entity.update(self, dt)
    self.pattern:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
    self.hitboxX = self.x + self.data.hitboxInsetX
    self.hitboxY = self.y + self.data.hitboxInsetY
end

function Bullet:dodgeCheck(player)
    if self.dodgeChecked == false then
        if not (player.hitboxX > self.x + self.width + 10 or player.hitboxX + player.hitboxWidth < self.x - 10 or player.hitboxY > self.y + self.height + 10 or player.hitboxY + player.hitboxHeight < self.y - 10) then
            self.dodgeChecked = true
            return true
        else
            return false
        end
    end
end

function Bullet:render()
    self.stateMachine:render()
    if self.patternData == nil then
        love.graphics.setColor(1,0,0,1)
        love.graphics.rectangle("line", self.hitboxX, self.hitboxY, self.hitboxWidth, self.hitboxHeight)
        love.graphics.rectangle("line", self.x - 10, self.y - 10, self.width + 20, self.height + 20)
    end
    love.graphics.setColor(1,1,1,1)
end