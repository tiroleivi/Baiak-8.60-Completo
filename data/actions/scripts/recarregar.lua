boots = {

[10021] = {money = 20000, new = 2640},

[10022] = {money = 40000, new = 9932}

 }




function onUse(cid,item)


if not boots[item.itemid] then

return false

elseif not doPlayerRemoveMoney(cid, boots[item.itemid].money) then

return doPlayerSendCancel(cid, "Voce precisa ter "..boots[item.itemid].money.." gps para regarregar sua bota.")

end


doRemoveItem(item.uid, 1)

doPlayerAddItem(cid, boots[item.itemid].new, 1)

doSendMagicEffect(getCreaturePosition(cid), 12)

doPlayerSendTextMessage(cid, 22, "Voce renovou sua "..getItemNameById(boots[item.itemid].new)..".")

end