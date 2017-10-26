local teleportPos = {x = 205, y = 241, z = 7, stackpos = 1} -- Posição em que se abre o teleport
local teleportId = 1387

function onTime()
    for i = 1, 255 do
        teleportPos.stackpos = i


        if getThingFromPos(teleportPos).itemid == teleportId then


            doRemoveItem(getThingFromPos(teleportPos).uid, 1)
        end
    end
    return true
end