local taskssss = {
	[1] = {name = "Wolf",  sto = 10220, count = 50, time_sto = 5460, time = 1*2400*6000*6000, sto_count = 14135, money = 100, rewardid = 13473, rewardcount = 1, rewardexp = 10000,  text = "Obrigado por demonstrar sua bravura contra esses terriveis Wolf, com sua ajuda, pude conversar um pouco com a sociedade de Konoha, logo, falei tambem com Ibiki, que me permitiu lhe dar um pergaminho, pelo seu ato de heroismo com a vila."},
}

function onKill(cid, target)
        for _, t in ipairs(taskssss) do
            local total_count = t.count
            local m_sto = t.sto
            local count_sto = t.sto_count
            if getPlayerStorageValue(cid, m_sto) ~= -1 then
                if getCreatureName(target) == t.name then
                	if (total_count - getPlayerStorageValue(cid, count_sto)) == 1 then
                		setPlayerStorageValue(cid, count_sto, getPlayerStorageValue(cid, count_sto) + 1)
                    	doPlayerSendTextMessage(cid, 20, "[TASK SYSTEM] Voce acaba de derrotar todos os ".. getPlayerStorageValue(cid, count_sto) .." " .. t.name .. " e completar sua TASK.")
                    	return true
                    elseif (total_count - getPlayerStorageValue(cid, count_sto)) >= 1 then
                        setPlayerStorageValue(cid, count_sto, getPlayerStorageValue(cid, count_sto) + 1)
                        doPlayerSendTextMessage(cid, 20, "[TASK SYSTEM] Voce acaba de derrotar ".. getPlayerStorageValue(cid, count_sto) .." de ".. total_count .." " .. t.name .. " para que possa terminar a TASK.")
                        return true
                    end
                end
            end
        end
    return true
end