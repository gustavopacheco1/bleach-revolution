function onSay(cid, words, param)
    local position = getPlayerPosition(cid)

    if getPlayerLookDir(cid) == 0 then
        positions = {x=position.x, y=position.y-1, z=position.z}
    elseif getPlayerLookDir(cid) == 1 then
        positions = {x=position.x+1, y=position.y, z=position.z}
    elseif getPlayerLookDir(cid) == 2 then
        positions = {x=position.x, y=position.y+1, z=position.z}
    elseif getPlayerLookDir(cid) == 3 then
        positions = {x=position.x-1, y=position.y, z=position.z}
    end

    if getHouseFromPos(positions) == false then
        doPlayerSendTextMessage(cid, 27, "Voce precisa estar na frente da porta da casa para usar o comando.")
    return true
    end

    local days = 7*24*60*60
    local own = getHouseOwner(getHouseFromPos(positions))
    local qry = db.getResult("SELECT `lastlogin` FROM `players` WHERE `id` = "..own)
    
    if(qry:getID() ~= -1) then
        last = tonumber(qry:getDataInt("lastlogin"))
        if last < os.time() - days then
            setHouseOwner(getHouseFromPos(positions), NO_OWNER_PHRASE,true)
            doPlayerSendTextMessage(cid, 27, "A Casa agora esta sem dono, você ou outro jogador pode compra-la")
        end
        if last > os.time() - days then
            doPlayerSendTextMessage(cid, 27, "O proprietário desta casa ainda está ativo no servidor, tente outra casa.")
        end
    end
    return true
end