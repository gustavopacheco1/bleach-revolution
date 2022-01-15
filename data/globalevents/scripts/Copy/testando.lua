function onThink(interval, lastExecution)
local name_of_monster = 'Mizuki'   ---  here put monster name or any npc name
local texts =
{
 
-- text              pos                effects            
  ["- EvEnT -"] = {{x=1025, y=1028, z=6},CONST_ME_ENERGYAREA, 23},
  ["- EvEnT -"] = {{x=1023, y=1027, z=7},CONST_ME_ENERGYAREA, 23},
  ["- EvEnT -"] = {{x=1021, y=1028, z=7},CONST_ME_FIREWORK_YELLOW, 23}
 
}
 
    for text, param in pairs(texts) do
	doCreatureSay(getCreatureByName(name_of_monster),text,TALKTYPE_ORANGE_1, false, 0,param[1])
end
return TRUE
end