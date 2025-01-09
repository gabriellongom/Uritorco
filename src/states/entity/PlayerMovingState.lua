PlayerMovingState = Class{__includes = EntityMovingState}

function PlayerMovingState:init(player)
    self.entity = player
end

function PlayerMovingState:update(dt)
    if love.keyboard.isDown("lshift") then
        self.entity:changeState('stillFocus')
    end
    if love.keyboard.isDown('left') then
        self.entity.movingDirection = 'left'
        self.entity.x = self.entity.x - MOVE_SPEED * dt
        self.entity:changeAnimation('moving-' .. tostring(self.entity.movingDirection))
    elseif love.keyboard.isDown('right') then
        self.entity.movingDirection = 'right'
        self.entity.x = self.entity.x + MOVE_SPEED * dt
        self.entity:changeAnimation('moving-' .. tostring(self.entity.movingDirection))
    elseif love.keyboard.isDown('up') then
        self.entity.movingDirection = 'up'
        self.entity.y = self.entity.y - MOVE_SPEED * dt
        self.entity:changeAnimation('moving-' .. tostring(self.entity.movingDirection))
    elseif love.keyboard.isDown('down') then
        self.entity.movingDirection = 'down'
        self.entity.y = self.entity.y + MOVE_SPEED * dt
        self.entity:changeAnimation('moving-' .. tostring(self.entity.movingDirection))
    elseif not love.keyboard.isDown('left') or not love.keyboard.isDown('right') or not love.keyboard.isDown('up') or not love.keyboard.isDown('down') then
        self.entity:changeState('still')
    end

    if self.entity.x < 0 or self.entity.x + self.entity.width > VIRTUAL_WIDTH or self.entity.y < 0 or self.entity.y + self.entity.height > VIRTUAL_HEIGHT then
        self.entity:changeState('still')
        if self.entity.movingDirection == 'left' then
            self.entity.x = self.entity.x + MOVE_SPEED * dt
        elseif self.entity.movingDirection == 'right' then
            self.entity.x = self.entity.x - MOVE_SPEED * dt
        elseif self.entity.movingDirection == 'up' then
            self.entity.y = self.entity.y + MOVE_SPEED * dt
        else
            self.entity.y = self.entity.y - MOVE_SPEED * dt
        end
        return
    end
end