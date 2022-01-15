function onSay(cid, words, param)
    if(param == "") then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Name and message required.")
        return TRUE
    end

    local t = string.explode(param, ";")
    local player = getPlayerByNameWildcard(t[1])
    if(not t[2]) then
         doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Add a ; and then add your message.")
    elseif(doPlayerPopupFYI(player, "Sender: " .. getCreatureName(cid) .. "nRank: " .. getPlayerGroupName(cid) .. "n".. t[2] .."")== LUA_ERROR) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Bad message color type.")
        return TRUE
    end
    return TRUE
end