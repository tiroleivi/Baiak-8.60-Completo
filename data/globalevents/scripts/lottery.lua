local config = {
lottery_hour = "3 Hours", -- Time to next lottery (real time you set on globalevents.xml, its only for broadcast message.)
rewards_id = {2494, 2472, 2514, 2160}, -- Rewards ID
crystal_counts = 10, -- used only if on rewards_id you have crystal coins (ID: 2160).
website = "yes" -- Do you have `lottery` table in your database?
}
function onThink(interval, lastExecution)
local players = getPlayersOnline()
local list = {}
for i, tid in ipairs(players) do
list = tid
end
local winner = list[math.random(1, #list)]
local random_item = config.rewards_id[math.random(1, #config.rewards_id)]
local item_name = getItemNameById(random_item)
local world = tonumber(getPlayerWorldId(winner))
if(random_item == 2160) then
doPlayerAddItem(winner, random_item, config.crystal_counts)
doBroadcastMessage('[LOTTERY SYSTEM] Winner: '.. getCreatureName(winner) ..', Reward: '.. config.crystal_counts ..' '.. item_name ..'s! Congratulations! (Next Lottery in '.. config.lottery_hour ..')')
else
doBroadcastMessage('[LOTTERY SYSTEM] Winner: '.. getCreatureName(winner) ..', Reward: '.. item_name ..'! Congratulations! (Next Lottery in '.. config.lottery_hour ..')')
doPlayerAddItem(winner, random_item, 1)
end
if(config.website == "yes") then
db.executeQuery("INSERT INTO `lottery` (`name`, `item`, `world_id`) VALUES ('".. getCreatureName(winner) .."', '".. item_name .."', '".. world .."');")
end
return TRUE
end