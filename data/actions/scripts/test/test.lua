function onUse(cid, item, fromPosition, itemEx, toPosition)

local msg = "Parabens voce conseguiu utilizar este item."

if getPlayerLevel(cid) <= 900 then

doSendMagicEffect (getThingPos(cid), 14)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, msg)
doPlayerAddMana(cid, -10000, false)
doCreatureAddHealth (cid, 1000)

else
doSendMagicEffect (getThingPos(cid), 2)
doPlayerSendCancel (cid, "Voce precisa de um level superior para usar este item")
end

return true
end