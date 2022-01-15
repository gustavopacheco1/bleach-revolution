local teleportPoints = {
[0] = {x = 909, y = 1109, z = 6},
[1] = {x = 909, y = 1109, z = 6},
}

local position = teleportPoints[math.random(0,1)]
local bosses = {"Ichibi", "Nibi", "Sanbi", "Yonbi", "Gobi", "Rokubi", "Shichibi", "Hachibi", "Kyuubi"}
 
function onTime(interval)
     local boss = bosses[math.random(#bosses)]
     doCreateMonster(boss, position)
     doBroadcastMessage("[BIJUU SEAL] A lendaria bijuu ".. boss .." acaba de ser solta por aqueles que a capturaram. Eis o momento, para que a mesma possa ser selada, mas lembre-se Shinobi, não se sabe onde ela pode está, logo, tome cuidado, pois o seu pior pesadelo, pode está ao seu lado...", MESSAGE_STATUS_WARNING)
     return true
end