-- demon helmet by Alfred

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 3399 then
   		queststatus = getPlayerStorageValue(cid,1604)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Norseman Doll.")
   			doPlayerAddItem(cid,8982,1)
   			setPlayerStorageValue(cid,1604,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
      	else
		return 0
   	end

   	return 1
end