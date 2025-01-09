GameOverState = Class{__includes = BaseState}

function GameOverState:init(highScores, score)
    self.highScores = highScores
    self.score = score
    self.menu = Selection{
        x = 40,
        y = 300,
        width = VIRTUAL_WIDTH - 70,
        height = VIRTUAL_HEIGHT - 340,
        font = gFonts['UIFontMedium'],
        items = {
            {
                text = 'RETRY',
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
                        gSounds['GameBGM']:stop()
                        gSounds['GrowGameBGM']:play()
                        gStateStack:pop()
                        gStateStack:pop()
                        gStateStack:push(PlayState(self.highScores))
                    end)
                end
            },
            {
                text = 'MAIN MENU',
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
            },
        },
        hidden = true
    }
    self.controlEnable = false
    self.drawBonus = false
    self.image = Image {
        x = VIRTUAL_WIDTH,
        y = 0,
        texture = gTextures['brokenFullScreen']
    }
    Timer.tween(0.5, {
        [self.image] = {x = 0}
    })
    
    :finish(function ()
        self.menu.hidden = false
        self.controlEnable = true
    end)
end

function GameOverState:update(dt)
    if self.controlEnable then
        self.menu:update()
    end

    
end

function GameOverState:render()
    self.image:render()
    self.menu:render()
    if self.menu.hidden == false then
        love.graphics.printf("YOU DIED", 0, (VIRTUAL_HEIGHT / 4) - 40, VIRTUAL_WIDTH, 'center')
        love.graphics.printf("SCORE: " .. self.score, 0, VIRTUAL_HEIGHT / 4, VIRTUAL_WIDTH, 'center')
    end
end