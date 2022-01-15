local config = 
 {
     segundos = 3,
     lerIP = "yes"
 }
 config.lerIP = getBooleanFromString(config.lerIP)
 local m_lastLogin, m_lastIP = 0, 0
 function onLogout(cid)
 doPlayerSendTextMessage(cid, 20, "Por favor espere 3 segundos para deslogar sua conta.")
     local timeNow, playerIP = os.time(), getPlayerIp(cid)
         if(m_lastLogin + config.segundos >= timeNow and
             (config.lerIP == FALSE or m_lastIP == playerIP)) then
             return false
         end
     m_lastIP = playerIP
     m_lastLogin = timeNow
     return true
 end