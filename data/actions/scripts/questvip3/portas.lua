function onUse(cid, item, fromPosition, itemEx, toPosition)
local doors = {[5098]={id=5100}, [5099]={id=5100}, [5101]={id=5102}, [5107]={id=5109}, [5108]={id=5109}, [5110]={id=5111}}

local config = {
actionid = 1221, -- Uma action normal, só para a portar nao abrir.
keyaid = 1222 -- A action que deve ter na key
}
			for i, x in pairs(doors) do
			  if ((itemEx.itemid == i) and (itemEx.actionid == config.actionid) and (item.actionid == config.keyaid)) then
			   doTransformItem(itemEx.uid, x.id)
			   doItemSetAttribute(itemEx.uid, "aid", 0)
			  elseif (itemEx.itemid == x.id) and (itemEx.actionid == 0) and (item.actionid == config.keyaid) then
			   doTransformItem(itemEx.uid, i)
			   doItemSetAttribute(itemEx.uid, "aid", config.actionid)
			  elseif (itemEx.itemid == i) and (itemEx.actionid == 0) and (item.actionid == config.keyaid) then
			   doTransformItem(itemEx.uid, i)
			   doItemSetAttribute(itemEx.uid, "aid", config.actionid)
			  end
			end
return TRUE
end