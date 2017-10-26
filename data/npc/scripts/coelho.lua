  local PRESENT_STORAGE = 29885 -- Storage ID
local gifts = {
        {10, 6541, 1}, -- 7% to get ovo de pascoa [10]
        {30, 6541, 1}, -- 7% to get ovo de pascoa [30]
        {40, 10523, 1}, --  4% to get Grande ovo [40]
        {100, 6541, 1}, -- 10% to get Ovo de Pascoa [100]
        {150, c, 1}, -- 4% to get Chapeu De Pascoa [150]
        {150, 6570, 1}, -- 25% to get Presente [150]
        {200, 5080, 1}, -- 50% to get Panda Teddy [200]
        {250, 2218, 1}, -- 10% to get Amuleto do Coelho [250]
        {350, 6574, 15}, -- 55% to get Chocolate [350]
        {500, 2687, 30} -- 50% to get 10 Cookies [500]
    }

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                  npcHandler:onCreatureAppear(cid)                                end
function onCreatureDisappear(cid)               npcHandler:onCreatureDisappear(cid)                             end
function onCreatureSay(cid, type, msg)          npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                              npcHandler:onThink()                                                    end

function CoelhoNPC(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    if (parameters.present == true) then
        if (getPlayerStorageValue(cid, PRESENT_STORAGE) == 1) then
                selfSay("Voce Ganhou seu presente ja Tstststst...", cid)
                return true
        end

        local item = {}
        local reward = 0
        local count = ""
        for i = 1, #gifts do
            item = gifts[i]
            if (math.random(0,999) < item[1]) then
                reward = item[2]
                subType = item[3]
                if subType > 1 then
                    count = subType .. " "
                end
                break
            end
        end
        doPlayerAddItem(cid, reward, subType)
        setPlayerStorageValue(cid, PRESENT_STORAGE, 1)
        npcHandler:say('tstststs! Eu tenho um(a) ' .. count .. getItemNameById(reward) .. ' para voce.', cid)
    else
        npcHandler:say('Voce ja pegou seu presente Nhac Nhac', cid)
    end
    npcHandler:resetNpc()
    return true
end
 
npcHandler:setMessage(MESSAGE_GREET, "Ola |PLAYERNAME| Feliz Pascoa!! Este Ano Trouxe um presente para voce. Fale Present.")

local noNode = KeywordNode:new({'no'}, CoelhoNPC, {present = false})
local yesNode = KeywordNode:new({'yes'}, CoelhoNPC, {present = true})

local node = keywordHandler:addKeyword({'present'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce Quer Recebelo?Diga YES...'})
    node:addChildKeywordNode(yesNode)
    node:addChildKeywordNode(noNode)

npcHandler:addModule(FocusModule:new()) 