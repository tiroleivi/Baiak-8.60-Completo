--Configurations
local ITEM_NUGGET = 2157 -- Nugget ID
--End of Configs

function onUse(cid, item, fromPosition, itemEx, toPosition)
if item.itemid == ITEM_GOLD_COIN and item.type == ITEMCOUNT_MAX then --Gold Coin to Platinum Coin
doChangeTypeItem(item.uid, item.type - item.type)
doPlayerAddItem(cid, ITEM_PLATINUM_COIN, 1)
doSendAnimatedText(fromPosition, "Platinum", TEXTCOLOR_LIGHTBLUE)
elseif item.itemid == ITEM_PLATINUM_COIN and item.type == ITEMCOUNT_MAX then --Platinum Coin to Crystal Coin
doChangeTypeItem(item.uid, item.type - item.type)
doPlayerAddItem(cid, ITEM_CRYSTAL_COIN, 1)
doSendAnimatedText(fromPosition, "Crystal!", TEXTCOLOR_TEAL)
elseif item.itemid == ITEM_PLATINUM_COIN and item.type < ITEMCOUNT_MAX then --Platinum Coin to Gold Coin
doChangeTypeItem(item.uid, item.type - 1)
doPlayerAddItem(cid, ITEM_GOLD_COIN, ITEMCOUNT_MAX)
doSendAnimatedText(fromPosition, "Gold", TEXTCOLOR_YELLOW)
elseif item.itemid == ITEM_CRYSTAL_COIN and item.type < ITEMCOUNT_MAX then --Crystal Coin to Platinum Coin
doChangeTypeItem(item.uid, item.type - 1)
doPlayerAddItem(cid, ITEM_PLATINUM_COIN, ITEMCOUNT_MAX)
doSendAnimatedText(fromPosition, "Platinum", TEXTCOLOR_LIGHTBLUE)
elseif item.itemid == ITEM_CRYSTAL_COIN and item.type == ITEMCOUNT_MAX then --Crystal Coin to Nugget
doChangeTypeItem(item.uid, item.type - item.type)
doPlayerAddItem(cid, ITEM_NUGGET,1)
doSendAnimatedText(fromPosition, "Nugget", TEXTCOLOR_YELLOW)
else
return FALSE
end
return TRUE
end