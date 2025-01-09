Generator = Class{}

function Generator:GenerateWave(level, enemTable, wave)
    if #enemTable == 0 then
        local wavesData = LEVEL_DEFS[level].waves[wave]
        for k, enemyData in pairs(wavesData) do
            local enemy = Entity {
                name = enemyData.name,
                x = enemyData.x,
                y = 0
            }

            Timer.tween(1, {
                [enemy] = {y = enemyData.y},
            })

            :finish(function ()
                enemy.shotingEnable = true
                enemy.hittedBySpecial = false
            end)

            enemy.stateMachine = StateMachine {
                ['still'] = function () return EntityStillState(enemy) end,
                ['moving'] = function () return EntityMovingState(enemy) end,
                ['explode'] = function () return EntityExplodeState(enemy, enemTable) end,
            }

            enemy.stateMachine:change('still')

            table.insert(enemTable, enemy)
        end
    end
end

function Generator:GenerateBgObject(bgObjectTable)
    if math.random(1,5) == 1 then
        local nOfFrame = math.random(1,2)
        local texture
        local frame

        if nOfFrame == 1 then
            texture = gTextures['x32backgroundDecoration']
            frame = gFrames['x32backgroundDecoration']
        elseif nOfFrame == 2 then
            texture = gTextures['x64backgroundDecoration']
            frame = gFrames['x64backgroundDecoration']
        end

        local frameN = math.random(1,#frame)

        local object = Image {
            x = math.random(-48,VIRTUAL_WIDTH + 48),
            y = -64,
            texture = texture,
            frame = frame,
            frameN = frameN
        }

        table.insert(bgObjectTable, object)
    end
end