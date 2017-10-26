--Configurations
local ITEM_NUGGET = 2157 -- Nugget ID
--End of Configs

function onUse(cid, item, fromPosition, itemEx, toPosition)
if item.itemid == ITEM_NUGGET then --Nugget to Crystal Coin
doChangeTypeItem(item.uid, item.type - 1)
doPlayerAddItem(cid, ITEM_CRYSTAL_COIN, ITEMCOUNT_MAX)
doSendAnimatedText(fromPosition, "Crystal", TEXTCOLOR_TEAL)
else
return FALSE
end
return TRUE
end