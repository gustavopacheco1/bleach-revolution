function onThink(interval, lastExecution)
local name_of_monster = 'Mizuki'   ---  here put monster name or any npc name
local texts =
{
 
-- text              pos                effects            
  ["- TraveL -"] = {{x=1018, y=1015, z=7},CONST_ME_ENERGYAREA, 1},
  ["test2"] = {{x=1028, y=1021, z=7},CONST_ME_ENERGYAREA, 1},
  ["test3"] = {{x=1029, y=1021, z=7},CONST_ME_FIREWORK_YELLOW, 1}
 
}
 
    for text, param in pairs(texts) do
doCreatureSay(getCreatureByName(name_of_monster),text,TALKTYPE_ORANGE_1, true, 0,param[1])
end
return TRUE
end