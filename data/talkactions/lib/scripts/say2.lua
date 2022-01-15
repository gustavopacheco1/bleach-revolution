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

function onSay(cid, words, param, channel)
        if getStorage(BIOHAZARD_GLOBAL_STATUS) == 2 then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Evento Tsuki no Me ja esta em andamento.")
                return true
        end

        local t = string.explode(param, " ")

        local keyword = t[1]
        if keyword == "start" then
                local value = tonumber(t[2]) or BIOHAZARD_DEFAULT_MAX_PLAYERS
                doSetBiohazardMaxPlayers(value)
                doSetStorage(BIOHAZARD_GLOBAL_STATUS, 1)
                doBroadcastMessage("Evento Projeto Tsuki no Me iniciou. Esperando ".. getBiohazardMaxPlayers() .." shinobis.")
        elseif keyword == "close" then
                if #getBiohazardEventPlayers() > 2 then
                        doBiohazardChooseNemesis()
                        doSetStorage(BIOHAZARD_GLOBAL_STATUS, 2)
                        doBroadcastMessage("Evento escolheu aleatoriamente o jogador ".. getCreatureName(getBiohazardNemesis()) .." como TOBI.")
                else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Esperar pelo menos dois jogadores.")
                end
        else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Comando invalido.")
        end
        return true
end