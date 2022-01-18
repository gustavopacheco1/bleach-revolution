local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)    npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()       npcHandler:onThink() end

local travelNode = keywordHandler:addKeyword({'Karakura'}, StdModule.travel, {npcHandler = npcHandler, level = 1, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=1030, y=1013, z=7}})

local travelNode = keywordHandler:addKeyword({'Adjuchas City'}, StdModule.travel, {npcHandler = npcHandler, level = 1, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=1083, y=951, z=7}})

local travelNode = keywordHandler:addKeyword({'Flying City'}, StdModule.travel, {npcHandler = npcHandler, level = 1, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=705, y=1151, z=7}})

local travelNode = keywordHandler:addKeyword({'Mini Fisher'}, StdModule.travel, {npcHandler = npcHandler, level = 1, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=751, y=1151, z=7}})

local travelNode = keywordHandler:addKeyword({'Fraccion City'}, StdModule.travel, {npcHandler = npcHandler, level = 1, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=1254, y=1082, z=7}})

local travelNode = keywordHandler:addKeyword({'Gilliam City'}, StdModule.travel, {npcHandler = npcHandler, level = 1, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=879, y=985, z=7}})

local travelNode = keywordHandler:addKeyword({'Grand Fisher City'}, StdModule.travel, {npcHandler = npcHandler, level = 1, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=, y=1157, z=7}})

local travelNode = keywordHandler:addKeyword({'Grand Fisher Lv 2 City'}, StdModule.travel, {npcHandler = npcHandler, level = 1, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=1196, y=1031, z=7}})

local travelNode = keywordHandler:addKeyword({'Arrancar Hollow City'}, StdModule.travel, {npcHandler = npcHandler, level = 1, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=646, y=939, z=7}})

local travelNode = keywordHandler:addKeyword({'death forest'}, StdModule.travel, {npcHandler = npcHandler, level = 1, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=804, y=921, z=6}})

local travelNode = keywordHandler:addKeyword({'hoshigakure island'}, StdModule.travel, {npcHandler = npcHandler, level = 1, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=2047, y=1153, z=6}})

local travelNode = keywordHandler:addKeyword({'yukigakure no sato'}, StdModule.travel, {npcHandler = npcHandler, level = 1, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=1763, y=1109, z=6}})

local travelNode = keywordHandler:addKeyword({'takigakure no sato'}, StdModule.travel, {npcHandler = npcHandler, level = 1, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=1278, y=1255, z=6}})

local travelNode = keywordHandler:addKeyword({'monte myoboku'}, StdModule.travel, {npcHandler = npcHandler, level = 1, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=1525, y=604, z=6}})

 -- Makes sure the npc reacts when you say hi, bye etc.       

npcHandler:addModule(FocusModule:new())
