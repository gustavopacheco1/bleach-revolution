function onSay(cid, words, param)
doSetGameState(GAMESTATE_MAINTAIN)
local function setMaintenceoff(seconds)
doSetGameState(GAMESTATE_NORMAL)
end
addEvent(setMaintenceoff, 30 * 1000)

return TRUE
end