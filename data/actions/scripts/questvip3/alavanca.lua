function onUse(cid, item, fromPosition, itemEx, toPosition)

piece1pos = {x=1297, y=481, z=7, stackpos=1}
local tempo = 2*60*1000 -- tempo para parede voltar
getpiece1 = getThingfromPos(piece1pos)
if item.uid == 11221 and item.itemid == 1945 and getpiece1.itemid == 1304 then
doRemoveItem(getpiece1.uid,1)
doTransformItem(item.uid,item.itemid+1)
doPlayerSendTextMessage(cid,22,"acho que ouvi um barulho, uma passagem deve ter se aberto.")
addEvent(doCreateItem, tempo, 1304, piece1pos)
addEvent(doTransformItem, tempo, item.uid,1945)
elseif item.uid == 11221 then
doTransformItem(item.uid,item.itemid-1)
addEvent(doCreateItem, 2*60*1000, item.itemid, piece1pos)
else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end