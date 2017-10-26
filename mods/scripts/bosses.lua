<?xml version="1.0" encoding="UTF-8"?>  
<mod name="Automatic Raids" version="1.0" author="Vodkart And xotservx" contact="um fórum que não merece ser citado" enabled="yes">  
<config name="raids_func"><![CDATA[
days = {
["Sunday"] = {
["00:00"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["03:05"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["06:10"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Archer", "1 King Minotaur"}, Time = 20},
["09:15"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["12:20"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["15:00"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Archer", "1 King Minotaur"}, Time = 20},
["18:05"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["21:10"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["01:00"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["04:05"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["07:10"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["10:15"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["13:20"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["16:00"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["19:05"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["22:10"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10}
},
["Monday"] = {
["00:00"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["03:05"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["06:10"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Archer", "1 King Minotaur"}, Time = 20},
["09:15"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["12:20"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["15:00"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Archer", "1 King Minotaur"}, Time = 20},
["18:05"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["21:10"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["01:00"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["04:05"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["07:10"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["10:15"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["13:20"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["16:00"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["19:05"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["22:10"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10}
}
["Tuesday"] = {
["00:00"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["03:05"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["06:10"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Archer", "1 King Minotaur"}, Time = 20},
["09:15"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["12:20"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["15:00"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Archer", "1 King Minotaur"}, Time = 20},
["18:05"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["21:10"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["01:00"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["04:05"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["07:10"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["10:15"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["13:20"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["16:00"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["19:05"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["22:10"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10}
}
["Wednesday"] = {
["00:00"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["03:05"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["06:10"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Archer", "1 King Minotaur"}, Time = 20},
["09:15"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["12:20"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["15:00"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Archer", "1 King Minotaur"}, Time = 20},
["18:05"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["21:10"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["01:00"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["04:05"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["07:10"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["10:15"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["13:20"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["16:00"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["19:05"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["22:10"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10}
}
["Thursday"] = {
["00:00"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["03:05"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["06:10"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Archer", "1 King Minotaur"}, Time = 20},
["09:15"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["12:20"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["15:00"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Archer", "1 King Minotaur"}, Time = 20},
["18:05"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["21:10"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["01:00"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["04:05"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["07:10"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["10:15"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["13:20"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["16:00"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["19:05"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["22:10"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10}
}
["Friday"] = {
["00:00"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["03:05"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["06:10"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Archer", "1 King Minotaur"}, Time = 20},
["09:15"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["12:20"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["15:00"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Archer", "1 King Minotaur"}, Time = 20},
["18:05"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["21:10"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["01:00"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["04:05"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["07:10"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["10:15"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["13:20"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["16:00"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["19:05"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["22:10"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10}
}
["Saturday"] = {
["00:00"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["03:05"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["06:10"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Archer", "1 King Minotaur"}, Time = 20},
["09:15"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["12:20"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["15:00"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Archer", "1 King Minotaur"}, Time = 20},
["18:05"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Mage", "1 King Minotaur"}, Time = 20},
["21:10"] = {nome = "Minotaur", pos = {fromPosition = {x=367, y=72, z=7},toPosition = {x=377, y=83, z=7}},m = {"6 Minotaur Guard", "1 King Minotaur"}, Time = 20},
["01:00"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["04:05"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["07:10"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["10:15"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["13:20"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["16:00"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["19:05"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10},
["22:10"] = {nome = "Black Knight", pos = {fromPosition = {x=390, y=186, z=9},toPosition = {x=400, y=193, z=9}},m = {"10 Black Knight", "1 King Knight"}, Time = 10}
}
}
]]></config>    
<globalevent name="AutomaticRaids" interval="60" event="script"><![CDATA[
domodlib('raids_func')
function onThink(interval, lastExecution)  
if days[os.date("%A")] then
hours = tostring(os.date("%X")):sub(1, 5)       
tb = days[os.date("%A")][hours] 
if tb then        
function removeCreature(tb)
for x = ((tb.pos.fromPosition.x)-10), ((tb.pos.toPosition.x)+10) do
for y = ((tb.pos.fromPosition.y)-10), ((tb.pos.toPosition.y)+10) do
local m = getTopCreature({x=x, y=y, z= tb.pos.fromPosition.z}).uid
if m ~= 0 and isMonster(m) then
doRemoveCreature(m)
end
end
end
end
doBroadcastMessage("The invasion of " .. tb.nome .. " started")
for _,x in pairs(tb.m) do
for s = 1, tonumber(x:match("%d+")) do
pos = {x = math.random(tb.pos.fromPosition.x, tb.pos.toPosition.x), y = math.random(tb.pos.fromPosition.y, tb.pos.toPosition.y), z = tb.pos.fromPosition.z}
doSummonCreature(x:match("%s(.+)"), pos)
end
end
addEvent(removeCreature, tb.Time*60*1000, tb)
end
end
return true
end
]]></globalevent>
</mod>