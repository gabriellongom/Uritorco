PlayerMovingFocusState = Class{__includes = EntityMovingState}

function PlayerMovingFocusState:init(player)
    self.entity = player
end

function PlayerMovingFocusState:update(dt)
    if love.keyboard.isDown("lshift") then
        if love.keyboard.isDown('left') then
            self.entity.movingDirection = 'left'
            self.entity.x = self.entity.x - FOCUS_MOVE_SPEED * dt
            self.entity:changeAnimation('movingFocus-' .. tostring(self.entity.movingDirection))
        elseif love.keyboard.isDown('right') then
            self.entity.movingDirection = 'right'
            self.entity.x = self.entity.x + FOCUS_MOVE_SPEED * dt
            self.entity:changeAnimation('movingFocus-' .. tostring(self.entity.movingDirection))
        elseif love.keyboard.isDown('up') then
            self.entity.movingDirection = 'up'
            self.entity.y = self.entity.y - FOCUS_MOVE_SPEED * dt
            self.entity:changeAnimation('movingFocus-' .. tostring(self.entity.movingDirection))
        elseif love.keyboard.isDown('down') then
            self.entity.movingDirection = 'down'
            self.entity.y = self.entity.y + FOCUS_MOVE_SPEED * dt
            self.entity:changeAnimation('movingFocus-' .. tostring(self.entity.movingDirection))
        else
            self.entity:changeState('stillFocus')
        end
    
        if self.entity.x < 0 or self.entity.x + self.entity.width > VIRTUAL_WIDTH or self.entity.y < 0 or self.entity.y + self.entity.height > VIRTUAL_HEIGHT then
            self.entity:changeState('stillFocus')
            if self.entity.movingDirection == 'left' then
                self.entity.x = self.entity.x + FOCUS_MOVE_SPEED * dt
            elseif self.entity.movingDirection == 'right' then
                self.entity.x = self.entity.x - FOCUS_MOVE_SPEED * dt
            elseif self.entity.movingDirection == 'up' then
                self.entity.y = self.entity.y + FOCUS_MOVE_SPEED * dt
            else
                self.entity.y = self.entity.y - FOCUS_MOVE_SPEED * dt
            end
            return
        end
    else
        self.entity:changeState('moving')
    end
end