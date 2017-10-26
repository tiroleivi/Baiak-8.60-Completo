-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

-- //

function onStepIn(cid, item, pos, fromPosition)
 local pos = getThingPos(cid)
 
 if item.actionid == 16203 then 
  if not isPlayer(cid) then
	  return true
  end 
  if getGlobalStorageValue(COH_STATUS) == getPlayerGuildName(cid) then
   doSendMagicEffect(getThingPos(cid), 14)
   doSendAnimatedText(pos, "CoH", math.random(1, 255))
  else
   doSendMagicEffect(getThingPos(cid), 2)
      doTeleportThing(cid, fromPosition, false)
   doPlayerSendCancel(cid, "[CoH] Voce nao pertence a guild "..getGlobalStorageValue(COH_STATUS)..".")
  end
  return true
 end

	if item.actionid == 16202 then
	 if not isPlayer(cid) then
	  return true
  end
  
  if getPlayerGuildId(cid) > 0 then
   if (getGlobalStorageValue(COH_STATUS) ~= getPlayerGuildName(cid)) then
  		doPlayerSendTextMessage(cid, 20, "[Castle of Honor] Voce e sua guild estao no comando, os antigos donos ["..tostring(getGlobalStorageValue(COH_STATUS)).."] podem se vingar!")
 	  setGlobalStorageValue(COH_PREPARE1, -1)
  	 setGlobalStorageValue(COH_PREPARE2, -1)
 	  setGlobalStorageValue(COH_STATUS, getPlayerGuildName(cid))
 	  doCastleRemoveEnemies()
    doBroadcastMessage("[Castle of Honor] O jogador ["..getCreatureName(cid).."] e sua guild ["..getPlayerGuildName(cid).."] estao no comando do castelo, va dominar e impedir isso!")
  	end
 	else
   doSendMagicEffect(pos, 2)  
   doTeleportThing(cid, fromPosition, false)
   doPlayerSendCancel(cid, "[CoH] Voce nao possui uma guild.")
   end
 	 return true
 end

	if item.actionid == 16200 then
  if not isPlayer(cid) then
	  return true
  end
  if getPlayerGuildId(cid) > 0 then
   doSendAnimatedText(pos, "CoH", math.random(1, 255))
   if (getGlobalStorageValue(COH_PREPARE1) ~= getPlayerGuildName(cid)) and ((getGlobalStorageValue(COH_PREPARE2) ~= getPlayerGuildName(cid))) then
    setGlobalStorageValue(COH_PREPARE1, getPlayerGuildName(cid))
    doBroadcastMessage("[Castle of Honor] Atencao! A guild "..getPlayerGuildName(cid).." esta tentando dominar o castelo, preparem-se!")
   end
  else
   doSendMagicEffect(pos, 2)  
   doTeleportThing(cid, fromPosition, false)
   doPlayerSendCancel(cid, "[CoH] Voce nao possui uma guild.")   
   return true
  end   
 end
 
 if item.actionid == 16201 then
  if not isPlayer(cid) then
	  return true
  end
  doSendAnimatedText(pos, "CoH", math.random(1, 255))
  if (getGlobalStorageValue(COH_PREPARE2) ~= getPlayerGuildName(cid)) then
   setGlobalStorageValue(COH_PREPARE2, getPlayerGuildName(cid))
   doBroadcastMessage("[Castle of Honor] Atencao! A guild "..getPlayerGuildName(cid).." esta muito proxima do dominio, ataquem!")
  end
 end
 return true
end