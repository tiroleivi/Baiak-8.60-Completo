function onUse(cid, item, fromPosition, itemEx, toPosition)
local config = {
storage = 3235, -- Uma storage, se quiser nao precisa modificar
keyID = 2090, -- ID de uma chave, você pode trocar.
aid = 1222, -- ActionID, tem que ser o mesmo do script acima.
}

if getPlayerStorageValue(cid, config.storage) == -1 then
local item = doPlayerAddItem(cid, config.keyID,1)
if item then
doItemSetAttribute(item, "aid", config.aid)
setPlayerStorageValue(cid, config.storage, 1)
doPlayerSendCancel(cid, "Voce recebeu uma key.")
end
else
doPlayerSendCancel(cid, "Voce ja fez essa quest.")
end

end