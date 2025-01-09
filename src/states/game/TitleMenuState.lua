TitleMenuState = Class{__includes = BaseState}

function TitleMenuState:init(highScores)
    self.highScores = highScores
    self.menu = Selection{
        x = VIRTUAL_WIDTH / 2 - 190,
        y = VIRTUAL_HEIGHT / 2 + 61,
        width = 380,
        height = 160,
        font = gFonts['UIFontMedium'],
        items = {
            {
                text = 'PLAY',
                onSelect = function ()
                    gSounds['GrowIntroBGM']:stop()
                    gSounds['IntroBGM']:stop()
                    gStateStack:pop()
                    gStateStack:pop()
                    gStateStack:push(PlayState(self.highScores))
                end
            },
            {
                text = 'LEADERBOARD',
                onSelect = function ()
                    gStateStack:push(ScoreBoradState(self.highScores))
                end
            },
            {
                text = 'EXIT GAME',
                onSelect = function ()
                    gStateStack:pop()
                    gStateStack:pop()
                    love.event.quit()
                end
            }
        },
        hidden = true
    }
    self.image = Image {
        x = 0,
        y = VIRTUAL_HEIGHT,
        texture = gTextures['titleMenuScreen']
    }
    Timer.tween(0.5, {
        [self.image] = {y = VIRTUAL_HEIGHT / 2}
    })
    
    :finish(function ()
        self.menu.hidden = false
    end)
end

function TitleMenuState:update(dt)
    if not gSounds['GrowIntroBGM']:isPlaying() and not gSounds['IntroBGM']:isPlaying() then
        gSounds['IntroBGM']:play()
    end
    self.menu:update()
end

function TitleMenuState:render()
    self.image:render()
    self.menu:render()
    
    if self.menu.hidden == false then
        love.graphics.setFont(gFonts['UIFontSmall'])
        love.graphics.printf("By Gabriel Longombardo", 0, VIRTUAL_HEIGHT - 60, VIRTUAL_WIDTH, 'center')
    end
end