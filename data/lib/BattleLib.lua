_Lib_Battle_Info = {
Reward = {
exp = {true, 100}, items = {true, 2160, 10}, vip_days = {true, 3}
},
TeamOne = {name = "Black Assassins", storage = 140120, pos = {x=538,y=203,z=6}},
TeamTwo = {name = "Red Barbarians",storage = 140121,pos = {x=553,y=203,z=6}},
storage_count = 180400,
tpPos = {x=186, y=248, z=7},
limit_Time = 10 -- limite de tempo para adentrar o evento
}
function resetBattle()
setGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage, 0)
setGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage, 0)
end
function OpenWallBattle()
local B = {
{1543,{x=547, y=214, z=6, stackpos = 1}},
{1543,{x=547, y=215, z=6, stackpos = 1}},
{1543,{x=547, y=216, z=6, stackpos = 1}},
{1543,{x=547, y=217, z=6, stackpos = 1}}
}
for i = 1, #B do
if getTileItemById(B[i][2], B[i][1]).uid == 0 then
doCreateItem(B[i][1], 1, B[i][2])
else
doRemoveItem(getThingfromPos(B[i][2]).uid,1)
end
end
end
function doBroadCastBattle(type, msg)
for _, cid in pairs(getPlayersOnline()) do
if getPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage) >= 1 or getPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage) >= 1 then
doPlayerSendTextMessage(cid,type,msg)
end
end
end
function removeBattleTp()
local t = getTileItemById(_Lib_Battle_Info.tpPos, 1387).uid
return t > 0 and doRemoveItem(t) and doSendMagicEffect(_Lib_Battle_Info.tpPos, CONST_ME_POFF)
end
function getWinnersBattle(storage)
local str, c = "" , 0
for _, cid in pairs(getPlayersOnline()) do
if getPlayerStorageValue(cid, storage) == 1 then
if _Lib_Battle_Info.Reward.exp[1] == true then doPlayerAddExperience(cid, _Lib_Battle_Info.Reward.exp[2]) end
if _Lib_Battle_Info.Reward.items[1] == true then doPlayerAddItem(cid, _Lib_Battle_Info.Reward.items[2], _Lib_Battle_Info.Reward.items[3]) end
if _Lib_Battle_Info.Reward.premium_days[1] == true then doPlayerAddPremiumDays(cid, _Lib_Battle_Info.Reward.premium_days[2]) end
doRemoveCondition(cid, CONDITION_OUTFIT)
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
setPlayerStorageValue(cid, storage, -1)
c = c+1 
end
end
str = str .. ""..c.." Player"..(c > 1 and "s" or "").." from team "..(getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage) == 0 and _Lib_Battle_Info.TeamTwo.name or _Lib_Battle_Info.TeamOne.name).." won the event battlefield!"
resetBattle()
OpenWallBattle()
return doBroadcastMessage(str)
end
function CheckEvent(delay)
if delay > 0 and getGlobalStorageValue(_Lib_Battle_Info.storage_count) > 0 then
doBroadcastMessage("[BattleField Event] We are waiting "..getGlobalStorageValue(_Lib_Battle_Info.storage_count).." players to Battlefield starts")
elseif delay == 0 and getGlobalStorageValue(_Lib_Battle_Info.storage_count) > 0 then
for _, cid in pairs(getPlayersOnline()) do
if getPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage) >= 1 or getPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage) >= 1 then
doRemoveCondition(cid, CONDITION_OUTFIT)
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
setPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage, -1)
setPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage, -1)
end
end
doBroadcastMessage("The event cannot be started because not had enough players.")
setGlobalStorageValue(_Lib_Battle_Info.storage_count, 0)
resetBattle()
removeBattleTp()
end
addEvent(CheckEvent, 60000, delay-1)
end