local positions = {
    ["[RANK D]"]        = {pos = {x = 1019, y = 1097, z = 7}, color = {205, 210}, effect = {}},
}

function onThink(cid, interval, lastExecution)
    for t, pos in pairs(positions) do
        for _, effect in ipairs(pos.effect) do
            if(#pos.effect > 0) then
			doSendAnimatedText(pos.pos,"[RANK D]", math.random(1,255))
            end
        end
			doSendAnimatedText(pos.pos,"[RANK D]", math.random(1,255))
    end
    return true
end