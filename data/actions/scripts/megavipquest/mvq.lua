function onUse(cid, item, frompos, item2, topos)

if item.uid == 6990 and item.itemid == 1945 then
player1pos = {x=1225, y=1191, z=7, stackpos=253} <-- Colque Onde Eles estarão antes de ir para a quest
player1 = getThingfromPos(player1pos)

player2pos = {x=1224, y=1191, z=7, stackpos=253}
player2 = getThingfromPos(player2pos)

player3pos = {x=1223, y=1191, z=7, stackpos=253}
player3 = getThingfromPos(player3pos)

player4pos = {x=1222, y=1191, z=7, stackpos=253}
player4 = getThingfromPos(player4pos)


if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 then
queststatus1 = getPlayerStorageValue(player1.uid,7004)
queststatus2 = getPlayerStorageValue(player2.uid,7004)
queststatus3 = getPlayerStorageValue(player3.uid,7004)
queststatus4 = getPlayerStorageValue(player4.uid,7004)

if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 and queststatus4 == -1 then
nplayer1pos = {x=1361, y=1295, z=7} <-- Colque para onde eles vao ao usar a alavanca
nplayer2pos = {x=1360, y=1295, z=7}
nplayer3pos = {x=1359, y=1295, z=7}
nplayer4pos = {x=1358, y=1295, z=7}

doSendMagicEffect(player1pos,2)
doSendMagicEffect(player2pos,2)
doSendMagicEffect(player3pos,2)
doSendMagicEffect(player4pos,2)

doTeleportThing(player1.uid,nplayer1pos)
doTeleportThing(player2.uid,nplayer2pos)
doTeleportThing(player3.uid,nplayer3pos)
doTeleportThing(player4.uid,nplayer4pos)

doSendMagicEffect(nplayer1pos,10)
doSendMagicEffect(nplayer2pos,10)
doSendMagicEffect(nplayer3pos,10)
doSendMagicEffect(nplayer4pos,10)

doTransformItem(item.uid,item.itemid+1)
else
doPlayerSendCancel(cid,"Alguem em sua equipe já fez esta missão.")
end
else
doPlayerSendCancel(cid,"Você precisa de quatro jogadores para esta missão.")
end

elseif item.uid ==7711 and item.itemid == 1946 then
if getPlayerAccess(cid) > 0 then
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry, not possible.")
end
else
return 0
end

return 1
end
