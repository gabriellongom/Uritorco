ScoreBoradState = Class{__includes = BaseState}

function ScoreBoradState:init(highScores)
    self.highScores = highScores
    self.menu = Selection{
        x = 40,
        y = 200,
        width = VIRTUAL_WIDTH - 40,
        height = VIRTUAL_HEIGHT - 40,
        font = gFonts['UIFontMediumSmall'],
        items = {
            {
                text = 'EXIT LEADERBOARD',
                onSelect = function ()
                    self.controlEnable = false
                    self.menu.hidden = true
                    Timer.tween(0.5, {
                        [self.image] = {x = VIRTUAL_WIDTH}
                    })
                    
                    :finish(function ()
                        gStateStack:pop()
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

function ScoreBoradState:update(dt)
    if not gSounds['GrowIntroBGM']:isPlaying() and not gSounds['IntroBGM']:isPlaying() then
        gSounds['IntroBGM']:setLooping(true)
        gSounds['IntroBGM']:setVolume(0.3)
        gSounds['IntroBGM']:play()
    end

    if self.controlEnable then
        self.menu:update()
    end
end

function ScoreBoradState:render()
    self.image:render()
    self.menu:render()

    if self.menu.hidden == false then
        love.graphics.setFont(gFonts['UIFontMedium'])
        love.graphics.printf('HIGH SCORES', 0, VIRTUAL_HEIGHT / 4 - 80, VIRTUAL_WIDTH, 'center')

        love.graphics.setFont(gFonts['UIFontSmall'])

        for i = 1, 20 do
            local score = self.highScores[i].score or 'NO DATA'

            love.graphics.printf(tostring(i) .. '.', 40, 100 + i * 15, VIRTUAL_WIDTH, 'left')
            if score < 0 then
                love.graphics.printf("NO DATA", 0, 100 + i * 15, VIRTUAL_WIDTH, 'center')
            else
                love.graphics.printf(tostring(score), 0, 100 + i * 15, VIRTUAL_WIDTH, 'center')
            end
        end
    end
end