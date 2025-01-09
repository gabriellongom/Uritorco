TitleState = Class{__includes = BaseState}

function TitleState:init(highScores)
    self.highScores = highScores
    self.startPressed = false
    self.mountainImage = Image {
        x = 0,
        y = VIRTUAL_HEIGHT - 20,
        texture = gTextures['mountain']
    }
    self.titleImage = Image {
        x = VIRTUAL_WIDTH + 364,
        y = VIRTUAL_HEIGHT / 2 - 160,
        texture = gTextures['title'],
        sizeX = 0.21,
        sizeY = 0.21,
    }
    self.pressImage = Image {
        x = -320,
        y = VIRTUAL_HEIGHT / 2 + 92,
        texture = gTextures['pressEnter'],
        sizeX = 0.125,
        sizeY = 0.125,
    }
end

function TitleState:enter()

    gSounds['GrowIntroBGM']:setVolume(0.3)
    gSounds['GrowIntroBGM']:play()
    gSounds['IntroBGM']:setLooping(true)
    gSounds['IntroBGM']:setVolume(0.3)

    self.startPressed = false
    self.mountainImage = Image {
        x = 0,
        y = VIRTUAL_HEIGHT - 20,
        texture = gTextures['mountain']
    }
    self.titleImage = Image {
        x = VIRTUAL_WIDTH + 364,
        y = VIRTUAL_HEIGHT / 2 - 160,
        texture = gTextures['title'],
        sizeX = 0.21,
        sizeY = 0.21,
    }
    self.pressImage = Image {
        x = -320,
        y = VIRTUAL_HEIGHT / 2 + 92,
        texture = gTextures['pressEnter'],
        sizeX = 0.125,
        sizeY = 0.125,
    }
    self.mountainImage.y = VIRTUAL_HEIGHT - 20
    Timer.tween(9, {
        [self.mountainImage] = {y = VIRTUAL_HEIGHT / 2}
    })

    :finish( function ()
        Timer.tween(1, {
            [self.titleImage] = {x = VIRTUAL_WIDTH / 2 - 182},
            [self.pressImage] = {x = VIRTUAL_WIDTH / 2 - 160}
        })
    end)
end

function TitleState:update(dt)
    if not gSounds['GrowIntroBGM']:isPlaying() and not gSounds['IntroBGM']:isPlaying() then
        gSounds['IntroBGM']:play()
    end

    if love.keyboard.wasPressed('return') or love.keyboard.wasPressed('space') then
        self.startPressed = true
        Timer.clear()
        self.titleImage.x = VIRTUAL_WIDTH / 2 - 182
        self.pressImage.x = VIRTUAL_WIDTH / 2 - 160
        self.mountainImage.y = VIRTUAL_HEIGHT / 2
    end
    if self.startPressed == true then
        gStateStack:push(TitleMenuState(self.highScores))
    end
end

function TitleState:render()
    love.graphics.setColor(0.5, 0.1, 0.8, 0.6)
    love.graphics.rectangle("fill", 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
    love.graphics.setColor(1, 1, 1, 0.8)
    self.mountainImage:render()
    love.graphics.setColor(1, 1, 1, 1)
    self.titleImage:render()
    love.graphics.setFont(gFonts['UIFontMedium'])
    if self.startPressed == false then
        self.pressImage:render()
    end
end
