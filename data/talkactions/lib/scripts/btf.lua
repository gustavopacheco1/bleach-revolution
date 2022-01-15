function onSay(cid, words, param, channel) 

tb = _Lib_Battle_Days[os.date("%A")][hours]
if tb and (tb.players % 2 == 0) then
local tp = doCreateItem(5023, 1, _Lib_Battle_Info.tpPos)
doItemSetAttribute(tp, "aid", 45000)
CheckEvent(_Lib_Battle_Info.limit_Time)
doBroadcastMessage("Guerra Ninja Event foi aberto, esperando "..tb.players.." Players! Os participantes serao randimicamente escolhidos para os time, serao "..((tb.players)/2).." VS "..((tb.players)/2))
return setGlobalStorageValue(_Lib_Battle_Info.storage_count, tb.players)
end
end
return true
end