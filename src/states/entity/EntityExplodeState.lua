EntityExplodeState = Class{__includes = EntityBaseState}

function EntityExplodeState:init(entity, enemyTable)
    self.entity = entity
    self.enemyTable = enemyTable

    self.entity:changeAnimation('explode')

    Timer.after(1, function ()
        for i, enemy in ipairs(self.enemyTable) do
            if enemy == self.entity then
                table.remove(self.enemyTable, i)
            end
        end
    end)

end