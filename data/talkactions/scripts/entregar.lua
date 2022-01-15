function onSay(cid, words, param, channel)
    local sto = 8445610 -- STORAGE USADO PELO SISTEMA
    local pontos = 11513 -- ID DOS PONTOS QUE O PLAYER VAI RECEBER
    local t = string.explode(param, ",")
    local effect = 50
    
    if param == "" or not t[2] then
        return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite /entregar NICK, QUANTIA DE ".. getItemNameById(pontos) .."")
    end
    
    local player = getPlayerByNameWildcard(tostring(t[1]))
    local quantia = tonumber(t[2])
   if not t[2] then quantia = 1 end
   
    local file = io.open('data/logs/entregar-log.txt','a')
    file:write("Dia: "..os.date("%d").."/"..os.date("%m").."/"..os.date("%Y").." Hora: "..os.date("%X").." :::: ".. quantia .." ".. getItemNameById(pontos) .." entregues para '".. t[1] .."'\n")
    file:close()
    
    if not isPlayer(player) then
        forceSetStorage(t[1], sto, quantia)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Dia: "..os.date("%d").."/"..os.date("%m").."/"..os.date("%Y").." Hora: "..os.date("%X").." :::: ".. quantia .." ".. getItemNameById(pontos) .." entregues para '".. t[1] .."'")
        return true
    end
    
    if isPlayer(player) then
        local pos = getCreaturePosition(player)
        doSendMagicEffect(pos, effect) 
    end
    
    local atual = getPlayerStorageValue(cid, sto)
    if atual <= 0 then tem = 0 else tem = atual end
    
    setPlayerStorageValue(player, sto, quantia + tem)
    doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_BLUE, "".. getPlayerName(cid) .." te entregou ".. quantia .." ".. getItemNameById(pontos) .."'s!\nVa ate o bau para receber.")
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Dia: "..os.date("%d").."/"..os.date("%m").."/"..os.date("%Y").." Hora: "..os.date("%X").." :::: ".. quantia .." ".. getItemNameById(pontos) .." entregues para '".. t[1] .."'")
    return true
end
    function forceSetStorage(name, key, value)
        if not tostring(name) or not tonumber(key) then return nil end
        local p = getPlayerByName(name)
        if p then
            setPlayerStorageValue(p, key, value)
        else
        local have = db.getResult("SELECT `key` FROM `player_storage` WHERE `player_id` = ".. getPlayerGUIDByName(name) .." and `key` = ".. key)
        if have:getID() == -1 then
            local pid = getPlayerGUIDByName(name)
                db.query("INSERT INTO `player_storage` (`player_id` ,`key` ,`value`) VALUES ('".. pid .."', '".. key .."', '".. value .."');")
            return true
        end
        local atual = db.getResult("SELECT `value` FROM `player_storage` WHERE `player_id`= ".. getPlayerGUIDByName(name) .." and `key` = ".. key ..";")
        local temagr = atual:getDataInt("value")
        db.query("UPDATE `player_storage` SET `value` = '".. temagr + value .."' WHERE `player_id` = '".. getPlayerGUIDByName(name) .."' AND `key` = ".. key)
        end
        return true
    end
