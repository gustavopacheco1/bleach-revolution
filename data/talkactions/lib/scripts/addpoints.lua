local function doPlayerAddDepotItems(pid, item, count)
    local result = db.getResult("SELECT sid FROM player_depotitems WHERE player_id = "..pid.." ORDER BY sid DESC LIMIT 1")
    if (result:getID() ~= -1) then
        local ls = tonumber(result:getDataInt("sid"))
        return db.executeQuery("INSERT INTO player_depotitems (player_id, sid, pid, itemtype, count, attributes) VALUES ("..pid..", "..(ls+1)..", 101, "..item..", "..count..", '')")
    end
end

local points = 9970 -- ID dos points
local present = 1990 -- ID do container que ira vir

function onSay(cid, words, param)
    local t = string.explode(param:lower(),",")
    local player = getPlayerByNameWildcard(t[1])
    if not t[1] then
        return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Digite o nome do jogador.")
    elseif not player and not getPlayerGUIDByName(t[1]) then
        return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Este nome nao existe.")
    elseif not player and getPlayerGUIDByName(t[1]) and tonumber(t[2]) and tonumber(t[2]) > 100 then
        return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"O jogador esta offline, apenas 100 points por vez.")
    elseif not tonumber(t[2]) or tonumber(t[2]) < 1 or t[2] == "" then
        return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Digite a quantidade.")
    end
    local present = doCreateItemEx(present-1)
    doAddContainerItem(present, points, t[2])
    if player then
        doPlayerSendMailByName(getPlayerNameByGUID(getPlayerGUIDByName(t[1])), present, 1)
    else
        doPlayerAddDepotItems(getPlayerGUIDByName(t[1]), points, t[2])
    end
    return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"voce adicionou "..t[2].." "..getItemNameById(points)..""..(tonumber(t[2]) > 1 and "s" or "").." ao jogador "..getPlayerNameByGUID(getPlayerGUIDByName(t[1])))
end