function onExtendedOpcode(cid, opcode, buffer, param)
		local missionInfo = "D = ".. getPlayerStorageValue(cid, sto_missao[2]) .."  De-C = ".. getPlayerStorageValue(cid, sto_missao[3]) .." Ce-B =  ".. getPlayerStorageValue(cid, sto_missao[4]) .." Be-A =  ".. getPlayerStorageValue(cid, sto_missao[5]) .." Ae-S =  ".. getPlayerStorageValue(cid, sto_missao[6]) .." Se-"
-----------------DOGINFO---------------------------
		doSendPlayerExtendedOpcode(cid, 105, getPlayerVocation(cid))
	if opcode == 106 then
		local pet = getPlayerPet(cid)
		if pet then
		local dogInfo = "HP = ".. getCreatureHealth(pet) .."  MHP = ".. getCreatureMaxHealth(pet).." HPe-LV = 1 LVe-CL = ".. getCreatureMana(pet) .."  MCL = "..getCreatureMaxMana(pet).." CLe-HPe-LVPET = "..getPetLevel(pet).." LVPETe-XP = ".. getPetExperience(pet) .." XPe-SP = "..getCreatureSpeed(pet).." SPe-SCL = "..getPetChakraLevel(cid).." SCLe-SRT = "..getPetResistenceLevel(cid).." SRTe-DS = "..getPetSkill(cid).." DSe-PSS = "..getPetSpeed(cid).." PSSe-"
		doSendPlayerExtendedOpcode(cid, 102, dogInfo)
		doSendPlayerExtendedOpcode(cid, 103, getCreatureName(pet))
	end
end   

-------------DOG SKILL --------------------------------
	if opcode == 97 then
		if buffer == "resistanceButton" then
		local pet = getPlayerPet(cid)
			if not pet then
				doPlayerSendTextMessage(cid, 27, "Chame o seu pet primeiro")
			return true
			end
		if getLevelSoul(cid, 0) then
				doPlayerSendTextMessage(cid, 27, "You dont have enough points") 
			return true
		end
			doPlayerAddSoul(cid, -1)
			setPlayerStorageValue(cid, petStorages.maxHealth, getPetMaxHealth(cid)+5)
			setPlayerStorageValue(cid, petStorages.res, getPetResistenceLevel(cid)+1)
		if pet then
			local dogInfo = "HP = ".. getCreatureHealth(pet) .."  MHP = ".. getCreatureMaxHealth(pet).." HPe-LV = 1 LVe-CL = ".. getCreatureMana(pet) .."  MCL = "..getCreatureMaxMana(pet).." CLe-HPe-LVPET = "..getPetLevel(pet).." LVPETe-XP = ".. getPetExperience(pet) .." XPe-SP = "..getCreatureSpeed(pet).." SPe-SCL = "..getPetChakraLevel(cid).." SCLe-SRT = "..getPetResistenceLevel(cid).." SRTe-DS = "..getPetSkill(cid).." DSe-PSS = "..getPetSpeed(cid).." PSSe-"
			doSendPlayerExtendedOpcode(cid, 102, dogInfo)
		end
	elseif buffer == "chakraLevelButton" then
		local pet = getPlayerPet(cid)
			if not pet then
				doPlayerSendTextMessage(cid, 27, "Chame o seu pet primeiro")
			return true
			end
			if getLevelSoul(cid, 0) then
				doPlayerSendTextMessage(cid, 27, "You dont have enough points") 
			return true
		end
			doPlayerAddSoul(cid, -1)
			setPlayerStorageValue(cid, petStorages.maxChakra, getPetMaxChakra(cid)+5)
			setPlayerStorageValue(cid, petStorages.chakra, getPetChakraLevel(cid)+1)
		if pet then
			local dogInfo = "HP = ".. getCreatureHealth(pet) .."  MHP = ".. getCreatureMaxHealth(pet).." HPe-LV = 1 LVe-CL = ".. getCreatureMana(pet) .."  MCL = "..getCreatureMaxMana(pet).." CLe-HPe-LVPET = "..getPetLevel(pet).." LVPETe-XP = ".. getPetExperience(pet) .." XPe-SP = "..getCreatureSpeed(pet).." SPe-SCL = "..getPetChakraLevel(cid).." SCLe-SRT = "..getPetResistenceLevel(cid).." SRTe-DS = "..getPetSkill(cid).." DSe-PSS = "..getPetSpeed(cid).." PSSe-"	
			doSendPlayerExtendedOpcode(cid, 102, dogInfo)
		end
		elseif buffer == "agilityButton" then
		local pet = getPlayerPet(cid)
			if not pet then
				doPlayerSendTextMessage(cid, 27, "Chame o seu pet primeiro")
			return true
			end
			if getLevelSoul(cid, 0) then
				doPlayerSendTextMessage(cid, 27, "You dont have enough points") 
			return true
		end
			doPlayerAddSoul(cid, -1)
			setPlayerStorageValue(cid, petStorages.petSpeed, getPetSpeed(cid)+1)
			if pet then
			local speed = getCreatureSpeed(pet)
			doChangeSpeed(pet, -getCreatureSpeed(pet))
			doChangeSpeed(pet, speed+2)
			setPlayerStorageValue(cid, petStorages.saveSpeed, speed+2)
			local dogInfo = "HP = ".. getCreatureHealth(pet) .."  MHP = ".. getCreatureMaxHealth(pet).." HPe-LV = 1 LVe-CL = ".. getCreatureMana(pet) .."  MCL = "..getCreatureMaxMana(pet).." CLe-HPe-LVPET = "..getPetLevel(pet).." LVPETe-XP = ".. getPetExperience(pet) .." XPe-SP = "..getCreatureSpeed(pet).." SPe-SCL = "..getPetChakraLevel(cid).." SCLe-SRT = "..getPetResistenceLevel(cid).." SRTe-DS = "..getPetSkill(cid).." DSe-PSS = "..getPetSpeed(cid).." PSSe-"	
			doSendPlayerExtendedOpcode(cid, 102, dogInfo)
		end
		end	
	end
----------------------------------SKILL---------------------------------------------
	if opcode == 26 then
		doSendPlayerExtendedOpcode(cid, 26, getPlayerVocation(cid))
	elseif opcode == 27 then
		doSendPlayerExtendedOpcode(cid, 27, getPlayerVocation(cid))
	elseif opcode == 10 then
		doSendPlayerExtendedOpcode(cid, 10, missionInfo)	 
	elseif opcode == 28 then
		doSendPlayerExtendedOpcode(cid, 28, getPlayerStorageValue(cid, 600))
	elseif opcode == 29 then
		doSendPlayerExtendedOpcode(cid, 29, getPlayerAttackSpeed(cid))
---------------------------------------HEALTH INFO
	elseif opcode == 53 then
		local values = ""..getPlayerStorageValue(cid, STAMINA_STORAGE).."/"..getPlayerStorageValue(cid, STAMINAMAX_STORAGE)..""	
		doSendPlayerExtendedOpcode(cid, 53, values)	
	  
---GetNinjaInfo/Skill----	  
	elseif opcode == 102 then
		if buffer == "0" then
		if getLevelSoul(cid, 0) then
			doPlayerSendTextMessage(cid, 27, "You dont have enough points") 
		return true
	end
		removeLevelSoul(cid, getPlayerSkill(cid, 0))
		doPlayerSetSkillLevel(cid, 0, getPlayerSkill(cid, 0)+1)
		doPlayerSendTextMessage(cid,22,"You're now better at Taijutsu. ["..getPlayerSkill(cid, 0).."]")
	elseif buffer == "1" then
	if getLevelSoul(cid, 1) then
		doPlayerSendTextMessage(cid, 27, "You dont have enough points")	
	return true
	end
		doPlayerSendTextMessage(cid,22,"You're now better at Ninjutsu. ["..getPlayerSkill(cid, 1).."]")	
		removeLevelSoul(cid, getPlayerSkill(cid, 1))
		doPlayerSetSkillLevel(cid, 1, getPlayerSkill(cid, 1)+1)
	elseif buffer == "2" then
	if getLevelSoul(cid, 2) then
		doPlayerSendTextMessage(cid, 27, "You dont have enough points") 
	return true
	end
		removeLevelSoul(cid, getPlayerSkill(cid, 2))
		doPlayerSetSkillLevel(cid, 2, getPlayerSkill(cid, 2)+1)
		doPlayerSendTextMessage(cid,22,"You're now better at Genjutsu. ["..getPlayerSkill(cid, 2).."]")
	elseif buffer == "3" then
	if getLevelSoul(cid, 3) then
		doPlayerSendTextMessage(cid, 27, "You dont have enough points") 
	return true
	end
		removeLevelSoul(cid, getPlayerSkill(cid, 3))
		doPlayerSetSkillLevel(cid, 3, getPlayerSkill(cid, 3)+1)
		doPlayerSendTextMessage(cid,22,"You're now better at meleeWeapons. ["..getPlayerSkill(cid, 3).."]")
	elseif buffer == "4" then
	if getLevelSoul(cid, 4) then
		doPlayerSendTextMessage(cid, 27, "You dont have enough points") 
	return true
	end
		removeLevelSoul(cid, getPlayerSkill(cid, 4))
		doPlayerSetSkillLevel(cid, 4, getPlayerSkill(cid, 4)+1)
		doPlayerSendTextMessage(cid,22,"You're now better at distanceWeapons. ["..getPlayerSkill(cid, 4).."]")
	elseif buffer == "5" then
	if getLevelSoul(cid, 5) then
		doPlayerSendTextMessage(cid, 27, "You dont have enough points") 
	return true
	end
		removeLevelSoul(cid, getPlayerSkill(cid, 5))
	if isInArray({1,7}, getPlayerVocation(cid)) then
		setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + 10)
	else
		setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + 5)
	end
		doPlayerSetSkillLevel(cid, 5, getPlayerSkill(cid, 5)+1)
		setPlayerStorageValue(cid, sto_getHealthPoint, getPlayerSkill(cid, 5))
		doPlayerSendTextMessage(cid,22,"You're now better at Resistence. ["..getPlayerSkill(cid, 5).."]")
	elseif buffer == "6" then
	if getLevelSoul(cid, 6) then
		doPlayerSendTextMessage(cid, 27, "You dont have enough points") 
	return true
	end
		removeLevelSoul(cid, getPlayerSkill(cid, 6))
		doPlayerSetSkillLevel(cid, 6, getPlayerSkill(cid, 6)+1)
		doSendPlayerExtendedOpcode(cid, 29, getPlayerAttackSpeed(cid))
		doPlayerSendTextMessage(cid,22,"You're now better at Agility. ["..getPlayerSkill(cid, 6).."]")
	elseif buffer == "7" then
	if getChakraSoul(cid, chakra) then
		doPlayerSendTextMessage(cid, 27, "You dont have enough points") 
	return true
	end
	if isInArray({3,6}, getPlayerVocation(cid)) then
		setCreatureMaxMana(cid, getPlayerMaxMana(cid) + 10)
	else
		setCreatureMaxMana(cid, getPlayerMaxMana(cid) + 5)
	end
	removeLevelSoul(cid, getPlayerMagLevel(cid))
	doPlayerAddMagLevel(cid, 1)
	setPlayerStorageValue(cid, sto_getChakraPoint, getPlayerStorageValue(cid, sto_getChakraPoint) + 5)
	doPlayerSendTextMessage(cid,22,"You're now better at Chakra Level. ["..getPlayerMagLevel(cid).."]")	 
end
doPlayerSave(cid)
return true
end
end

