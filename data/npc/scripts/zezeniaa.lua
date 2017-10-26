local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

-- OTServ event handling functions start
function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                      npcHandler:onThink() end

-------------------------------- EXTERN CONFIG --------------------------------
local config = {
	levelcollect = 100, --- level pra poder fazer tasks do tipo collect
	time = 2 * 60 * 60, --- tempo que vc vai ficar sem poder falar com ele caso abandone uma task (em segundos)
	bonus = 1.2, --- bonus de exp/gold caso a task escolhida seja random (1.2 = 20% a mais)
	multiplicator = 1 --- multiplicador de exp/gold/skills (coloque de acordo com a necessidade do seu server)
}

local easy = {
	[1] = "Goblin",
	[2] = "Troll",
	[3] = "Rotworm",
	[4] = "Dwarf",
	[5] = "Amazon",
	[6] = "Elf",
	[7] = "Wolf",
	[8] = "Orc",
	[9] = "Minotaur"
}

local eacollect = {
	[1] = {id = 5880, count = 20}, -- iron ore
	[2] = {id = 5902, count = 15}, -- honeycomb
	[3] = {id = 5878, count = 10}, -- minotaur leather
	[4] = {id = 5890, count = 20}, -- chicken feather
	[5] = {id = 5894, count = 15}, -- bat wing
	[6] = {id = 5896, count = 10}, -- bear pawn
	[7] = {id = 5897, count = 20}, -- wolf pawn
	[8] = {id = 5921, count = 15}, -- heaven blossom
	[9] = {id = 3956, count = 10} --  elephant tusk
}


local medium = {
	[1] = "Cyclops",
	[2] = "Ghoul",
	[3] = "Dragon",
	[4] = "Mammoth",
	[5] = "Vampire",
	[6] = "Fire Devil",
	[7] = "Fire Elemental",
	[8] = "Valkyrie",
	[9] = "Monk"
}

local medcollect = {
	[1] = {id = 5876, count = 35}, -- lizard leather
	[2] = {id = 5678, count = 30}, -- tortoise egg
	[3] = {id = 5898, count = 25}, -- beholder eye
	[4] = {id = 5899, count = 35}, -- turtle shell
	[5] = {id = 2229, count = 30}, -- skull
	[6] = {id = 5877, count = 25}, -- dragon leather
	[7] = {id = 5920, count = 30} -- dragon scale
}

local hard = {
	[1] = "Giant Spider",
	[2] = "Dragon Lord",
	[3] = "Grim Reaper",
	[4] = "Demon",
	[5] = "Crystal Spider",
	[6] = "Demon Skeleton",
	[7] = "Juggernaut",
	[8] = "Destroyer",
	[9] = "Hand of Cursed Fate"
}

local hardcollect = {
	[1] = {id = 5882, count = 50}, -- red dragon scale
	[2] = {id = 5948, count = 45}, -- red dragon leather
	[3] = {id = 5930, count = 40}, -- behemoth claw
	[4] = {id = 5879, count = 50}, -- giant spider silk
	[5] = {id = 5954, count = 45}, -- demon horn
	[6] = {id = 6500, count = 40}, -- demoniac essence
	[7] = {id = 5944, count = 45}, -- soul orb
}

local storages = {
	name = 95672,
	count = 95673,
	maxcount = 95674,
	difficult = 95675,
	length = 95676,
	delay = 95677,
	type = 95678,
}
-------------------------------- END OF EXTERN CONFIG --------------------------------
function creatureSayCallback(cid, type, msg)
    if (not npcHandler:isFocused(cid)) then
        return false
    end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
-------------------------------- INTERN CONFIG CAN BE DONE HERE --------------------------
local short = 0 + (math.random(1,3) * 50) -- quantidade de monstros no curto
local median = 100 + (math.random(1,3) * 50) -- quantidade de monstros no mediano
local long = 200 + (math.random(1,3) * 100) -- quantidade de monstros no longo

local gold = 1000 * ((getPlayerStorageValue(cid, storages.length)) + (getPlayerStorageValue(cid, storages.difficult))) * config.multiplicator
local experience = ((getExperienceForLevel(getPlayerLevel(cid) + 1) - getExperienceForLevel(getPlayerLevel(cid))) / 100) * ((getPlayerStorageValue(cid, storages.length)) * (getPlayerStorageValue(cid, storages.difficult))) * config.multiplicator
-------------------------------- END OF INTERN CONFIG --------------------------

local type = getPlayerStorageValue(cid, storages.type)
	if (msgcontains(msg, 'task') or msgcontains(msg, 'challenge')) and (getPlayerStorageValue(cid, storages.delay) - os.time()) <= 0 then
		if getPlayerStorageValue(cid, storages.maxcount) > 3 and getPlayerStorageValue(cid, storages.type) == 1 then
			talkState[talkUser] = 6
			selfSay('Your task is to kill {'..getPlayerStorageValue(cid, storages.maxcount)..' '..getPlayerStorageValue(cid, storages.name)..'s}. Hurry with this or you want to {give up}?!', cid)
		elseif getPlayerStorageValue(cid, storages.maxcount) > 3 and getPlayerStorageValue(cid, storages.type) == 2 then
			talkState[talkUser] = 6
			selfSay('Your task is to collect {'.. getPlayerStorageValue(cid, storages.maxcount)..' '.. getItemNameById(getPlayerStorageValue(cid, storages.name)) ..'s}. Hurry with this or you want to {give up}?!', cid)
		else
			talkState[talkUser] = 1
			selfSay('I have two types of tasks, you want to {kill} monsters or to {collect} some items for me? You can also let me choose a {random} one for you, garanting a final bonus in your reward.', cid)
		end
	elseif (msgcontains(msg, 'kill') and talkState[talkUser] == 1) then
		talkState[talkUser] = 2
		setPlayerStorageValue(cid, storages.type, 1)
		selfSay('I have all kinds of tasks, you want a {easy}, {medium} or are you up to a {hard} one?', cid)
	elseif (msgcontains(msg, 'collect') and talkState[talkUser] == 1 and getPlayerLevel(cid) >= config.levelcollect) then
		talkState[talkUser] = 2
		setPlayerStorageValue(cid, storages.type, 2)
		selfSay('I have all kinds of tasks, you want a {easy}, {medium} or are you up to a {hard} one?', cid)
	elseif (msgcontains(msg, 'collect') and talkState[talkUser] == 1 and getPlayerLevel(cid) < config.levelcollect) then
		talkState[talkUser] = 1
		selfSay('You can only do collect tasks once you reach level '..config.levelcollect..'.', cid)
	------- difficult ---------
	elseif (msgcontains(msg, 'random') and talkState[talkUser] == 1) then
		talkState[talkUser] = 4
		selfSay('Are you sure about this?', cid)
		setPlayerStorageValue(cid, storages.type, math.random(1,2))
		setPlayerStorageValue(cid, storages.difficult, math.random(2,4) * config.bonus)
		setPlayerStorageValue(cid, storages.length, math.random(2,4) * config.bonus)
	elseif (msgcontains(msg, 'hard') and talkState[talkUser] == 2) then
		talkState[talkUser] = 3
		selfSay('I have all kinds of tasks, you want a {short}, {median} or are you up to a {long} one?.', cid)
		setPlayerStorageValue(cid, storages.difficult, 4)
	elseif (msgcontains(msg, 'medium') and talkState[talkUser] == 2) then
		talkState[talkUser] = 3
		selfSay('I have all kinds of tasks, you want a {short}, {median} or are you up to a {long} one?.', cid)
		setPlayerStorageValue(cid, storages.difficult, 3)
	elseif (msgcontains(msg, 'easy') and talkState[talkUser] == 2) then
		talkState[talkUser] = 3
		selfSay('I have all kinds of tasks, you want a {short}, {median} or are you up to a {long} one?.', cid)
		setPlayerStorageValue(cid, storages.difficult, 2)
	------- bye ---------
	elseif (msgcontains(msg, 'no')) and isInArray({1, 6, 7}, talkState[talkUser]) then
		talkState[talkUser] = 0
		selfSay('Clearly you are not ready. We can talk later...', cid)
	------- length ---------
	elseif (msgcontains(msg, 'short') and talkState[talkUser] == 3) then
		talkState[talkUser] = 4
		selfSay('Are you sure about this?', cid)
		setPlayerStorageValue(cid, storages.length, 2)
	elseif (msgcontains(msg, 'median') and talkState[talkUser] == 3) then
		talkState[talkUser] = 4
		selfSay('Are you sure about this?', cid)
		setPlayerStorageValue(cid, storages.length, 3)
	elseif (msgcontains(msg, 'long') and talkState[talkUser] == 3) then
		talkState[talkUser] = 4
		selfSay('Are you sure about this?', cid)
		setPlayerStorageValue(cid, storages.length, 4)
	----------- give up option -----------
	elseif (msgcontains(msg, 'give up') and talkState[talkUser] == 6) then
		selfSay('Are you saying that you want to give up this task? I will not give you any other task in the next '.. (config.time/3600) ..' hour(s).', cid)
		talkState[talkUser] = 7
	elseif (msgcontains(msg, 'yes') and talkState[talkUser] == 7) then
		selfSay('Since you will not help me, get out of here.', cid)
		setPlayerStorageValue(cid, storages.maxcount, 0)
		setPlayerStorageValue(cid, storages.delay, os.time() + config.time)
		talkState[talkUser] = 0
	-----------------------
	------- checking ---------
	elseif (msgcontains(msg, 'yes') and talkState[talkUser] == 4) then
		local length = getPlayerStorageValue(cid, storages.length)
		local difficult = getPlayerStorageValue(cid, storages.difficult)
		if type == 1 then
			if length == 2 then
				setPlayerStorageValue(cid, storages.maxcount, short)
			elseif length == 3 then
				setPlayerStorageValue(cid, storages.maxcount, median)
			else
				setPlayerStorageValue(cid, storages.maxcount, long)
			end
			if difficult == 2 then
				setPlayerStorageValue(cid, storages.name, easy[math.random(1, #easy)])
			elseif difficult == 3 then
				setPlayerStorageValue(cid, storages.name, medium[math.random(1, #medium)])
			else
				setPlayerStorageValue(cid, storages.name, hard[math.random(1, #hard)])
			end
			setPlayerStorageValue(cid, storages.count, 0)	
			talkState[talkUser] = 0
			selfSay('OK then.. your task is to kill '..getPlayerStorageValue(cid, storages.maxcount)..' '..getPlayerStorageValue(cid, storages.name)..'s. Do not spare any monster!', cid)
		elseif type == 2 then
			if length == 2 then
				setPlayerStorageValue(cid, storages.maxcount, eacollect[math.random(1, #eacollect)].count)
			elseif length == 3 then
				setPlayerStorageValue(cid, storages.maxcount, medcollect[math.random(1, #medcollect)].count)
			else
				setPlayerStorageValue(cid, storages.maxcount, hardcollect[math.random(1, #hardcollect)].count)
			end
			if difficult == 2 then
				setPlayerStorageValue(cid, storages.name, eacollect[math.random(1, #eacollect)].id)
			elseif difficult == 3 then
				setPlayerStorageValue(cid, storages.name, medcollect[math.random(1, #medcollect)].id)
			else
				setPlayerStorageValue(cid, storages.name, hardcollect[math.random(1, #hardcollect)].id)
			end
			setPlayerStorageValue(cid, storages.count, 0)	
			talkState[talkUser] = 0
			selfSay('OK then.. your task is to collect {'.. getPlayerStorageValue(cid, storages.maxcount)..' '.. getItemNameById(getPlayerStorageValue(cid, storages.name)) ..'s}. Bring me the proof that you made it!', cid)
		end
	elseif (msgcontains(msg, 'no') and talkState[talkUser] == 4) then
		talkState[talkUser] = 0
		selfSay('Ok, come back when you have the guts.', cid)
	------- reward ---------
	elseif msgcontains(msg, 'reward') then
		if type == 1 then
			if getPlayerStorageValue(cid, storages.count) >= getPlayerStorageValue(cid, storages.maxcount) and getPlayerStorageValue(cid, storages.maxcount) > 3  then
				selfSay('You finished the quest, now you want to receive your reward in {gold}, {trainning} or in {experience}?', cid)
				talkState[talkUser] = 5
			else
				selfSay('There is no reward for those who did not complete a challenge.', cid)
				talkState[talkUser] = 0
			end
		elseif type == 2 then
			if getPlayerItemCount(cid, getPlayerStorageValue(cid, storages.name)) >= getPlayerStorageValue(cid, storages.maxcount) and getPlayerStorageValue(cid, storages.maxcount) > 3  then
				selfSay('You finished the quest, now you want to receive your reward in {gold}, {trainning} or in {experience}?', cid)
				talkState[talkUser] = 5
			else
				selfSay('There is no reward for those who did not complete a challenge.', cid)
				talkState[talkUser] = 0
			end
		else
			selfSay('There is no reward for those who did not complete a challenge.', cid)
			talkState[talkUser] = 0
		end
		---------- checking rewards ---------------
	elseif (msgcontains(msg, 'gold') and talkState[talkUser] == 5 ) then
		if (type == 1) or (doPlayerRemoveItem(cid, getPlayerStorageValue(cid, storages.name), getPlayerStorageValue(cid, storages.maxcount)) and type == 2) then
			for k, v in pairs(storages) do
				setPlayerStorageValue(cid, v, 0)
			end
			doPlayerAddMoney(cid, gold)
			talkState[talkUser] = 0
			selfSay('Thanks for your help, here is your prize..', cid)
		else
			selfSay('Something went wrong..', cid)
		end
	elseif (msgcontains(msg, 'experience') and talkState[talkUser] == 5) then
			if (type == 1) or (doPlayerRemoveItem(cid, getPlayerStorageValue(cid, storages.name), getPlayerStorageValue(cid, storages.maxcount)) and type == 2) then
				for k, v in pairs(storages) do
					setPlayerStorageValue(cid, v, 0)
				end
				doPlayerAddExperience(cid, experience)
				talkState[talkUser] = 0	
				selfSay('Thanks for your help, here is your prize..', cid)
			else
				selfSay('Something went wrong..', cid)
			end			
	elseif (msgcontains(msg, 'trainning') and talkState[talkUser] == 5) then
		talkState[talkUser] = 8
		selfSay('Which skill you want to train with me? choose between {axe}, {distance}, {club}, {sword} and {shield}', cid)
	----------------------- SKILL REWARD -----------------------	
	elseif (SKILL_IDS[msg] and talkState[talkUser] == 8) then
		if (type == 1) or (doPlayerRemoveItem(cid, getPlayerStorageValue(cid, storages.name), getPlayerStorageValue(cid, storages.maxcount)) and type == 2) then
		-- a divisao por 3000 foi porque cada ponto de skill try equivale a 30 tries de skill e nos naturalmente dividimos por 100. 1/30 * 1/100 = 1/3000
		local qnt = math.ceil(getPlayerRequiredSkillTries(cid, SKILL_IDS[msg], getPlayerSkillLevel(cid, SKILL_IDS[msg]) + 1)/3000) * ((getPlayerStorageValue(cid, storages.length)) * (getPlayerStorageValue(cid, storages.difficult)) * config.multiplicator) 
			for k, v in pairs(storages) do
				setPlayerStorageValue(cid, v, 0)
			end
			doPlayerAddSkillTry(cid, SKILL_IDS[msg], qnt)
			doSendMagicEffect(getCreaturePosition(cid), 39)
			talkState[talkUser] = 0	
			selfSay('Thanks for your help, here is your prize..', cid)
		else
			selfSay('Something went wrong..', cid)
		end		
	----------------------- msg when blocked --------------
	elseif (msgcontains(msg, 'task') or msgcontains(msg, 'challenge')) and (getPlayerStorageValue(cid, storages.delay) - os.time()) > 0 then
		talkState[talkUser] = 0	
		selfSay('I can not trust you since you failed in the last job. You will have to wait until I feel that I can trust you again..', cid)
	end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())