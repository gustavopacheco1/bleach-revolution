skillConfig = {skill = getConfigValue('rateSkill'), magiclevel = getConfigValue('rateMagic')}

skillStages = {
    [SKILL_FIST] = {
        {0, 10},
        {60, 6},
        {80, 1},
        {100, 0.8},
        {120, 0.5}
    },
    
    [SKILL_CLUB] = {
        {0, 10},
        {60, 6},
        {80, 1},
        {100, 0.8},
        {120, 0.5}
    },

    [SKILL_SWORD] = {
        {0, 10},
        {60, 6},
        {80, 1},
        {100, 0.8},
        {120, 0.5}
    },

    [SKILL_AXE] = {
        {0, 10},
        {60, 6},
        {80, 1},
        {100, 0.8},
        {120, 0.5}
    },

    [SKILL_DISTANCE] = {
        {0, 10},
        {60, 6},
        {80, 1},
        {100, 0.8},
        {120, 0.5}
    },

    [SKILL_SHIELD] = {
        {0, 10},
        {60, 6},
        {80, 1},
        {100, 0.8},
        {120, 0.5}
    },

    [SKILL_FISHING] = {
        {0, 10},
        {60, 6},
        {80, 1}, 
        {100, 0.8},
        {120, 0.5}
    },

    [SKILL__MAGLEVEL] = {
        {0, 5},
        {100, 3},
        {120, 1},
        {135, 0.5},
        {140, 0.1},
        {155, 0}
    }
}

-- envia uma nova mensagem com a sua nova rate
showInfoOnAdvance = false

-- envia mensagem da rate ao jogador ao logar
showInfoOnLogin = false

function getPlayerSkillRatesText(cid)
    local skillInfo = getPlayerRates(cid)
    return "Rates Info: [ Magic Level: " .. skillInfo[SKILL__MAGLEVEL] * skillConfig.magiclevel .. "x || Attack Speed: " .. skillInfo[SKILL_FIST] * skillConfig.skill .. "x | Weapon: " .. skillInfo[SKILL_CLUB] * skillConfig.skill .. "x |  Sword: " .. skillInfo[SKILL_SWORD] * skillConfig.skill .. "x | Strenght: " .. skillInfo[SKILL_AXE] * skillConfig.skill .. "x |  Ki Blasting: " .. skillInfo[SKILL_DISTANCE] * skillConfig.skill .. " | Defense: " .. skillInfo[SKILL_SHIELD] * skillConfig.skill .. "x ]"
end