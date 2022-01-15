-- <Script by jhon992> --
local weaponMana = {2413, 2383} -- id dos items que sugarão nama.
local chanceMana = 20 -- chance de sugar (10 = 10%, 20 = 20%, 30 = 30%, 1 = 1%, 5 = 5%) e assim por diante.
local manaPorcent = 5 -- vai sugar 10% de mana do player se acertar.

function onAttack(cid, target)
if getDistanceBetween(getCreaturePosition(cid), getCreaturePosition(target)) < 2 then
if isInArray(weaponMana, getPlayerSlotItem(cid, 5).itemid) or isInArray(weaponMana, getPlayerSlotItem(cid, 6).itemid) then
if (math.random(1,100) > (100 - chanceMana)) then
local mana = (getCreatureMana(target)*(manaPorcent/100))
doPlayerSendTextMessage(cid, 23, "Você sugou "..mana.." de mana do "..getCreatureName(target)..".")
doSendMagicEffect(getCreaturePosition(target), 1) -- 1 é o efeito que aparecera no target.
doCreatureAddMana(target, -mana)
doCreatureAddMana(cid, mana)
end
end
end
return true
end