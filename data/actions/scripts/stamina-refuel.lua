function onUse(cid, item, fromPosition, itemEx, toPosition)

    local cfg = {}

    cfg.refuel = 42 * 60 * 1000

    if(getPlayerStamina(cid) >= cfg.refuel) then

	    doPlayerSendCancel(cid, "Sua stamina ja esta cheia.")

    elseif(not isPremium(cid)) then

	    doPlayerSendCancel(cid, "Voce precisa ser premium account para usar esse item.")

    else

	    doPlayerSetStamina(cid, cfg.refuel)

	    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Sua stamina foi completada com sucesso.")
		
	    doRemoveItem(item.uid)

    end
	
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_FIREWORK_YELLOW)
	
    return true

end
