function onUse(cid, item, fromPosition, itemEx, toPosition)

if(item.actionid == 65500) then
if getTopCreature({x=32464,y=32378,z=5}).uid > 0 then
doTeleportThing(getTopCreature({x=32464,y=32378,z=5}).uid, {x=32526,y=32421,z=5})
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
else
doPlayerSendCancel(cid, "Você precisa estar em cima do tapete.")
return true
end

elseif (item.actionid == 65501) then
if getTopCreature({x=32526,y=32421,z=5}).uid > 0 then
doTeleportThing(getTopCreature({x=32526,y=32421,z=5}).uid, {x=32464,y=32378,z=5})
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
else
doPlayerSendCancel(cid, "Você precisa estar em cima do tapete.")
end
end
return true
end