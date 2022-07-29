MultiLanguage = {
	doPlayerSendCancel = function(cid, message_en, message_pt)
		if getPlayerStorageValue(cid, "language") == "en" then
			return doPlayerSendCancel(cid, message_en)
		end

		return doPlayerSendCancel(cid, message_pt)
	end,

	doPlayerSendTextMessage = function(cid, MessageClass, message_en, message_pt)
		if getPlayerStorageValue(cid, "language") == "en" then
			return doPlayerSendTextMessage(cid, MessageClass, message_en)
		end

		return doPlayerSendTextMessage(cid, MessageClass, message_pt)
	end,

	doCreatureSay = function(uid, cid, text_en, text_pt)
        if getPlayerStorageValue(cid, "language") == "en" then
            return doCreatureSay(uid, text_en)
        end

        return doCreatureSay(uid, text_pt)
    end,

	doPlayerPopupFYI = function(cid, message_en, message_pt)
		if getPlayerStorageValue(cid, "language") == "en" then
			return doPlayerPopupFYI(cid, message_en)
		end

		return doPlayerPopupFYI(cid, message_pt)
	end
}
