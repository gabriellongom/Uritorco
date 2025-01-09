EntityStillState = Class{__includes = EntityBaseState}

function EntityStillState:init(entity)
    self.entity = entity
    self.entity:changeAnimation('still')

    self.waitDuration = 0
    self.waitTimer = 0
end

function EntityStillState:processAI(dt)
    if self.waitDuration == 0 then
        self.waitDuration = math.random(3)
    else
        self.waitTimer = self.waitTimer + dt

        if self.waitTimer > self.waitDuration then
            self.entity:changeState('moving')
        end
    end
end

function EntityStillState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x), math.floor(self.entity.y))
end