function onUse(cid, item, frompos, item2, topos)

if item.itemid == 6541 then

doPlayerAddExp(cid,15000000)
doPlayerAddItem(item2.uid,6541,1)
doSendMagicEffect(topos,29)
doPlayerSay(cid,"Ganhei! Um Ovo De Pascoa Magico!",1)


if item.type > 1 then
doChangeTypeItem(item.uid,item.type-1)
else
doRemoveItem(item.uid,1)
end


end

return 1

end