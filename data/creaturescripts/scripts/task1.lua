local tasksss = {
	[1] = {name = "Beezers",  sto = 10214, count = 25, time_sto = 5458, time = 1*2400*6000*6000, sto_count = 14130, money = 100, rewardid = 13473, rewardcount = 1, rewardexp = 10000,  text = "Obrigado por me ajudar com essa tarefa, acabo de falar com Ibiki, e como forma de bravura pelo seu ato, convenci ele a lher dar um pergaminho, no qual eu mesmo, irei te entregar, parabens jovem Shinobi."},
}

function onKill(cid, target)
        for _, t in ipairs(tasksss) do
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