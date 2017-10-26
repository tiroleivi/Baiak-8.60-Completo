local storages = {
name = 95672,
count = 95673,
maxcount = 95674,
}

local config = {
partycount = false, --- true ou false pra ativar/desativar que os kills dos membros da party contem pra voce
killdistance = 7 --- distancia que conta os kills
}


function onKill(cid, target, lastHit)
	if isMonster(target) and getPlayerStorageValue(cid, storages.maxcount) > 3 and (type(getCreatureMaster(target)) == 'nil' or getCreatureMaster(target) == target) and (not(isInParty(cid)) or config.partycount ~= true) then
		if getCreatureName(target):lower() == string.lower(getPlayerStorageValue(cid, storages.name)) then
			setPlayerStorageValue(cid, storages.count, getPlayerStorageValue(cid, storages.count) + 1)
			if getPlayerStorageValue(cid, storages.count) == getPlayerStorageValue(cid, storages.maxcount) then
				doPlayerSendTextMessage(cid, 19, "You finished your task.")
			elseif getPlayerStorageValue(cid, storages.count) < getPlayerStorageValue(cid, storages.maxcount) then
				doPlayerSendTextMessage(cid, 20, "Killed ".. getCreatureName(target) .."s [".. getPlayerStorageValue(cid, storages.count) .."/".. getPlayerStorageValue(cid, storages.maxcount) .."].")
			end
		end
	elseif isMonster(target) and (type(getCreatureMaster(target)) == 'nil' or getCreatureMaster(target) == target) and isInParty(cid) and config.partycount == true then
	leader = getPartyLeader(cid)	
	party = getPartyMembers(leader)
		for i = 1, #party do
		pid = party[i]
		if getDistanceBetween(getThingPos(target), getThingPos(pid)) < config.killdistance then
			if getPlayerStorageValue(pid, storages.maxcount) > 3 then
				if getCreatureName(target):lower() == string.lower(getPlayerStorageValue(pid, storages.name)) then
					setPlayerStorageValue(pid, storages.count, getPlayerStorageValue(pid, storages.count) + 1)
					if getPlayerStorageValue(pid, storages.count) == getPlayerStorageValue(pid, storages.maxcount) then
						doPlayerSendTextMessage(pid, 19, "You finished your task.")
					elseif getPlayerStorageValue(pid, storages.count) < getPlayerStorageValue(pid, storages.maxcount) then
						doPlayerSendTextMessage(pid, 20, "Killed ".. getCreatureName(target) .."s [".. getPlayerStorageValue(pid, storages.count) .."/".. getPlayerStorageValue(pid, storages.maxcount) .."].")
					end
				end
			end	
		end	
		end
	end
return true
end