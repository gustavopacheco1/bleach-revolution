function onLogin(cid)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[ AVISO Nunca digite sua senha em site que n�o seja o oficial ( EM BREVE ), Verifique antes o site, n�o seja HACKIADO.". 
]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end