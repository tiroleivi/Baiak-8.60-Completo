function onUse(cid, item, fromPosition, itemEx, toPosition)
   	if item.uid == 2210 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a mega vip staff")
   			doPlayerAddItem(cid,2494,1)
   			setPlayerStorageValue(cid,6076,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
   	elseif item.uid == 2211 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a mega vip sword.")
   			doPlayerAddItem(cid,2400,1)
   			setPlayerStorageValue(cid,6076,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
   	elseif item.uid == 2212 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a mega vip club.")
   			doPlayerAddItem(cid,2431,1)
   			setPlayerStorageValue(cid,6076,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
		end
   	elseif item.uid == 2213 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a mega vip bow and shiver vip arrow.")
   			doPlayerAddItem(cid,2431,1)
   			setPlayerStorageValue(cid,6076,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
		end

	end
   	return 1
end
