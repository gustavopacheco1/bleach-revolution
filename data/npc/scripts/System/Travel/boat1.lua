local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
  
  
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
 
 
local travelNode = keywordHandler:addKeyword({'kenkyushitsu'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você realmente, deseja viajar para a Vila da Folha?'})
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=1195, y=1030, z=7} })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})
 
local travelNode = keywordHandler:addKeyword({'awaji island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você realmente, deseja viajar para a Vila dos Passaros?'})
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=908, y=1317, z=7} })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})

local travelNode = keywordHandler:addKeyword({'nanakusa island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você realmente, deseja viajar para a Vila da Areia?'})
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=994, y=1095, z=7} })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})

local travelNode = keywordHandler:addKeyword({'pinterest land'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você realmente, deseja viajar para a Vila da Névoa?'})
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=1189, y=1134, z=7} })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})

local travelNode = keywordHandler:addKeyword({'kaji island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você realmente, deseja viajar para a Vila da Aguá?'})
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=790, y=1061, z=7} })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})

local travelNode = keywordHandler:addKeyword({'nendo island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você realmente, deseja viajar para a Vila da Aguá?'})
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=752, y=1150, z=7} })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})
 
npcHandler:addModule(FocusModule:new())