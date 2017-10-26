function onDeath(cid, corpse, deathList)
if (getPlayerSlotItem(cid, 2).itemid == 11387) and getPlayerSkullType(cid) >= 4 then
doPlayerRemoveItem(cid, 11387, 0)
doCreatureSetDropLoot(cid, false)  
end
return true
end