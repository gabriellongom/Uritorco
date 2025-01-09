PlayState = Class{__includes = BaseState}

function PlayState:init(highScores)
    self.highScores = highScores
    self.bullets = {}
    self.enemies = {}
    self.bgObjects = {}
    self.specials = {}
    self.level = 1
    self.wave = 0
    self.backgroundScroll = -560
    self.score = 0
    self.paused = false

    self.player = Player {
        highScores = self.highScores,
        name = 'player',
        x = VIRTUAL_WIDTH / 2 - 16,
        y = VIRTUAL_HEIGHT / 2 + 64,
    }

    GPlayer = self.player

    self.image = Image {
        x = 0,
        y = 0,
        texture = gTextures['playerUI']
    }

    self.initialHealth = 3

    gSounds['GrowGameBGM']:setVolume(0.3)
    gSounds['GrowGameBGM']:play()
    gSounds['GameBGM']:setLooping(true)
    gSounds['GameBGM']:setVolume(0.3)

    Timer.every(1, function ()
        if self.paused == false then
            Generator:GenerateBgObject(self.bgObjects)
        end
    end)
end

function PlayState:update(dt)
    if not gSounds['GrowGameBGM']:isPlaying() and not gSounds['GameBGM']:isPlaying() then
        gSounds['GameBGM']:play()
    end
    
    if love.keyboard.wasPressed('return') then
        self.paused = true
        gStateStack:push(PauseState(self.highScores, self))
    end

    self.backgroundScroll = (self.backgroundScroll + BACKGROUND_SCROLL_SPEED * dt)
    if self.backgroundScroll >= BACKGROUND_LOOP_AT then
        self.backgroundScroll = -560
    end

    for i, object in ipairs(self.bgObjects) do
        object.y = object.y + BACKGROUND_SCROLL_SPEED * dt
        if object.y > VIRTUAL_HEIGHT then
            table.remove(self.bgObjects, i)
        end
    end

    if #self.enemies == 0 then
        self.wave = self.wave + 1
        if self.wave > #LEVEL_DEFS[self.level].waves then
            self.level = self.level + 1
            if self.level > #LEVEL_DEFS then
                gStateStack:push(DemoEndState(self.highScores, self.score))
                goto exit
            else
                self.wave = 0
                self.paused = true
                gStateStack:push(IntermisionState(self.highScores, self.score, self.player, self.initialHealth, self))
                self.initialHealth = self.player.health
                self.bullets = {}
                self.bgObjects = {}
                goto exit
            end
        end
        Generator:GenerateWave(self.level, self.enemies, self.wave)
        ::exit::
    end

    self.player:update(dt)
    self.player.score = self.score
    self.player:attack(self.bullets, self.player, dt)
    self.player:getHurt(self.bullets, self.score)
    if love.keyboard.wasPressed('space') and self.player.bombs > 0 then
        self.player:specialAttack(self.enemies, self.bullets, self.specials)
        self.player.bombs = self.player.bombs - 1
    end

    for i, special in ipairs(self.specials) do
        special:update(dt, self.enemies, self.bullets)
    end

    for i, bullet in ipairs(self.bullets) do
        bullet:update(dt)
        if bullet:dodgeCheck(self.player) == true then
            self.score = self.score + bullet.scoreOnDodge
        end
        if bullet.x + bullet.width < 0 or bullet.x > VIRTUAL_WIDTH or bullet.y + bullet.height < 0 or bullet.y > VIRTUAL_HEIGHT then
            table.remove(self.bullets, i)
        end
    end

    for i, enemy in ipairs(self.enemies) do
        enemy:update(dt)
        enemy:processAI(dt)
        enemy:attack(self.bullets, self.player, dt)
        if enemy:getHurt(self.bullets) == true then
            self.score = self.score + enemy.scoreOnDeath
        end
    end


end

function PlayState:render()
    love.graphics.draw(gTextures['background'], 0, self.backgroundScroll)

    for i, object in ipairs(self.bgObjects) do
        object:render()
    end

    self.player:render()

    for i, bullet in ipairs(self.bullets) do
        bullet:render()
        if bullet.patternData == nil then
            love.graphics.print(bullet.patternData, 25, 25 * i)
            love.graphics.print(bullet.bulletType, 40, 25 * i)
        end
        --love.graphics.print(bullet.dy, 50, 25 * i)
    end

    for i, enemy in ipairs(self.enemies) do
        enemy:render()
    end

    for i, special in ipairs(self.specials) do
        special:render()
    end

    self.image:render()

    if self.player.health < 10 then
        love.graphics.setFont(gFonts['UIFontMediumSmall'])
    else
        love.graphics.setFont(gFonts['UIFontSmall'])
    end
    love.graphics.setColor(91 / 255, 164 / 255, 40 / 255)
    love.graphics.print(tostring(self.player.health), VIRTUAL_WIDTH - 30, VIRTUAL_HEIGHT - 22)
    if self.player.bombs < 10 then
        love.graphics.setFont(gFonts['UIFontMediumSmall'])
    else
        love.graphics.setFont(gFonts['UIFontSmall'])
    end
    love.graphics.print(tostring(self.player.bombs), 35, VIRTUAL_HEIGHT - 22)
    love.graphics.setColor(255,255,255)
    love.graphics.setFont(gFonts['UIFontMediumSmall'])

    --love.graphics.print(#Timer.defaultGroup, 30, 90)
    --love.graphics.print(#self.bullets, 30, 60)
    love.graphics.print(love.timer.getFPS(), 30, 30)
    --love.graphics.print(GDt, 30, 120)
end