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
	end
}
