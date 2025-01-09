Entity = Class{}

function Entity:init(def)
    self.movingDirection = 'down'

    self.name = def.name

    self.animations = self:createAnimations(ENTITY_DEFS[self.name].animation)
    self.data = ENTITY_DEFS[self.name].data

    self.x = def.x
    self.y = def.y
    self.width = self.data.width
    self.height = self.data.height

    self.health = self.data.hp
    self.scoreOnDeath = self.data.scoreOnDeath
    self.hittedBySpecial = true

    self.shotingEnable = false
    self.patternData = ENTITY_DEFS[self.name].patterns
    self.timesShoted = 0
    self.timeToShot = 0
    self.timeSinceLastShot = 0
end

function Entity:changeState(name)
    self.stateMachine:change(name)
end

function Entity:changeAnimation(name)
    self.currentAnimation = self.animations[name]
end

function Entity:getAnimation()
    return self.currentAnimation
end

function Entity:createAnimations(animations)
    local animationsReturned = {}

    for k, animationDef in pairs(animations) do
        animationsReturned[k] = Animation {
            texture = animationDef.texture or 'brokenTexture',
            frames = animationDef.frames,
            interval = animationDef.interval
        }
    end

    return animationsReturned
end

function Entity:processAI(dt)
    self.stateMachine:processAI(dt)
end

function Entity:update(dt)
    self.currentAnimation:update(dt)
    self.stateMachine:update(dt)
end

function Entity:render()
    self.stateMachine:render()
end

function Entity:attack(bulletsTable, player, dt)
    if self.health <= 0 then
        return
    end

    if self.shotingEnable then
        if self.timesShoted < self.patternData.repeatShot then
            if self.timeToShot >= self.patternData.fireRate then
                for k, bullet in pairs(self.patternData.bullets) do
                    local newBullet = Bullet {
                        bullet = bullet.bullet,
                        x = (self.x + self.width / 2) - (bullet.width / 2) - bullet.xLeft + bullet.xRight,
                        y = (self.y + self.height / 2) - (bullet.height / 2) - bullet.yUp + bullet.yDown,
                        dx = bullet.dx,
                        dy = bullet.dy,
                    }
                    table.insert(bulletsTable, newBullet)
                end
                self.timeSinceLastShot = 0
                self.timeToShot = 0
                self.timesShoted = self.timesShoted + 1
            end
        else
            if self.timeSinceLastShot >= self.patternData.wait then
                self.timesShoted = 0
            end
        end
        self.timeToShot = self.timeToShot + dt
        self.timeSinceLastShot = self.timeSinceLastShot + dt
    end
end

function Entity:getHurt(bulletsTable)
    for i, bullet in ipairs(bulletsTable) do
        if bullet.bulletType == 'player' and self.health > 0 then
            if not (bullet.x > self.x + self.width or self.x > bullet.x + bullet.width or
            bullet.y > self.y + self.height or self.y > bullet.y + bullet.height) then
                gSounds['Hit']:stop()
                gSounds['Hit']:play()
                self.health = self.health - bullet.damage
                table.remove(bulletsTable, i)
                if self.health <= 0 then
                    gSounds['Explosion']:stop()
                    gSounds['Explosion']:play()
                    self:changeState('explode')
                    return true
                else
                    return false
                end
            end
        end
    end
end