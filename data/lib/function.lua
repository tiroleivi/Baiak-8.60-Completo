function getPlayerWorldId(cid)
if not(isPlayer(cid)) then
return false
end

local pid = getPlayerGUID(cid)
local worldPlayer = 0

local result_plr = db.getResult("SELECT * FROM `players` WHERE `id` = "..pid..";")
if(result_plr:getID() ~= -1) then
worldPlayer = tonumber(result_plr:getDataInt("world_id"))
result_plr:free()
else
return false
end

return worldPlayer
end