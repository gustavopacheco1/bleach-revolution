local i = {
["12:00"] = {nome = "Tobi e Madara Invasao", pos = {x=987, y=915, z=7}, monster = {"1 Madara", "1 Tobi"}},
["13:00"] = {nome = "Sambi e Shukaku Invasao", pos = {x=987, y=915, z=7}, monster = {"1 Sambi", "1 Shukaku"}},
}

function onThink(interval, lastExecution)
hours = tostring(os.date("%X")):sub(1, 5)
tb = i[hours]
if tb then
doBroadcastMessage(hours .. " - " .. tb.nome .. " Iníciou.")
for _,x in pairs(tb.monster) do
for s = 1, tonumber(x:match("%d+")) do
doSummonCreature(x:match("%s(.+)"), tb.pos)
end
end
end
return true
end