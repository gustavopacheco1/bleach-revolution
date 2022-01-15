function onSay(cid, words, param)
        if not(param and isNumber(param)) then
                return doPlayerSendCancel(cid, "Digite o ID do item.")
        end

        local query, msg = db.getResult("SELECT name FROM players WHERE id IN (SELECT player_id FROM player_items WHERE itemtype = ".. param ..");"), ""

        if (query:getID() ~= -1) then
                while (true) do
                        local name = query:getDataString("name")
                        msg = msg..name.."\n"

                        if not(query:next()) then
                                break
                        end
                end
        else
                return doShowTextDialog(cid, param, "Ninguém possui esse item.")
        end

        return doShowTextDialog(cid, param, msg) and true
end