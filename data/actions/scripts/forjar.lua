function onUse(cid, item, item2, frompos, topos, pos)
local config = {
["Magic Plate Armor"] = {t1=12461,t2=5952,t3=2472, porcetagem=20}, -- t1 = 5940 |---| t2 = 5952 |---| t3 = ID do ITEM a ser FORJADO --
["Forged Staff"] = {t1=8299,t2=7735,t3=12288, porcetagem=20},
["Forged Sword"] = {t1=8299,t2=2446,t3=2390, porcetagem=20},
["Forged Club"] = {t1=8299,t2=7432,t3=7450, porcetagem=20},
["Forged Axe"] = {t1=8299,t2=2435,t3=8924, porcetagem=20},
["Forged Bow"] = {t1=8299,t2=8855,t3=7438, porcetagem=20},
}
 
local r1 = {x = 412, y = 163, z = 8, stackpos= 2} -- Posição 1 ( NÃO MEXA NO stackpos= 2 )
local r2 = {x = 414, y = 163, z = 8, stackpos= 2} -- Posição 2 ( NÃO MEXA NO stackpos= 2 )
local r3 = {x = 413, y = 163, z = 8} -- Posição do Item a Ser Criado
 
local q1 = getThingfromPos(r1)
local q2 = getThingfromPos(r2)
    for i, x in pairs(config) do
        if (q1.itemid == x.t1 and q2.itemid == x.t2) or (q1.itemid == x.t2 and q2.itemid == x.t1) then
        local random = math.random (0, 100)
            if random <= x.porcetagem then
                doRemoveItem(q1.uid, 1)
                doRemoveItem(q2.uid, 1)
                addEvent(doCreateItem, 1000, x.t3, 1, r3)
                doSendMagicEffect(r3, 47)
                addEvent(doSendMagicEffect, 900, r3, 39)
                doPlayerSendTextMessage(cid, 22, "Parabens, voce Forjou um(a) " .. i .. ".")
                break
            else
                doPlayerSendTextMessage(cid, 22, "Voce nao conseguiu forja um " .. i .. ".")
                doRemoveItem(q1.uid, 1)
                doRemoveItem(q2.uid, 1)
                doSendMagicEffect(r1, 47)
                doSendMagicEffect(r2, 47)
                break
            end
        end
    end
    return TRUE
end