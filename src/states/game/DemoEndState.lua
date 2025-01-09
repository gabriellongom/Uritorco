DemoEndState = Class{__includes = BaseState}

function DemoEndState:init(highScores, score)
    self.highScores = highScores
    self.score = score
    self.menu = Selection{
        x = 40,
        y = 200,
        width = VIRTUAL_WIDTH - 40,
        height = VIRTUAL_HEIGHT - 40,
        font = gFonts['UIFontMediumSmall'],
        items = {
            {
                text = 'EXIT TO MAIN MENU',
                onSelect = function ()
                    local highScore = false
        
                    local scoreIndex = 21
                    local highScoreIndex = 0

                    for i = 20, 1, -1 do
                        local score = self.highScores[i].score or 0
                        if self.score > score then
                            highScoreIndex = i
                            highScore = true
                        end
                    end
                    
                    if highScore then
                        for i = 19, highScoreIndex, -1 do
                            self.highScores[i + 1].score = self.highScores[i].score
                        end

                        self.highScores[highScoreIndex].score = self.score

                        local scoresStr = ''

                        for i = 1, 20 do
                            scoresStr = scoresStr .. tostring(self.highScores[i].score) .. '\n'
                        end

                        love.filesystem.write('uritorcoHighScores.lst', scoresStr)

                    end
                    self.controlEnable = false
                    self.menu.hidden = true
                    Timer.tween(0.5, {
                        [self.image] = {x = VIRTUAL_WIDTH}
                    })
                    
                    :finish(function ()
                        gSounds['GrowGameBGM']:stop()
                        gSounds['GameBGM']:stop()
                        gStateStack:pop()
                        gStateStack:pop()
                        gStateStack:push(TitleState(self.highScores))
                    end)
                end
            }
        },
        hidden = true
    }
    self.controlEnable = false
    self.image = Image {
        x = VIRTUAL_WIDTH,
        y = 0,
        texture = gTextures['fullScreen']
    }
    Timer.tween(0.5, {
        [self.image] = {x = 0}
    })

    :finish(function ()
        self.controlEnable = true
        self.menu.hidden = false
    end)
end

function DemoEndState:update(dt)
    if not gSounds['GrowGameBGM']:isPlaying() and not gSounds['GameBGM']:isPlaying() then
        gSounds['GameBGM']:setLooping(true)
        gSounds['GameBGM']:setVolume(0.3)
        gSounds['GameBGM']:play()
    end

    if self.controlEnable then
        self.menu:update()
    end
end

function DemoEndState:render()
    self.image:render()
    self.menu:render()
    if self.menu.hidden == false then
        love.graphics.setFont(gFonts['UIFontMedium'])
        love.graphics.printf("YOU WIN...", 0, (VIRTUAL_HEIGHT / 4) - 40, VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(gFonts['UIFontMediumSmall'])
        love.graphics.printf("FOR NOW", 0, (VIRTUAL_HEIGHT / 4), VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(gFonts['UIFontMedium'])
        love.graphics.printf("SCORE: " .. self.score, 0, (VIRTUAL_HEIGHT / 4) + 60, VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(gFonts['UIFontMediumSmall'])
        love.graphics.printf("THANKS FOR PLAYING", 0, (VIRTUAL_HEIGHT / 4) + 180, VIRTUAL_WIDTH, 'center')
        love.graphics.printf("THIS DEMO!", 0, (VIRTUAL_HEIGHT / 4) + 210, VIRTUAL_WIDTH, 'center')
    end
end