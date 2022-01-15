local config = {
    positions = {
        ["Escolha"] = { x = 1227, y = 831, z = 7 },
        ["Novamente"] = { x = 1228, y = 831, z = 7 },
        ["Seu"] = { x = 1229, y = 831, z = 7 },
        ["Personagem"] = { x = 1230, y = 831, z = 7 }
        
    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, 138)
    end
    
    return TRUE
end  