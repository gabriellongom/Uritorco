PlayerExplodeState = Class{__includes = EntityExplodeState}

function PlayerExplodeState:init(highScores, player, score)
    self.highScores = highScores
    self.score = score
    self.entity = player
    self.entity:changeAnimation('explode')
end

function PlayerExplodeState:enter()
    self.entity.shotingEnable = false
end

function PlayerExplodeState:update(dt)
    local animation = self.entity.animations['explode']
    if self.entity.health > 0 then
        if animation.timesPlayed > 0 then
            self.entity.x = VIRTUAL_WIDTH / 2 - 16
            self.entity.y = VIRTUAL_HEIGHT + 32
            self:respawning()
            animation:refresh()
            
            self.entity:changeState('still')
        end
    else
        gStateStack:push(GameOverState(self.highScores, self.score))
    end
end

function PlayerExplodeState:respawning()
    Timer.tween(1, {
        [self.entity] = {y = VIRTUAL_HEIGHT / 2 + 64}
    })
    Timer.after(1, function ()
        self.entity.shotingEnable = true
    end)
end