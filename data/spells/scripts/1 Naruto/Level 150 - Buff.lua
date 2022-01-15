local tempo = 60
local effect = {65}
local effect1 = {130}
local outfit = {lookType = 439}
     
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
local position = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
local position1 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
doSendMagicEffect(position, effect[i])
doSendMagicEffect(position1, effect1[i])
end
end
end

local function Outfitzinha(cid)
doRemoveCondition(cid, CONDITION_OUTFIT)
end
                  
function onCastSpell(cid, var)
if exhaustion.check(cid, 102053) == FALSE then
doCombat(cid, combat, var)
tempo2 = 0
while (tempo2 ~= (tempo*1000)) do
addEvent(Magica, tempo2, tempo2, tempo*1000, cid)
addEvent(Outfitzinha, tempo*1000, cid)
tempo2 = tempo2 + 300
end
local position = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
exhaustion.set(cid, 102053, tempo)
doCreatureSay(cid, "- SHIKA -", TALKTYPE_MONSTER)
doSendMagicEffect(position, 119)
doSetCreatureOutfit(cid, outfit)

else
doPlayerSendCancel(cid, "Desculpe, voce ja esta Transformado.")
end
end