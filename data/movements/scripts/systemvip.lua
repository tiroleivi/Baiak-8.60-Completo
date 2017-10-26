function onStepIn(cid, item, position, fromPosition)
local config = {
msgDenied = "Voce nao e VIP DONATE !!! Para comprar Acesse : http://baiak-falkon24hrs.servegame.com/",
msgWelcome = "Bem Vindo a area VIP DONATE !"
}
if getPlayerStorageValue(cid, 13500) - os.time() <= 0 then
doTeleportThing(cid, fromPosition, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
return TRUE
end