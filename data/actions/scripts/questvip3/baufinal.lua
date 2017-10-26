function onUse(cid, item, frompos, item2, topos)
if item.uid == 39922 then
queststatus = getPlayerStorageValue(cid,2313123)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voce completou a quest.")
doPlayerAddItem(cid,8982,1)
setPlayerStorageValue(cid,2313123,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
end