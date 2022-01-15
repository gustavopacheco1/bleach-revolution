function onLogin(cid)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[ AVISO Nunca digite sua senha em site que não seja o oficial ( EM BREVE ), Verifique antes o site, não seja HACKIADO.". 
]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end