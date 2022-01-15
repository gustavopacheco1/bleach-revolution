function onDeath(cid, corpse, deathList)
local config = {
onlypremium = false, -- se precisa ser premium para não perder nada
exp = true, -- se ao morrer o jogador irá perder exp
skills = false, -- se ao morrer vai perder skills
magic = false, -- se vai perder magic level
loot = true, -- se ao morrer o jogador irá perder o loot
level = 999 -- até que level irá proteger o player
}
if isPlayer(cid) and getPlayerLevel(cid) <= config.level then
if config.onlypremium == true and not isPremium(cid) then return TRUE end
if config.loot == false then doCreatureSetDropLoot(cid, false) end
if config.magic == false then doPlayerSetLossPercent(cid, PLAYERLOSS_MANA, 0) end
if config.skills == false then doPlayerSetLossPercent(cid, PLAYERLOSS_SKILLS, 0) end
if config.exp == false then doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, 0) end
return TRUE end return TRUE end