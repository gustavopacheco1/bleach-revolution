-- S� pode absorver o especial de players que t�m n�vel para usar o pr�prio especial
-- Absorver o especial de n�vel maior

local spell = {
	cooldown = 10 -- Minutos
}

local function getPlayerBestSpecialLevel(target)
	local last_special_level = 0

	if SPECIALS[getPlayerVocationName(target)] then
		for _, level in ipairs({ 100, 150 }) do
			if getPlayerLevel(target) >= level and
				getPlayerLearnedInstantSpell(target, SPECIALS[getPlayerVocationName(target)[level]]) then
				last_special_level = level
			end
		end
	end

	return last_special_level
end

function onCastSpell(cid, var)
	if exhaustion.check(cid, "absorb_special_cooldown") then
		doPlayerSendCancel(cid, "Cooldown " .. format_seconds(exhaustion.get(cid, "absorb_special_cooldown")))
		return false
	end

	local target = getCreatureTarget(cid)

	if not (isPlayer(target)) then
		MultiLanguage.doPlayerSendCancel(
			cid,
			"You may only use this technique in players.",
			"Voc� s� pode utilizar esta t�cnica em players."
		)
		return false
	end

	local best_special_level = getPlayerBestSpecialLevel(target)
	local target_vocation_name = getPlayerVocationName(target)

	-- it will be 0 when target has level < 400 or target doesn't have special technique
	if best_special_level == 0 then
		MultiLanguage.doPlayerSendCancel(
			cid,
			"You may not absorb the special technique of your current target.",
			"Voc� n�o pode absorver a t�cnica especial do seu alvo atual."
		)
		return false
	end

	doPlayerLearnInstantSpell(cid, SPECIALS[target_vocation_name][best_special_level])

	exhaustion.set(cid, "absorb_special_cooldown", spell.cooldown * 60)
	return true
end
