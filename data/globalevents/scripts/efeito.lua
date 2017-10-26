function onThink(interval, lastExecution)

local effects = {
[1] = {pos = {160,54,7}, effect = {66}}, -- posição e efeito o resto nao precisa mexer.
[2] = {pos = {301,192,8}, effect = {36}},
[3] = {pos = {303,192,8}, effect = {36}},             
[4] = {pos = {143,45,7}, effect = {6}},
[5] = {pos = {144,45,7}, effect = {56}},
[6] = {pos = {145,45,7}, effect = {6}},
[7] = {pos = {147,45,7}, effect = {6}},
[8] = {pos = {148,45,7}, effect = {56}},
[9] = {pos = {149,45,7}, effect = {6}},
[10] = {pos = {151,45,7}, effect = {6}},
[11] = {pos = {152,45,7}, effect = {56}},
[12] = {pos = {153,45,7}, effect = {6}},
[13] = {pos = {2421,517,6}, effect = {12}},
[14] = {pos = {2421,520,6}, effect = {13}},
[15] = {pos = {2428,520,6}, effect = {14}},
[16] = {pos = {2428,517,6}, effect = {12}},
[17] = {pos = {2425,516,6}, effect = {13}},
}

for _, area in pairs(effects) do
			    doSendMagicEffect({x=area.pos[1],y=area.pos[2],z=area.pos[3]},area.effect[1])
			    doSendMagicEffect({x=area.pos[4],y=area.pos[5],z=area.pos[5]},area.effect[1])                	
	    end			  
return true
end