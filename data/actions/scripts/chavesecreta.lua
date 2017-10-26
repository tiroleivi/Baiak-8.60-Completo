-- demon helmet by Alfred

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 20003 then
   		queststatus = getPlayerStorageValue(cid,20004)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"Voce recebeu uma chave secreta! Ela abre uma porta que em seguida há 2 cachotes com bonus, mais ai é com voce descobrir onde fica.")
   			doPlayerAddItem(cid,0,1)
   			setPlayerStorageValue(cid,20004,1)
   		else
   			doPlayerSendTextMessage(cid,22,"Voce ja pegou sua chave")
   		end
      	else
		return 0
   	end

   	return 1
end
