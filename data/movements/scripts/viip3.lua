local storage = 2313123 -- storage do bau
function onStepIn(cid, item, position, fromPosition)
    if getPlayerStorageValue(cid, storage) == -1 then
        doTeleportThing(cid, fromPosition, true)
        doPlayerSendCancel(cid, "Area exclusiva para players VIP3.")
    else
        doPlayerSendCancel(cid, "Bem vindo a VIP3.")
    end
return true
end