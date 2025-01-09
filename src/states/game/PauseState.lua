PauseState = Class{__includes = BaseState}

function PauseState:init(highScores, playstate)
    self.highScores = highScores
    self.playstate = playstate
    self.menu = Selection{
        x = 40,
        y = 40,
        width = VIRTUAL_WIDTH - 40,
        height = VIRTUAL_HEIGHT - 40,
        font = gFonts['UIFontMediumSmall'],
        items = {
            {
                text = 'RESUME GAME',
                onSelect = function ()
                    self.controlEnable = false
                    self.menu.hidden = true
                    Timer.tween(0.5, {
                        [self.image] = {x = VIRTUAL_WIDTH}
                    })
                    
                    :finish(function ()
                        self.playstate.paused = false
                        gStateStack:pop()
                    end)
                end
            },
            {
                text = 'EXIT TO MAIN MENU',
                onSelect = function ()
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

function PauseState:update(dt)
    if not gSounds['GrowGameBGM']:isPlaying() and not gSounds['GameBGM']:isPlaying() then
        gSounds['GameBGM']:setLooping(true)
        gSounds['GameBGM']:setVolume(0.3)
        gSounds['GameBGM']:play()
    end
    if self.controlEnable then
        self.menu:update()
    end
end

function PauseState:render()
    self.image:render()
    self.menu:render()
end