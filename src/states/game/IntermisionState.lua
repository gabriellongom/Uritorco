IntermisionState = Class{__includes = BaseState}

function IntermisionState:init(highScores, score, player, initialHealth, playstate)
    self.highScores = highScores
    self.playstate = playstate
    self.score = score
    self.player = player
    self.menu = Selection{
        x = 40,
        y = 200,
        width = VIRTUAL_WIDTH - 40,
        height = VIRTUAL_HEIGHT - 40,
        font = gFonts['UIFontMedium'],
        items = {
            {
                text = 'NEXT LEVEL',
                onSelect = function ()
                    self.controlEnable = false
                    self.menu.hidden = true
                    self.player.health = 3
                    self.player.bombs = 2
                    Timer.tween(0.5, {
                        [self.image] = {x = VIRTUAL_WIDTH}
                    })
                    
                    :finish(function ()
                        self.playstate.paused = false
                        gStateStack:pop()
                    end)
                end
            },
        },
        hidden = true
    }
    self.controlEnable = false
    self.drawBonus = false
    self.image = Image {
        x = VIRTUAL_WIDTH,
        y = 0,
        texture = gTextures['fullScreen']
    }
    Timer.tween(0.5, {
        [self.image] = {x = 0}
    })
    
    :finish(function ()
        self.menu.hidden = false
            if self.player.health >= initialHealth then
                self.drawBonus = true
                local newScore = self.score * 1.5
                Timer.tween(3, {
                    [self] = {score = newScore}
                })

                :finish(function ()
                    self.controlEnable = true
                end)
            else
                self.controlEnable = true
            end

    end)
end

function IntermisionState:update(dt)
    if not gSounds['GrowGameBGM']:isPlaying() and not gSounds['GameBGM']:isPlaying() then
        gSounds['GameBGM']:setLooping(true)
        gSounds['GameBGM']:setVolume(0.3)
        gSounds['GameBGM']:play()
    end
    if self.controlEnable then
        self.menu:update()
    end
end

function IntermisionState:render()
    self.image:render()
    self.menu:render()
    if self.menu.hidden == false then
        if self.drawBonus == true then
            love.graphics.setFont(gFonts['UIFontMediumSmall'])
            love.graphics.printf("NO HEALTH LOSE BONUS", 0, VIRTUAL_HEIGHT / 4 - 30, VIRTUAL_WIDTH, 'center')
            love.graphics.setFont(gFonts['UIFontMedium'])
        end
        love.graphics.printf("SCORE: " .. math.floor(self.score + 0.5), 0, VIRTUAL_HEIGHT / 4, VIRTUAL_WIDTH, 'center')
    end
end