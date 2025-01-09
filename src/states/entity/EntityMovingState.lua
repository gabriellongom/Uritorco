EntityMovingState = Class{__includes = EntityBaseState}

function EntityMovingState:init(entity)
    self.entity = entity

    self.moveDuration = 0
    self.movementTimer = 0

    self.bumped = false
end

function EntityMovingState:enter(params)

    self.entity:changeAnimation('moving-' .. tostring(self.entity.movingDirection))

end

function EntityMovingState:update(dt)

    self.bumped = false

    if self.entity.movingDirection == 'left' then
        self.entity.x = self.entity.x - FOCUS_MOVE_SPEED * dt

        if self.entity.x < 0 then
            self.entity.x = 0
            self.bumped = true
        end
    elseif self.entity.movingDirection == 'right' then
        self.entity.x = self.entity.x + FOCUS_MOVE_SPEED * dt

        if self.entity.x + self.entity.width > VIRTUAL_WIDTH then
            self.entity.x = VIRTUAL_WIDTH - self.entity.width - 0
            self.bumped = true
        end
    elseif self.entity.movingDirection == 'up' then
        self.entity.y = self.entity.y - FOCUS_MOVE_SPEED * dt

        if self.entity.y < 0 then
            self.entity.y = 0
            self.bumped = true
        end
    elseif self.entity.movingDirection == 'down' then
        self.entity.y = self.entity.y + FOCUS_MOVE_SPEED * dt

        if self.entity.y + self.entity.height > 200 then
            self.entity.y = 200 - self.entity.height - 0
            self.bumped = true
        end
    end
end

function EntityMovingState:processAI(dt)
    local directions = {'left', 'right', 'up', 'down'}

    if self.moveDuration == 0 or self.bumped == true then

        self.moveDuration = math.random(0.5)
        self.entity.movingDirection = directions[math.random(#directions)]

        self.entity:changeAnimation('moving-' .. tostring(self.entity.movingDirection))
    elseif self.movementTimer > self.moveDuration then
        self.movementTimer = 0

        if math.random(2) == 1 then
            self.entity:changeState('still')
        else
            self.moveDuration = math.random(0.5)
            self.entity.movingDirection = directions[math.random(#directions)]
            self.entity:changeAnimation('moving-' .. tostring(self.entity.movingDirection))
        end
    end

    self.movementTimer = self.movementTimer + dt
end

function EntityMovingState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x), math.floor(self.entity.y))
end