function onUse (cid, item)
      doCreateMonster("Rat", getPlayerPosition(cid))
      doPlayerRemoveMoney(cid,3000000)
      doPlayerExhaust(cid, 3600)
      else
          doPlayerSendCancel(cid, "Voce nao possui dinheiro suficiente. Ou utilizou o item a menos de 1 hora")
          doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
      end
	  return true
	end