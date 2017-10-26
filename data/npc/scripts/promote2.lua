local focus = 0
local talk_start = 0
local target = 0
local days = 0

function onThingMove(creature, thing, oldpos, oldstackpos)

end


function onCreatureAppear(creature)

end


function onCreatureDisappear(cid, pos)
if focus == cid then
selfSay('Good bye then.')
focus = 0
talk_start = 0
end
end


function onCreatureTurn(creature)

end


function msgcontains(txt, str)
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end


function onCreatureSay(cid, type, msg)
msg = string.lower(msg)

if (msgcontains(msg, 'hi') and (focus == 0)) and getDistanceToCreature(cid) < 4 then
selfSay(Ola ' .. creatureGetName(cid) .. '! Voce Quer A Segundo Promotion?.')
focus = cid
talk_start = os.clock()

elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
selfSay('Desculpa, ' .. creatureGetName(cid) .. '! Espere um Poco Ja Falo Com vc, Estou Atendendo 1 Jovem Guerreiro!.')

elseif focus == cid then
talk_start = os.clock()

if msgcontains(msg, 'sim') or msgcontains(msg, 'quero promotion') then
if getPlayerVocation(cid) > 12 then
selfSay('Desculpa, Vc Ja Tem A Segunda Promotion.')
talk_state = 0
elseif getPlayerLevel(cid) < 250 then
selfSay('Sorry, you need level 200 to buy promotion.')
talk_state = 0
elseif not isPremium(cid) then
selfSay('Sorry, you must be premium to buy promotion.')
talk_state = 0
else
selfSay('Do you want to buy promotion for 20k?')
talk_state = 1
end

elseif msgcontains(msg, 'ASASUASUA') or msgcontains(msg, 'saHASauhuahua') then
selfSay('Do you want to buy 7 days of premium for 7k?')
talk_state = 2

elseif talk_state == 1 then
if msgcontains(msg, 'yes') then
if pay(cid,20000) then
doPlayerSetVocation(cid, getPlayerVocation(cid)+4)
selfSay('You are now promoted!')
else
selfSay('Sorry, you do not have enough money.')
end
end
talk_state = 0

elseif talk_state == 2 then
if msgcontains(msg, 'yes') then
if pay(cid,7000) then
selfSay('/premium '.. creatureGetName(cid) ..', 7')
selfSay('You have 7 days of premium more!')
else
selfSay('Sorry, you do not have enough money.')
end
end
talk_state = 0

elseif msgcontains(msg, 'bye') and getDistanceToCreature(cid) < 4 then
selfSay('Good bye, ' .. creatureGetName(cid) .. '!')
focus = 0
talk_start = 0
end
end
end


function onCreatureChangeOutfit(creature)

end


function onThink()
doNpcSetCreatureFocus(focus)
if (os.clock() - talk_start) > 30 then
if focus > 0 then
selfSay('Next Please...')
end
focus = 0
end
if focus ~= 0 then
if getDistanceToCreature(focus) > 5 then
selfSay('Good bye then.')
focus = 0
end
end
end