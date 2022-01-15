function onThink(interval, lastExecution)
_Lib_Battle_Days = {
["Monday"] = {
["15:00"] = {players = 24},
["21:00"] = {players = 20}
},
["Wednesday"] = {
["15:00"] = {players = 26}
},
["Saturday"] = {
["11:30"] = {players = 30},
["13:30"] = {players = 30},
["14:00"] = {players = 30},
["15:00"] = {players = 36},
["15:17"] = {players = 38},
["15:30"] = {players = 30},
["16:00"] = {players = 40},
["16:20"] = {players = 38},
["18:00"] = {players = 32},
["20:00"] = {players = 30},
["20:30"] = {players = 34},
["21:00"] = {players = 30}
}
}
if _Lib_Battle_Days[os.date("%A")] then
hours = tostring(os.date("%X")):sub(1, 5)
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