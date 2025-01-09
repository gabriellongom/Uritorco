Pattern = Class{}

function Pattern:init(def)
    self.bullet = def.entity
    self.patternArray = def.patternArray
    self.index = 1
    self.actualTimer = false
    self.patternsActivated = {}
    self.phaseComplete = false
end

function Pattern:update(dt)
    if self.patternArray ~= nil then
        local pattern = self.patternArray[self.index]
        local params = pattern[2]
        local phaseComplete = self.phaseComplete
        self.phaseComplete = false
        --print(self)
        --print(self.index)
        --print(pattern[1])

        if self.actualTimer == false then
            self.actualTimer = true
            --print("actualTimer check passed")
            table.insert(self.patternsActivated, false)

            if self.patternsActivated[self.index] == false then
                --print("patternsActivated check passed")
                self.patternsActivated[self.index] = true
                _G[pattern[1]](self.bullet, params,phaseComplete)
                
                if self.patternArray[self.index + 1] ~= nil then
                    --print("patternArray index check passed")
                    self.index = self.index + 1
                end
            end
        end
        if phaseComplete == true then
            --print("phaseComplete check passed")
            self.actualTimer = false
        end
    end
end

function Wait(entity,params--[[t]])
    local t = params[1]
    --print 'waiting'
    Timer.after(t,function ()
        --print 'waiting complete'
        entity.pattern.phaseComplete = true
    end)
end

function AimToPlayer(entity,params--[[speed]])
    local player = assert(GPlayer)
    local speed = params[1]

    ---@diagnostic disable-next-line: deprecated
    local angle = math.atan2(((player.hitboxY + player.hitboxHeight / 2) - (entity.y + entity.height / 2)), ((player.hitboxX + player.hitboxWidth / 2) - (entity.x + entity.width / 2)))
    local cos = math.cos(angle)
    local sin = math.sin(angle)

    entity.dx = speed * cos
    entity.dy = speed * sin

    entity.pattern.phaseComplete = true
end

function AimToPlayerAndAccelerate(entity,params--[[s, t, m]])
    local player = assert(GPlayer)
    local s = params[1]
    local t = params[2]
    local m = params[3]

    ---@diagnostic disable-next-line: deprecated
    local angle = math.atan2(((player.hitboxY + player.hitboxHeight / 2) - (entity.y + entity.height / 2)), ((player.hitboxX + player.hitboxWidth / 2) - (entity.x + entity.width / 2)))
    local cos = math.cos(angle)
    local sin = math.sin(angle)

    entity.dx = s * cos
    entity.dy = s * sin

    Timer.tween(t,{
        [entity] = {dx = entity.dx * m, dy = entity.dy * m}
    })

    entity.pattern.phaseComplete = true
end

function Move(x,y)
    
end

function Tween(x,y,t,tp)
    
end

function Accelerate(entity,params--[[dx,dy,t]])
    local dx = params[1]
    local dy = params[2]
    local t = params[3]
    Timer.tween(t,{
        [entity] = {dx = dx, dy = dy}
    })
    entity.pattern.phaseComplete = true
end
