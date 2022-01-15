local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)

	if getCreatureStorage(cid, FLY_STORAGE) > 0 then
	local storpos = {x = getCreatureStorage(cid, storPos.x), y = getCreatureStorage(cid, storPos.y), z = getCreatureStorage(cid, storPos.z), stackpos = 0}
	doCreateTile(storpos)
	local thing = getThingFromPos(storpos)
	if thing.itemid < 1 or isInArray(WATER, thing.itemid) then
	for _, area in ipairs(getArea(storpos, RANGEX, RANGEY)) do
	doCreateTile(area)
	local thing = getThingFromPos(area)
	if thing.itemid < 1 then
	doCreateItem(ITEM_FLYTILE, 1, area)
	elseif isInArray(WATER, getThingFromPos(area).itemid) then
	doTransformItem(getThingFromPos(area).uid, ITEM_WATERTILE)
	end
	end
	end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você está voando agora.")
	doTeleportThing(cid, storpos)
	return true
	end

    -- Login Cancel Invisible --
    if(getPlayerGroupId(cid) == 2) then
    setPlayerGroupId(cid, 1)
    end
    if(isPlayerGhost(cid)) then
    doCreatureExecuteTalkAction(cid, "/ghost", TRUE)
    end
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Ola , parece que que o nome do seu personagem foi bloqueado, qual seu novo nome voce gostaria?")
	elseif(accountManager == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Ola, escreva 'account' para gerenciar sua conta e se quiser voltar escreva 'cancel'.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Ola, escreva 'account' para criar a sua propria ou 'recover' para recuperar sua conta.")
	end
	

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end

	registerCreatureEvent(cid, "Mail")
	registerCreatureEvent(cid, "GuildMotd")
      
	registerCreatureEvent(cid, "Idle")
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end
	       registerCreatureEvent(cid, "ProtDeath")


			registerCreatureEvent(cid, "RatesMagicLogin")
			registerCreatureEvent(cid, "RatesMagicAdvance")
			registerCreatureEvent(cid, "onAttackSummon")
			registerCreatureEvent(cid, "AdvLevelSpells")
			registerCreatureEvent(cid, "samehada")
			registerCreatureEvent(cid, "logout delay")
			registerCreatureEvent(cid, "TopEffect")
			registerCreatureEvent(cid, "CheckTOp")
			registerCreatureEvent(cid, "Morte")
			registerCreatureEvent(cid, "ondeath")
			registerCreatureEvent(cid, "WeaponMana")
            registerCreatureEvent(cid, "onPrepareDeathinifi")
			registerCreatureEvent(cid, "showVoc")       
			registerCreatureEvent(cid, "ReportBug")
			registerCreatureEvent(cid, "AdvanceSave")
            registerCreatureEvent(cid, "checkBless")
            registerCreatureEvent(cid, "recompensa")
            registerCreatureEvent(cid, "hmup")
            registerCreatureEvent(cid, "ExpBonus")
            registerCreatureEvent(cid, "pg")
            registerCreatureEvent(cid, "BroadDeath")
            registerCreatureEvent(cid, "Recompensa")
            registerCreatureEvent(cid, "monster")
            registerCreatureEvent(cid, "NoLootZ")     
            registerCreatureEvent(cid, "invencible")
			registerCreatureEvent(cid, "outfit")
			registerCreatureEvent(cid, "FirstItems")
			registerCreatureEvent(cid, "Party")
			registerCreatureEvent(cid, "MagicLevel")
			registerCreatureEvent(cid, "advance")
			registerCreatureEvent(cid, "showKD")
			registerCreatureEvent(cid, "BoasVindas")
			registerCreatureEvent(cid, "FlyMove")
			registerCreatureEvent(cid, "FlyLogout")
			registerCreatureEvent(cid, "FlyAttack")
			registerCreatureEvent(cid, "SetStoragePassiva")
			registerCreatureEvent(cid, "PlayerLogout")
			registerCreatureEvent(cid, "KillTask")
			registerCreatureEvent(cid, "Look")
			registerCreatureEvent(cid, "kyoku")
			registerCreatureEvent(cid, "PlayerLogout")
			registerCreatureEvent(cid, "BlockHit6")
			
			if getPlayerStorageValue(cid, 3482102) ~= 0 then
			setPlayerStorageValue(cid, 3482102, 0)
			registerCreatureEvent(cid, "critical")
			if getPlayerStorageValue(cid, 48913) == -1 then
			setPlayerStorageValue(cid, 48913, 0)
			end
			registerCreatureEvent(cid, "refletir")
			if getPlayerStorageValue(cid, 3482101) ~= 0 then
			end
			setPlayerStorageValue(cid, 3482101, 0) 
			end
			---------- PlayerPort---------------
			if getPlayerStorageValue(cid, 49708) ~= 0 then
			setPlayerStorageValue(cid, 49708, 0) 
			end
			--- BOSS SKILLS ----
			registerCreatureEvent(cid, "reborn")
			if getPlayerStorageValue(cid, 19336) == -1 then
			setPlayerStorageValue(cid, 19336, 0) 
			end 
			--- RIDE ----
			if getPlayerLevel(cid) > 1 then
			setPlayerStorageValue(cid, 171994, 1)
			end	
			return true
			end