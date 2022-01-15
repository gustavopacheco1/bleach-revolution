function onSay(cid, words, param)
if getPlayerAccess(cid) > 2 then
doShowTextDialog(cid, 2175, "Staff buga os spells!")
return TRUE
end
local count = getPlayerInstantSpellCount(cid)
local text = ""
local t = {}
for i = 0, count - 1 do
local spell = getPlayerInstantSpellInfo(cid, i)
if spell.level ~= 0 then
if spell.manapercent > 0 then
spell.mana = spell.manapercent .. "%"
end
table.insert(t, spell)
end
end
table.sort(t, function(a, b) return a.level < b.level end)
local prevLevel = -1
for i, spell in ipairs(t) do
local line = ""
if prevLevel ~= spell.level then
if i ~= 1 then
line = "\n"
end
line = line .. "Jutsus para level: " .. spell.level .. "\n"
prevLevel = spell.level
end
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. "\n"
end
doShowTextDialog(cid, 2175, text)
return TRUE
end