skillConfig = {skill = getConfigValue('rateSkill'), magiclevel = getConfigValue('rateMagic')}
skillStages = {}
skillStages[SKILL_FIST] = {{0,10},{60,6},{80,4},{100,2},{120,1}}
skillStages[SKILL_CLUB] = {{0,10},{60,6},{80,4},{100,2},{120,1}}
skillStages[SKILL_SWORD] = {{0,10},{60,6},{80,4},{100,2},{120,1}}
skillStages[SKILL_AXE] = {{0,10},{60,6},{80,4},{100,2},{120,1}}
skillStages[SKILL_DISTANCE] = {{0,10},{60,6},{80,4},{100,2},{120,1}}
skillStages[SKILL_SHIELD] = {{0,10},{60,6},{80,4},{100,2},{120,1}}
skillStages[SKILL_FISHING] = {{0,10},{60,6},{80,4},{100,2},{120,1}} -- voce pode retirar os -- desse script para ativar, por padrao esta desativado
showInfoOnAdvance = true -- envia uma nova mensagem com a sua nova rate
showInfoOnLogin = true -- envia mensagem da rate ao jogador ao logar

function getPlayerSkillRatesText(cid)
local skillInfo = getPlayerRates(cid)
return "SKILL RATES: [Attack Speed: " .. skillInfo[SKILL_FIST] * skillConfig.skill .. "x | x: " .. skillInfo[SKILL_CLUB] * skillConfig.skill .. "x |  Espada: " .. skillInfo[SKILL_SWORD] * skillConfig.skill .. "x | Luva: " .. skillInfo[SKILL_AXE] * skillConfig.skill .. "x |  Distancia: " .. skillInfo[SKILL_DISTANCE] * skillConfig.skill .. " | Defesa: " .. skillInfo[SKILL_SHIELD] * skillConfig.skill .. "x ]"
end