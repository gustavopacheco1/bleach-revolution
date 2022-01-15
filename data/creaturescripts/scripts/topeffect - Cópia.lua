--[[
	Script by Bruno Minervino para o Tibia King
	Caso for postar, colocar os créditos
]]

local config = {
	tempo = 10, --tempo em segundos
	mensagem = {
		texto = "[TOP 1]", --não use mais de 9 caracteres
		efeito = TEXTCOLOR_RED --efeito para a função doSendAnimatedText
	},
	efeito = 30, --efeito da função doSendMagicEffect
	globalstr = 89766 -- uma global storage qualquer q esteje vazia
}

--[[ Não mexa em nada abaixo ]]
local topPlayer = getGlobalStorageValue(config.globalstr) > 0 and getGlobalStorageValue(config.globalstr) or 0

function onLogin(cid)
	local query = db.getResult("SELECT `id`, `name`, `level` FROM `players` WHERE `group_id` < 2 ORDER BY `level` DESC LIMIT 1")
	if (query:getID() ~= -1) then
		local pid = query:getDataString("id")
		local name = query:getDataString("name")
		if getPlayerName(cid) == name then
			if topPlayer ~= getPlayerID(cid) then topPlayer = getPlayerID(cid) end
			setGlobalStorageValue(config.globalstr, pid)
			TopEffect(cid)
		end
	end
	registerCreatureEvent(cid, "CheckTop")
	return true
end

function onAdvance(cid, skill, oldlevel, newlevel)
	if skill == 8 then
		local query = db.getResult("SELECT `id`, `name`, `level` FROM `players` WHERE `group_id` < 2 ORDER BY `level` DESC LIMIT 1")
		if (query:getID() ~= -1) then
			local level = tonumber(query:getDataString("level"))
			if level < newlevel and topPlayer ~= getPlayerID(cid) then
				doBroadcastMessage("O jogador " .. getPlayerName(cid) .. " tornou-se o novo Top Level. Parabens!", 22)
				topPlayer = getPlayerID(cid)
				doSaveServer()
				setGlobalStorageValue(config.globalstr, getPlayerID(cid))
				TopEffect(cid)
			end			
		end
	end
	return true
end

function TopEffect(cid)
	if not isPlayer(cid) then return true end
	if topPlayer == getPlayerID(cid) then
		doSendAnimatedText(getCreaturePosition(cid), config.mensagem.texto, config.mensagem.efeito)
		doSendMagicEffect(getCreaturePosition(cid), config.efeito)
		addEvent(TopEffect, config.tempo * 1000, cid)
	end
end

function getPlayerNameById(id)
	local query = db.getResult("SELECT `name` FROM `players` WHERE `id` = " .. db.escapeString(id))
	if query:getID() ~= -1 then
		return query:getDataString("name")
	end
	return 0
end

function getPlayerIdByName(name)
	local query = db.getResult("SELECT `id` FROM `players` WHERE `name` = " .. db.escapeString(name))
	if query:getID() ~= -1 then
		return tonumber(query:getDataString("id"))
	end
	return 0
end

function getPlayerID(cid)
	return getPlayerIdByName(getPlayerName(cid))
end