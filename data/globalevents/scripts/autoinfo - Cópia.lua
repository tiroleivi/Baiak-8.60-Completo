function doCreateTeleport

local create_pos = {x=160, y=54, z=7, stackpos=255}
local tp_pos = {x=165, y=54, z= 7}

doCreateTeleport(1387, tp_pos , create_pos)
doSendMagicEffect(create_pos , 10)
doBroadcastMessage ("O Portal para o boss está aberto")
return TRUE
end
