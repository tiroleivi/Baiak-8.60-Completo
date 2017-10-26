function onThink(interval, lastExecution, thinkInterval)
 
local eventName = "king knight"
local posCreate = {x=298, y=187, z=8} -- Onde Sera Criado.
local posTeleport = {x=391, y=194, z=9} -- Para Onde ira leva
local time = 5 -- Tempo que levara para o Portal fecha
local tpId = 1387 -- ID Do Portal
 
      function removeTp()
        local tp = getTileItemById(posCreate, tpId)
         doRemoveItem(tp.uid, 1)
          doSendMagicEffect(posCreate, 2)
         doBroadcastMessage("Os Teleports para os bosses se fecharam.")
       return true
      end
 
 doCreateTeleport(tpId, posTeleport, posCreate)
  doBroadcastMessage("Os Teleports para os bosses foram abertos, e serao fechados em "..time.." Minuto(s).")
   addEvent(removeTp, time * 60000)
 
 return true
end