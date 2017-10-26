function onThink(interval, lastExecution, thinkInterval)
 
local eventName = "king magician"
local posCreate = {x=300, y=187, z=8} -- Onde Sera Criado.
local posTeleport = {x=615, y=257, z=7} -- Para Onde ira leva
local time = 5 -- Tempo que levara para o Portal fecha
local tpId = 1387 -- ID Do Portal
 
      function removeTp()
        local tp = getTileItemById(posCreate, tpId)
         doRemoveItem(tp.uid, 1)
          doSendMagicEffect(posCreate, 2)
       return true
      end
 
 doCreateTeleport(tpId, posTeleport, posCreate)
   addEvent(removeTp, time * 60000)
 
 return true
end