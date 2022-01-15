function onAdvance(cid, skill, oldlevel, newlevel)
local maxml = 126
if skill == 7 then
if newlevel >= maxml then
doPlayerSetMagicRate(cid, 0)
setPlayerStorageValue(cid, 20130315, maxml)
end
end
return true
end