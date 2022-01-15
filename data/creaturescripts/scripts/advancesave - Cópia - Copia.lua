function onPrepareDeath(cid, lastHitKiller, mostDamageKiller)
if isPlayer(cid) == true then
if (getPlayerSlotItem(cid, 2).itemid == 11403) then           >> 11403<< é o ID Do Aol Vcs Editão Ai O ID Do Aol Que Vcs Querem
pos = getCreaturePos(cid)
doCreatureSetDropLoot(cid, false)
doPlayerSetLossPercent(cid, experience, 0)
doSendMagicEffect(pos, 49)
return TRUE
end
end
return TRUE
end