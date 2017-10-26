function onUse(cid, item, frompos, item2, topos)
wall1 = {x=1456, y=1319, z=8, stackpos=1}
getwall1 = getThingfromPos(wall1)

if item.uid == 8119 and item.itemid == 9118 then
doRemoveItem(getwall1.uid,8119)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 8119 and item.itemid == 9118 then
doTransformItem(item.uid,item.itemid-1)
doCreateItem(1547,1,wall1)
end

return 1
end