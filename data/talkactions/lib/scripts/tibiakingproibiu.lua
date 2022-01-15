function getFixedText(cid, text, replace)
    local wrongWords = {"#####", "ots-list.pl", "google.br", ".ddns.net", "hopto.org", "no-ip.org", "servegame.com", "ntoultimade", "nto lost, "nto advanted"}
        local lowerText = string.lower(text)
        local noSpaceText = string.gsub(string.gsub(string.gsub(lowerText, "%s", ""), "%p", ""),"-", "")
        for w = 1, #wrongWords do
                wordLen = string.len(wrongWords[w])
                for p = 1, string.len(text) do
                        if(string.sub(lowerText, p, p+wordLen-1) == wrongWords[w]) then
                                text = string.sub(text, 1, p-1) .. string.rep(replace, wordLen) .. string.sub(text, p+wordLen)
                        end
                end
        end
 
        if(string.lower(text) == lowerText) then
                for c = 1, #wrongWords do
                        if(string.find(noSpaceText, string.gsub(string.gsub(wrongWords[c], "%p", ""),"-", "")) ~= nil) then
                                return "I want to post forbidden links.."
                        end
                end
        end
    return text
end
 
--[[Channels which are not added to block:
1 - Party Channel
2 - Channel for Staff members
3 - Rule Violation Channel
4 - Channel for Counselors/Tutors
65536 - Private Chat Channel  <-- Private Chat cannot be blocked with this script
]]--
local blocked_channels = {5,8,9} --Game-Chat, Real Chat, Help Channel
local trade_channels = {6,7} --All trade channels <- These are also blocked
local replace = "°" --Symbols which are shown instead of forbidden links -> ° 
local delay = {16246,10} -- {empty_storage, lenght of muted}
 
function onSay(cid, words, param, channel)
        local fixedWords = getFixedText(cid, words, replace)
 
        if words ~= fixedWords and getPlayerAccess(cid) == 0 then
                if getPlayerStorageValue(cid,delay[1]) > os.time() then
                        return doPlayerSendCancel(cid,"Voce foi mutado por ".. getPlayerStorageValue(cid,delay[1])-os.time() .." segundos, aqui e proibido divulgar.")
                end
                setPlayerStorageValue(cid,delay[1],os.time()+delay[2])
                if channel == CHANNEL_DEFAULT then 
                        doCreatureSay(cid, fixedWords, TALKTYPE_SAY)
                        doPlayerPopupFYI(cid, "Link: "..words.." e proibido, mal educado!.")
                        return true
                elseif isInArray(trade_channels, channel) then 
                        doPlayerPopupFYI(cid, "Link: "..words.." e proibido neste canal.")
                        return true
                elseif isInArray(blocked_channels, channel) then
                        doPlayerPopupFYI(cid, "Link: "..words.." e proibido, mal educado!.")
                        doPlayerSendChannelMessage(cid, getCreatureName(cid), fixedWords, TALKTYPE_CHANNEL_Y, channel)
                        return true
                end
        end
        return false
end