local config = {
    useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)
    local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
    if (lastLogin > 0) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
        str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
    end

    -- Death Penalty
    local loss = getConfigValue('deathLostPercent')
    if (loss ~= nil) then
        if getPlayerLevel(cid) > 8 then
            doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 14)
        else
            doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, 0)
        end
        doPlayerSetLossPercent(cid, PLAYERLOSS_SKILLS, loss * 1)
        doPlayerSetLossPercent(cid, PLAYERLOSS_MANA, loss * 1)
    end

    if (getPlayerStorageValue(cid, "death_bless") == 1) then
        local t = {PLAYERLOSS_EXPERIENCE, PLAYERLOSS_SKILLS, PLAYERLOSS_ITEMS, PLAYERLOSS_CONTAINERS}
        for i = 1, #t do
            doPlayerSetLossPercent(cid, t[i], 100)
        end
        setPlayerStorageValue(cid, "death_bless", 0)
    end

    if (not isPlayerGhost(cid)) then
        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
    end

    -- Events
    registerCreatureEvent(cid, "Idle")
    registerCreatureEvent(cid, "Mail")

    if(getPlayerOperatingSystem(cid) >= CLIENTOS_OTCLIENT_LINUX) then
		registerCreatureEvent(cid, "ExtendedOpcode")
	end
    
    if (config.useFragHandler) then
        registerCreatureEvent(cid, "SkullCheck")
    end

    registerCreatureEvent(cid, "ReportBug")
    registerCreatureEvent(cid, "GuildEvents")
    registerCreatureEvent(cid, "AdvanceSave")
    registerCreatureEvent(cid, "recordIp")
    registerCreatureEvent(cid, "PlayerTrade")
    
    if getPlayerLevel(cid) > 1 then setPlayerStorageValue(cid, 171994, 1) end
    doCreatureSetStorage(cid, "save", (os.time() + 120))
    return true
end
