--[[
    Capture The Flag System
    Author: Maxwell Denisson(MaXwEllDeN)
    Version: 1.0
]]

function onStartup()
    setGlobalStorageValue(_CTF_LIB.CTFSto, -1)
	addEvent(CTF_createFlags, 1500)
	return true
end
