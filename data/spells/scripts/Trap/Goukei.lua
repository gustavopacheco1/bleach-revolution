local area = createCombatArea{
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}

local combat = createCombatObject()
setCombatArea(combat, area)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 543)

function onTargetTile(cid, position)

if #isWalkableTrue(cid, position, true, true) <= 0 then
local create = doCreateItemEx(13521, 1)
doTileAddItemEx(position, create)
doDecayItem(create)
end

end

setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)

if exhaustion.check(cid, 13301) == TRUE then
if exhaustion.get(cid, 13301) >= 120 then
doPlayerSendCancel(cid, "Doton Doryu Heki cooldown " ..math.floor(exhaustion.get(cid, 13301)/60).." minutos.")
return false
end
if exhaustion.get(cid, 13301) > 60 then
doPlayerSendCancel(cid, "Doton Doryu Heki cooldown 1 minuto and " ..(exhaustion.get(cid, 13301)-60).." segundos.")
return false
end
doPlayerSendCancel(cid, "Doton Doryu Heki cooldown " ..exhaustion.get(cid, 13301).." segundos.")
return false
end

doCombat(cid, combat, var)

exhaustion.set(cid, 13301, 29.0)

return true
end