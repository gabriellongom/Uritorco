PlayerStillState = Class{__includes = EntityStillState}

function PlayerStillState:init(player)
    self.entity = player
    self.entity:changeAnimation('still')
end

function PlayerStillState:update(dt)
    if love.keyboard.isDown("lshift") then
        self.entity:changeState('stillFocus')
    end
    if love.keyboard.isDown('left') then
        self.entity.movingDirection = 'left'
        self.entity:changeState('moving')
    elseif love.keyboard.isDown('right') then
        self.entity.movingDirection = 'right'
        self.entity:changeState('moving')
    elseif love.keyboard.isDown('up') then
        self.entity.movingDirection = 'up'
        self.entity:changeState('moving')
    elseif love.keyboard.isDown('down') then
        self.entity.movingDirection = 'down'
        self.entity:changeState('moving')
    end
end