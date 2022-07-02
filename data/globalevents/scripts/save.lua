local config = {
	broadcast = { 1 },
	flags = 13,
	delay = 1,
	events = 1
}

local function executeSave(seconds)
	if (isInArray(config.broadcast, seconds)) then
		doBroadcastMessage("Salvando...")
	end

	if (seconds > 0) then
		addEvent(executeSave, config.events * 1000, seconds - config.events)
	else
		doSaveServer(config.flags)
	end
end

function onThink(interval)
	if (table.maxn(config.broadcast) == 0) then
		doSaveServer(config.flags)
	else
		executeSave(config.delay)
	end

	return true
end
