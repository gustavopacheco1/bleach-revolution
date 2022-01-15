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

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
        if not isPlayer(cid) then
                return true
        end

        if getStorage(BIOHAZARD_GLOBAL_STATUS) == 1 and #getBiohazardEventPlayers() < getBiohazardMaxPlayers() then
                doBiohazardAddPlayer(cid)
                local players = #getBiohazardEventPlayers()
                if players == getBiohazardMaxPlayers() then
                        doBiohazardChooseNemesis()
                        doSetStorage(BIOHAZARD_GLOBAL_STATUS, 2)
                        doBroadcastMessage("Evento escolheu aleatoriamente o jogador ".. getCreatureName(getBiohazardNemesis()) .." para assumir o papel de TOBI.")
                else
                        doBroadcastMessage(getCreatureName(cid) .." entrou no Evento. Falta ".. getBiohazardMaxPlayers() - players .." shinobis para iniciar o evento.")
                end
        else
                doTeleportThing(cid, fromPosition, true)
                doPlayerSendCancel(cid, "Desculpe, o evento Tsuki no Me nao esta ativado.")
        end
        return true
end