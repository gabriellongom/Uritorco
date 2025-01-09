PlayerStillFocusState = Class{__includes = EntityStillState}

function PlayerStillFocusState:init(player)
    self.entity = player
    self.entity:changeAnimation('stillFocus')
end

function PlayerStillFocusState:update(dt)
    if love.keyboard.isDown("lshift") then
        if love.keyboard.isDown('left') then
            self.entity.movingDirection = 'left'
            self.entity:changeState('movingFocus')
        elseif love.keyboard.isDown('right') then
            self.entity.movingDirection = 'right'
            self.entity:changeState('movingFocus')
        elseif love.keyboard.isDown('up') then
            self.entity.movingDirection = 'up'
            self.entity:changeState('movingFocus')
        elseif love.keyboard.isDown('down') then
            self.entity.movingDirection = 'down'
            self.entity:changeState('movingFocus')
        end
    else
        self.entity:changeState('still')
    end
end