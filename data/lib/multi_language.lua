MultiLanguage = {
    doPlayerSendCancel = function (cid, message_en, message_pt)
        if getPlayerStorageValue(cid, "language") == "en" then
            return doPlayerSendCancel(cid, message_en)
        end

        return doPlayerSendCancel(cid, message_pt)
    end
}
