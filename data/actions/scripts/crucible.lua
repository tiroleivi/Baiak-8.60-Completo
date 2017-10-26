function onUse (cid, item)


if not doPlayerRemoveMoney(cid,60000000) then
 doPlayerSendCancel(cid, "Voce nao possui dinheiro suficiente.")
 doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
return true
end

	  doSendMagicEffect(getPlayerPosition(cid), CONST_ME_BATS)
      doPlayerAddItem(cid, 8299, 1)
            
      end