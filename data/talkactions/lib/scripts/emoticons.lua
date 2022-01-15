function onSay(cid, words, param, channel)
local table = {
[':|'] = 44,
[':D'] = 43,
['o.o'] = 45,
['^^'] = 46,
[':O'] = 47,
['¬¬'] = 48,
['i.i'] = 49,
[':$'] = 50
}

local params = {':|',':D','o.o','^^',':O','¬¬','i.i',':$'}
if isInArray(params,param) then
doSendMagicEffect(getCreaturePosition(cid), table[param])
else
doPlayerSendTextMessage(cid,4,"No Existe Ese Emoticon!")
end
return TRUE
end