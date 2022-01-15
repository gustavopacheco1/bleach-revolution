local config = {
    positions = {
        ["Scroll's"] = { x = 1080, y = 846, z = 15 },
        ["Item's "] = { x = 1075, y = 846, z = 15 },
        ["Buuf's "] = { x = 1077, y = 844, z = 15 },
        ["Buuf's"] = { x = 1078, y = 844, z = 15 },
        ["Point's"] = { x = 1077, y = 848, z = 15 },
        ["Point's "] = { x = 1078, y = 848, z = 15 },
        
    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 255))
    end
    
    return TRUE
end  