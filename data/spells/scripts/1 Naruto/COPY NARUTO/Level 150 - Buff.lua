local tempo = 60
local effect = {228}
     
local points = 10
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, points)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat, condition)

            
local function Magica(tempo2,tempo3,cid)
if isCreature(cid) then
for i=1, #effect do
local position = {x=getCreaturePosition(cid).x+0, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
doSendMagicEffect(position, effect[i])
end
end
end
                  
function onCastSpell(cid, var)
if exhaustion.check(cid, 102053) == FALSE then
doCombat(cid, combat, var)
tempo2 = 0
while (tempo2 ~= (tempo*1000)) do
addEvent(Magica, tempo2, tempo2, tempo*1000, cid)
tempo2 = tempo2 + 300
end
local outfit = 439
local position = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
exhaustion.set(cid, 102053, tempo)
doChangeCreatureOutfit(cid, outfit)
doCreatureSay(cid, "KYYYYUUUUBBIII CHAKRAAA", TALKTYPE_MONSTER)
else
doPlayerSendCancel(cid, "Sorry, you are transformed.")
end
end