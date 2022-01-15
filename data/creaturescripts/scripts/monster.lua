local t = {
{name= "Rotworm", storage="0"},
{name= "Rotworm", storage="0"},
{name= "Rotworm", storage="0"},
{name= "Rotworm", storage="0"}
}

function onKill(cid, target)

for _, creature in ipairs(t) do

if isPlayer(cid) and isCreature(target) then
if getCreatureName(target) == ""..creature.name.."" then
if getPlayerStorageValue(cid, creature.storage) >= 0 then
setPlayerStorageValue(cid, creature.storage, getPlayerStorageValue(cid, creature.storage) + 1)
else
setPlayerStorageValue(cid, creature.storage, 1)
end
end
end

end

return true
end