-- demon helmet by Alfred

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 20002 then
   		queststatus = getPlayerStorageValue(cid,1604)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Voce recebeu uma Secret's Blade.")
   			doPlayerAddItem(cid,0,1)
   			setPlayerStorageValue(cid,1604,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Voce ja pegou sua recompensa.")
   		end
      	else
		return 0
   	end

   	return 1
end
