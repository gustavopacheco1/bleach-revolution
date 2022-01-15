FLY_STORAGE = getConfigValue("flyStorage")

flyBlackSQM = false
nonFlyableBorder = {7576, 7577}
changeSpeed = true
flySpeed = 800
waterSpeed = 150

ITEM_FLYTILE = 460
ITEM_WATERTILE = 4625
WATER = {4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619}

RANGEX = 1
RANGEY = 1 

ret =
{
"Você está voando agora.",
"Você não está mais voando.",
"Você não pode parar de voar aqui.",
"Você não está voando.",
"Você não pode subir aqui.",
"Você não pode descer aqui.",
"Você não pode ir para lá."
}

storPos = {x = 1200, y = 1201, z = 1202}

function isWalkable(pos, creature, proj, pz)
if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
if getTopCreature(pos).uid > 0 and creature then return false end
if getTileInfo(pos).protection and pz then return false, true end
local n = not proj and 3 or 2
for i = 0, 255 do
pos.stackpos = i
local tile = getTileThingByPos(pos)
if tile.itemid ~= 0 and not isCreature(tile.uid) then
if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
return false
end
end
end
return true
end

function getAreaToRemove(pos1, pos2)
local t = getDirectionTo(pos1, pos2)
local pos =
{
[0] =
{
{x = pos1.x + 1, y = pos1.y + 1, z = pos1.z},
{x = pos1.x, y = pos1.y + 1, z = pos1.z},
{x = pos1.x - 1, y = pos1.y + 1, z = pos1.z}
},
[2] =
{
{x = pos1.x + 1, y = pos1.y - 1, z = pos1.z},
{x = pos1.x, y = pos1.y - 1, z = pos1.z},
{x = pos1.x - 1, y = pos1.y - 1, z = pos1.z}
},
[1] =
{
{x = pos1.x - 1, y = pos1.y - 1, z = pos1.z},
{x = pos1.x - 1, y = pos1.y, z = pos1.z},
{x = pos1.x - 1, y = pos1.y + 1, z = pos1.z}
},
[3] =
{
{x = pos1.x + 1, y = pos1.y - 1, z = pos1.z},
{x = pos1.x + 1, y = pos1.y, z = pos1.z},
{x = pos1.x + 1, y = pos1.y + 1, z = pos1.z}
},
[7] =
{
{x = pos1.x - 1, y = pos1.y - 1, z = pos1.z},
{x = pos1.x - 1, y = pos1.y, z = pos1.z},
{x = pos1.x - 1, y = pos1.y + 1, z = pos1.z},
{x = pos1.x, y = pos1.y + 1, z = pos1.z},
{x = pos1.x + 1, y = pos1.y + 1, z = pos1.z}
},
[6] = 
{
{x = pos1.x + 1, y = pos1.y - 1, z = pos1.z},
{x = pos1.x + 1, y = pos1.y, z = pos1.z},
{x = pos1.x + 1, y = pos1.y + 1, z = pos1.z},
{x = pos1.x, y = pos1.y + 1, z = pos1.z},
{x = pos1.x - 1, y = pos1.y + 1, z = pos1.z}
},
[5] =
{
{x = pos1.x - 1, y = pos1.y - 1, z = pos1.z},
{x = pos1.x - 1, y = pos1.y, z = pos1.z},
{x = pos1.x - 1, y = pos1.y + 1, z = pos1.z},
{x = pos1.x, y = pos1.y - 1, z = pos1.z},
{x = pos1.x + 1, y = pos1.y - 1, z = pos1.z}
},
[4] =
{
{x = pos1.x - 1, y = pos1.y - 1, z = pos1.z},
{x = pos1.x, y = pos1.y - 1, z = pos1.z},
{x = pos1.x + 1, y = pos1.y - 1, z = pos1.z},
{x = pos1.x + 1, y = pos1.y, z = pos1.z},
{x = pos1.x + 1, y = pos1.y + 1, z = pos1.z}
}
}
return pos[t]
end

function doCreateTile(pos)
doAreaCombatHealth(0, 0, pos, 0, 0, 0, 255)
end