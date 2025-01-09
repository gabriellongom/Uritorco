Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

require 'src.Animation'
require 'src.constants'
require 'src.globals'
require 'src.StateMachine'
require 'src.Util'

require 'src.entities.player.Player'

require 'src.entities.Entity'
require 'src.entities.Entity_defs'

require 'src.entities.bullets.Bullet'
require 'src.entities.bullets.Bullet_defs'

require 'src.entities.Pattern'

require 'src.entities.Special'

require 'src.world.Generator'
require 'src.world.Level_defs'

require 'src.gui.Selection'
require 'src.gui.Image'

require 'src.states.BaseState'
require 'src.states.StackState'

require 'src.states.entity.EntityBaseState'
require 'src.states.entity.EntityStillState'
require 'src.states.entity.EntityMovingState'
require 'src.states.entity.EntityExplodeState'
require 'src.states.entity.PlayerStillState'
require 'src.states.entity.PlayerStillFocusState'
require 'src.states.entity.PlayerMovingState'
require 'src.states.entity.PlayerMovingFocusState'
require 'src.states.entity.PlayerExplodeState'
require 'src.states.entity.BulletFlyingState'

require 'src.states.game.TitleState'
require 'src.states.game.TitleMenuState'
require 'src.states.game.PlayState'
require 'src.states.game.PauseState'
require 'src.states.game.ScoreBoardState'
require 'src.states.game.IntermisionState'
require 'src.states.game.GameOverState'
require 'src.states.game.DemoEndState'

gTextures = {
    ['brokenTexture'] = love.graphics.newImage('graphics/brokenTexture.png'),
    ['mountain'] = love.graphics.newImage('graphics/TitleScreen/Mountain.png'),
    ['title'] = love.graphics.newImage('graphics/TitleScreen/Uritorco.png'),
    ['pressEnter'] = love.graphics.newImage('graphics/TitleScreen/PressEnter.png'),
    ['cursor'] = love.graphics.newImage('graphics/TitleScreen/Cursor.png'),
    ['titleMenuScreen'] = love.graphics.newImage('graphics/TitleScreen/TitleMenuScreen.png'),
    ['background'] = love.graphics.newImage('graphics/PlayScreen/BaseBackground.png'),
    ['x32backgroundDecoration'] = love.graphics.newImage('graphics/PlayScreen/x32backgroundDecoration.png'),
    ['x64backgroundDecoration'] = love.graphics.newImage('graphics/PlayScreen/x64backgroundDecoration.png'),
    ['playerUI'] = love.graphics.newImage('graphics/PlayScreen/PlayerUI.png'),
    ['fullScreen'] = love.graphics.newImage('graphics/PlayScreen/FullScreen.png'),
    ['brokenFullScreen'] = love.graphics.newImage('graphics/PlayScreen/BrokenFullScreen.png'),
    ['x16bulletSheet'] = love.graphics.newImage('graphics/PlayScreen/x16bulletSheet.png'),
    ['x32bulletSheet'] = love.graphics.newImage('graphics/PlayScreen/x32bulletSheet.png'),
    ['x32explosion'] = love.graphics.newImage('graphics/PlayScreen/x32explosion.png'),
    ['playerBulletSheet'] = love.graphics.newImage('graphics/PlayScreen/playerBulletSheet.png'),
    ['playerSpecialAttack'] = love.graphics.newImage('graphics/PlayScreen/PlayerSpecial.png'),
    ['playerShip'] = love.graphics.newImage('graphics/PlayScreen/PlayerShip.png'),
    ['x32EnemyShips'] = love.graphics.newImage('graphics/PlayScreen/x32EnemySheet.png'),
    ['x48EnemyShips'] = love.graphics.newImage('graphics/PlayScreen/x48EnemySheet.png'),
    ['boss1Ship'] = love.graphics.newImage('graphics/PlayScreen/Boss1.png'),
}

gFrames = {
    ['brokenTexture'] = GenerateQuads(gTextures['brokenTexture'], 16, 16),
    ['x32backgroundDecoration'] = GenerateQuads(gTextures['x32backgroundDecoration'], 32, 32),
    ['x64backgroundDecoration'] = GenerateQuads(gTextures['x64backgroundDecoration'], 64, 64),
    ['x16bulletSheet'] = GenerateQuads(gTextures['x16bulletSheet'], 16, 16),
    ['x32bulletSheet'] = GenerateQuads(gTextures['x32bulletSheet'], 32, 32),
    ['x32explosion'] = GenerateQuads(gTextures['x32explosion'], 32, 32),
    ['playerBulletSheet'] = GenerateQuads(gTextures['playerBulletSheet'], 8, 8),
    ['playerShip'] = GenerateQuads(gTextures['playerShip'], 32, 32),
    ['x32EnemyShips'] = GenerateQuads(gTextures['x32EnemyShips'], 32, 32),
    ['x48EnemyShips'] = GenerateQuads(gTextures['x48EnemyShips'], 48, 48),
    ['boss1Ship'] = GenerateQuads(gTextures['boss1Ship'], 77, 77),
}

gFonts = {
    ['TitleFontSmall'] = love.graphics.newFont('fonts/TitleFont.ttf', 32),
    ['TitleFontMedium'] = love.graphics.newFont('fonts/TitleFont.ttf', 48),
    ['TitleFontLarge'] = love.graphics.newFont('fonts/TitleFont.ttf', 64),
    ['UIFontSmall'] = love.graphics.newFont('fonts/UIFont.ttf', 16),
    ['UIFontMediumSmall'] = love.graphics.newFont('fonts/UIFont.ttf', 24),
    ['UIFontMedium'] = love.graphics.newFont('fonts/UIFont.ttf', 32),
    ['UIFontMediumLarge'] = love.graphics.newFont('fonts/UIFont.ttf', 40),
    ['UIFontLarge'] = love.graphics.newFont('fonts/UIFont.ttf', 48),
}

gSounds = {
    ['MenuIn'] = love.audio.newSource('sounds/MenuIn.wav', 'static'),
    ['Cursor'] = love.audio.newSource('sounds/MoveCursor.wav', 'static'),
    ['Select'] = love.audio.newSource('sounds/Select.wav', 'static'),
    ['Hit'] = love.audio.newSource('sounds/Hit.wav', 'static'),
    ['Explosion'] = love.audio.newSource('sounds/Explosion.wav', 'static'),
    ['Special'] = love.audio.newSource('sounds/Special.wav', 'static'),
    ['GrowIntroBGM'] = love.audio.newSource('sounds/GrowIntroBGM.mp3', 'static'),
    ['IntroBGM'] = love.audio.newSource('sounds/IntroBGM.mp3', 'stream'),
    ['GrowGameBGM'] = love.audio.newSource('sounds/GrowGameBGM.mp3', 'static'),
    ['GameBGM'] = love.audio.newSource('sounds/GameBGM.mp3', 'stream'),
}