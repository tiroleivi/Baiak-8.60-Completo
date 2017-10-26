--[[ by EddyHavoc Tibiaking.com ]]--

function onLogin(cid)


if getPlayerStorageValue(cid, 13640) - os.time() > 0 then

setPlayerStorageValue(cid, 9898, 1)

end


local pos = {x = 160, y = 54, z = 7} -- posiçao do templo.  


function EddyHavoc(cid)

if isPlayer(cid) then	

db.executeQuery("UPDATE `players` SET `name` = '"..string.sub(getCreatureName(cid), 7).."' WHERE `id` = "..getPlayerGUID(cid)..";")

doRemoveCreature(cid)

end

end


if getPlayerStorageValue(cid, 9898) == 1 and getPlayerStorageValue(cid, 13640) - os.time() < 1 or getPlayerStorageValue(cid, 13640) - os.time() == 0 then

doTeleportThing(cid, pos)  

doPlayerPopupFYI(cid, "Sua vip Account acabou.")

setPlayerStorageValue(cid, 9898, -1)

if string.find(tostring(getCreatureName(cid)),"[[Vip]]") then	

addEvent(EddyHavoc, 3*1000, cid)

end

end

return TRUE

end