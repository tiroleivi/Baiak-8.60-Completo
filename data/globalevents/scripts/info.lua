function onThink(interval, lastExecution)
  -- Configura��es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Voce Esta jogando no Baiak Yurots Editado ~ By Vitinho!! 

     Muitas novidades e muitos bugs removidos!
  
    Adquira ja seus addons no Varkhall!! 

Tenha um bom jogo]]
}

  -- Fim de Configura��es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end