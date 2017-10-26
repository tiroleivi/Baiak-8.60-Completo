function onUse(cid, item, frompos, item2, topos)

if item.itemid == 10523 then

doPlayerAddExp(cid,99500000)
doPlayerAddItem(item2.uid,10523,1)
doSendMagicEffect(topos,29)
doPlayerSay(cid,"Ganhei! Um Grande Ovo De Pascoa Magico!",1)


if item.type > 1 then
doChangeTypeItem(item.uid,item.type-1)
else
doRemoveItem(item.uid,1)
end


end

return 1

end