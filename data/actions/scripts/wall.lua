function onUse(cid, item, frompos, item2, topos)
if item.uid == 5352 then
queststatus = getPlayerStorageValue(cid,5352)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um(a) lance of gods. Uma antiga arma dos deuses de poder inimaginável use-a com sabedoria.")
doSendMagicEffect(getThingPos(cid),39)
item_uid = doPlayerAddItem(cid,10067,1)
setPlayerStorageValue(cid,5352,1)

else
doPlayerSendTextMessage(cid,22,"Não há nada aqui.")
end
else
return 0
end
return 1
end