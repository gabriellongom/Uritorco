function GenerateQuads(atlas, tilewidth, tileheight)
    local sheetWidth = atlas:getWidth() / tilewidth
    local sheetHeight = atlas:getHeight() / tileheight

    local sheetCounter = 1
    local spritesheet = {}

    for y = 0, sheetHeight - 1 do
        for x = 0, sheetWidth - 1 do
            spritesheet[sheetCounter] =
                love.graphics.newQuad(x * tilewidth, y * tileheight, tilewidth,
                tileheight, atlas:getDimensions())
            sheetCounter = sheetCounter + 1
        end
    end

    return spritesheet
end

function loadHighScores()
    love.filesystem.setIdentity('uritorco')

    if not love.filesystem.getInfo('uritorcoHighScores.lst') then
        local scores = ''
        for i = 20, 1, -1 do
            scores = scores .. tostring(-1) .. '\n'
        end

        love.filesystem.write('uritorcoHighScores.lst', scores)
    end

    local counter = 1

    local scores = {}

    for i = 1, 20 do
        scores[i] = {
            score = nil
        }
    end

    for line in love.filesystem.lines('uritorcoHighScores.lst') do
        scores[counter].score = tonumber(line)
        counter = counter + 1
    end

    return scores
end