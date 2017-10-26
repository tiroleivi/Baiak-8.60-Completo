function onUse(cid, item, fromPosition, itemEx, toPosition)
local config = {}
config.stamina = 42 * 60 * 1000
if(getPlayerStamina(cid) >= config.stamina) then
doPlayerSendCancel(cid, "Your stamina is already full.")
elseif(not isPremium(cid)) then
doPlayerSendCancel(cid, "You must have a premium account.")
else
doPlayerSetStamina(cid, config.stamina)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your stamina has been refilled.")
doSendMagicEffect(getThingPos(cid), 30)
end
return true
end 