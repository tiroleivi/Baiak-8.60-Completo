local config = {
    positions = {
        ["Bem Vindo"] = { x = 160, y = 54, z = 7 },
		["100k"] = { x = 160, y = 49, z = 7 },
        ["VIP 1"] = { x = 144, y = 45, z = 7 },
        ["VIP 2"] = { x = 148, y = 45, z = 7 },
        ["Castle24H"] = { x = 166, y = 53, z = 7 },
        ["AreaPvp"] = { x = 150, y = 49, z = 7 },
		["Inqui."] = { x = 151, y = 49, z = 7 },
        ["NovasHunt"] = { x = 282, y = 531, z = 7 },
        ["Teleports"] = { x = 152, y = 49, z = 7 },
		["Igreja"] = { x = 153, y = 49, z = 7 },
        ["QuestVip"] = { x = 149, y = 49, z = 7 },
        ["Depot"] = { x = 148, y = 49, z = 7 },
        ["Lixo"] = { x = 155, y = 48, z = 7 },
        ["Especiais"] = { x = 177, y = 62, z = 7 },
        ["Treiners"] = { x = 154, y = 49, z = 7 },
        ["Eventos"] = { x = 147, y = 49, z = 7 },
        ["Dice Event"] = {x = 188, y = 237, z = 7 },
        ["Eventos!"] = { x = 194, y = 241, z = 7 },
        ["BP Event"] = { x = 200, y = 237, z = 7 },
        ["War Event"] = { x = 194, y = 237, z = 7 },
        ["Dice Event"] = { x = 188, y = 237, z = 7 },
        ["Bug Event"] = { x = 194, y = 244, z = 7 },
        ["VIP 3"] = {x = 283, y = 536, z = 7 },
        ["Baiak"] = {x = 423, y = 164, z = 7 },
        ["VIP 3"] = {x = 152, y = 45, z = 7 },
        ["Templo"] = {x = 202, y = 239, z = 7 },
		["Templo"] = {x = 302, y = 191, z = 8 },
		["DONATE"] = {x = 166, y = 50, z = 7 },
		["VIP"] = {x = 165, y = 50, z = 7 },
		["Treiners V"] = {x = 1019, y = 1032, z = 7 },
		["Hunts  "] = {x = 1020, y = 1032, z = 7 },
		["Baiak Tp"] = {x = 1021, y = 1032, z = 7 },
		["Templo ~"] = {x = 2421, y = 515, z = 5 },
		["~ Baiak"] = {x = 2427, y = 515, z = 5 },
		["Distance"] = {x = 2421, y = 517, z = 6 },
		["Sword"] = {x = 2421, y = 520, z = 6 },
		["Club"] = {x = 2428, y = 520, z = 6 },
		["Magic"] = {x = 2428, y = 517, z = 6 },
		["Axe"] = {x = 2425, y = 516, z = 6 },
		["Itens DN"] = {x = 146, y = 49, z = 7 },
		["Saida"] = {x = 67, y = 189, z = 7 },
    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 255))
    end
    
    return TRUE
end  