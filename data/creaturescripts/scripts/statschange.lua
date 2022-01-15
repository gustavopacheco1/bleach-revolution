-- This script is part of Biohazard Event System
-- Copyright (C) 2012 XTibia, Oneshot
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

function onStatsChange(cid, attacker, type, combat, value)
        if isPlayer(cid) and isPlayer(attacker) then
                if type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS then
                        if getBiohazardPlayerStatus(cid) == 1 and (isNemesis(attacker) or getCreatureName(attacker) == "Tobi") then
                                if getCreatureHealth(cid) - value <= 0 then
                                        local zombie = doCreateMonster("Clone Tobi", getThingPosition(cid))
                                        doConvinceCreature(attacker, zombie)
                                        doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
                                        doBiohazardKickPlayer(cid)
                                        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Voce foi Selado por Tobi.")

                                        local players = getBiohazardEventPlayers()
                                        if #players == 1 then
                                                local player = players[1]
                                                doPlayerAddItem(player, 2160, 10)
                                                doPlayerSendTextMessage(player, MESSAGE_EVENT_ADVANCE, "Voce venceu o Evento e completou o Tsuki no Me.")
                                                doBroadcastMessage(getCreatureName(player) ..", o Tobi, usou seu genjutsu Tsuki no Me em todos os jogadores da Arena.")
                                                for _, summon in ipairs(getCreatureSummons(player)) do
                                                        doRemoveCreature(summon)
                                                end
                                                doBiohazardKickPlayer(player)
                                                doSetStorage(BIOHAZARD_GLOBAL_STATUS, 0)
                                                doSetStorage(BIOHAZARD_GLOBAL_MAX_PLAYERS, BIOHAZARD_DEFAULT_MAX_PLAYERS)
                                        end
                                        return false
                                end
                        elseif isNemesis(cid) and getBiohazardPlayerStatus(attacker) == 1 then
                                doCreatureSetStorage(cid, BIOHAZARD_PLAYER_NEMESIS_HEALTH, getCreatureStorage(cid, BIOHAZARD_PLAYER_NEMESIS_HEALTH) - value)
                                doCreatureSay(cid, getCreatureStorage(cid, BIOHAZARD_PLAYER_NEMESIS_HEALTH), TALKTYPE_ORANGE_1)
                                if getCreatureStorage(cid, BIOHAZARD_PLAYER_NEMESIS_HEALTH) - value <= 0 then
                                        local players = getBiohazardEventPlayers()
                                        for _, player in ipairs(players) do
                                                if getBiohazardPlayerStatus(player) == 1 then
                                                        doPlayerAddItem(player, 2160, 10)
                                                        doPlayerSendTextMessage(player, MESSAGE_EVENT_DEFAULT, "Voce conseguiu parar o Tsuki no Me e venceu o Evento.")
                                                end
doBiohazardKickPlayer(player)
                                        end
doBroadcastMessage("Os Shinobis vencerao o TOBI e ganharao o Evento.")
                                        doSetStorage(BIOHAZARD_GLOBAL_STATUS, 0)
                                        doSetStorage(BIOHAZARD_GLOBAL_MAX_PLAYERS, BIOHAZARD_DEFAULT_MAX_PLAYERS)
                                end
                                return false
                        elseif getBiohazardPlayerStatus(cid) == 1 and getBiohazardPlayerStatus(attacker) == 1 then
                                return false
                        end
                end
        end
        return true
end