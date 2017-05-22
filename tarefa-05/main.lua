function love.load ()
    

	
--COORDENADAS DE JOGADOR 1 E JOGADOR 2
	p1 = { x1=780, y1=200, x2=780, y2=251, x3=730, y3=225}         --binding ocorre em tempo de execução
    p2 = { x1= 20, y1=300, x2=20, y2=351, x3=70, y3=325}	       --binding ocorre em tempo de execução

--TIROS DO JOGADOR 1	
	p2t1 = { x1=0, y1=0 }					--binding ocorre em tempo de execução
	p2t2 = { x1=0, y1=0 }					--binding ocorre em tempo de execução
    p2t3 = { x1=0, y1=0 }					--binding ocorre em tempo de execução
	p2t4 = { x1=0, y1=0 }					--binding ocorre em tempo de execução
    p2t5 = { x1=0, y1=0 }					--binding ocorre em tempo de execução
	
--TIROS DO JOGADOR 2	
	p1t1 = { x1=0, y1=0 }					--binding ocorre em tempo de execução
	p1t2 = { x1=0, y1=0 }					--binding ocorre em tempo de execução
    p1t3 = { x1=0, y1=0 }					--binding ocorre em tempo de execução
	p1t4 = { x1=0, y1=0 }					--binding ocorre em tempo de execução
    p1t5 = { x1=0, y1=0 }					--binding ocorre em tempo de execução

--VARIÁVEIS AUXILIARES
	i = 0							--binding ocorre em tempo de execução
    j = 0							--binding ocorre em tempo de execução
	

--CONTADOR DE PONTOS	
	pontos1 = 0						--binding ocorre em tempo de execução
	pontos2 = 0						--binding ocorre em tempo de execução
	
--SONS DO JOGO	
	tiro1 = love.audio.newSource("tiro1.ogg")		--binding ocorre em tempo de execução
	tiro2 = love.audio.newSource("tiro2.ogg")		--binding ocorre em tempo de execução
	tiro3 = love.audio.newSource("tiro3.ogg")		--binding ocorre em tempo de execução
	tiro4 = love.audio.newSource("tiro4.ogg")		--binding ocorre em tempo de execução
	tiro5 = love.audio.newSource("tiro5.ogg")		--binding ocorre em tempo de execução
	tiro6 = love.audio.newSource("tiro6.ogg")		--binding ocorre em tempo de execução
	tiro7 = love.audio.newSource("tiro7.ogg")		--binding ocorre em tempo de execução
	tiro8 = love.audio.newSource("tiro8.ogg")		--binding ocorre em tempo de execução
	tiro9 = love.audio.newSource("tiro9.ogg")		--binding ocorre em tempo de execução
	tiro10 = love.audio.newSource("tiro10.ogg")		--binding ocorre em tempo de execução
	comeco = love.audio.newSource("start.ogg")		--binding ocorre em tempo de execução
	batalha = love.audio.newSource("batalha.ogg")	--binding ocorre em tempo de execução
	venceu = love.audio.newSource("venceu.ogg")		--binding ocorre em tempo de execução
	atingiu = love.audio.newSource("atingiu.ogg")	--binding ocorre em tempo de execução
	love.audio.play(batalha)
 
    
end


function love.keypressed(key)



-- MOVIMENTOS DO JOGADOR 1	
	if key == 'left' and p1.x1 > 470 then
        p1.x1 = p1.x1 - 10				
		p1.x2 = p1.x2 - 10				
		p1.x3 = p1.x3 - 10				
	elseif key == 'right' and p1.x1 < 780 then
        p1.x1 = p1.x1 + 10				
		p1.x2 = p1.x2 + 10				
		p1.x3 = p1.x3 + 10				
	elseif key == 'up' and p1.y1 > 40 then
        p1.y1 = p1.y1 - 10			
		p1.y2 = p1.y2 - 10				
		p1.y3 = p1.y3 - 10				
        elseif key == 'down' and p1.y1 < 540 then
        p1.y1 = p1.y1 + 10				
		p1.y2 = p1.y2 + 10				
		p1.y3 = p1.y3 + 10				
	elseif key == 'v' then
		j = j + 1      					
		if j == 1 then
		love.audio.play(tiro1)
		p2t1.x1 = p2.x3 + p2.x3%2
	        p2t1.y1 = p2.y3
		elseif j == 2 then
		love.audio.play(tiro2)
		p2t2.x1 = p2.x3 + p2.x3%2
		p2t2.y1 = p2.y3
		elseif j == 3 then                    --p2ti É TIRO i DO JOGADOR 1 (SEM QUERER INVERTI O ÍNDICE DO JOGADOR E NÃO CONSEGUI CONSERTAR)
		love.audio.play(tiro3)
		p2t3.x1 = p2.x3 + p2.x3%2
		p2t3.y1 = p2.y3
		elseif j == 4 then
		love.audio.play(tiro4)
		p2t4.x1 = p2.x3 + p2.x3%2
		p2t4.y1 = p2.y3
		elseif j == 5 and p2t1.x1 > 799 then
		love.audio.play(tiro5)
		p2t5.x1 = p2.x3 + p2.x3%2
		p2t5.y1 = p2.y3
		j = j - 5
		elseif j == 5 and p2t1.x1 < 799 then
		j = j - 1
		end
    end


	

--MOVIMENTOS DO JOGADOR 2
    if key == 'a' and p2.x1 > 10 then
                p2.x1 = p2.x1 - 10
		p2.x2 = p2.x2 - 10
		p2.x3 = p2.x3 - 10
        elseif key == 'd' and p2.x1 < 350 then
                p2.x1 = p2.x1 + 10
		p2.x2 = p2.x2 + 10
		p2.x3 = p2.x3 + 10
	elseif key == 'w' and p2.y1 > 40 then
                p2.y1 = p2.y1 - 10
		p2.y2 = p2.y2 - 10
		p2.y3 = p2.y3 - 10 
        elseif key == 's' and p2.y1 < 540 then
                p2.y1 = p2.y1 + 10
	  	p2.y2 = p2.y2 + 10
		p2.y3 = p2.y3 + 10
	elseif key == 'm' then
		i = i + 1
		if i == 1 then
		love.audio.play(tiro6)
		p1t1.x1 = p1.x3 + p1.x3%2
	        p1t1.y1 = p1.y3
		elseif i == 2 then
		love.audio.play(tiro7)
		p1t2.x1 = p1.x3 + p1.x3%2 
		p1t2.y1 = p1.y3
		elseif i == 3 then
		love.audio.play(tiro8)
		p1t3.x1 = p1.x3 + p1.x3%2                   --p1ti É TIRO i DO JOGADOR 2 (SEM QUERER INVERTI O ÍNDICE DO JOGADOR E NÃO CONSEGUI CONSERTAR)
		p1t3.y1 = p1.y3
		elseif i == 4 then
		love.audio.play(tiro9)
		p1t4.x1 = p1.x3 + p1.x3%2
		p1t4.y1 = p1.y3
		elseif i == 5 and p1t1.x1 < 1 then
		love.audio.play(tiro10)
		p1t5.x1 = p1.x3 + p1.x3%2
		p1t5.y1 = p1.y3
		i = i - 5
		elseif i == 5 and p1t1.x1 > 1 then
		i = i - 1
		end
	end

--OBS: CADA JOGADOR SÓ PODE DAR 5 TIROS POR VEZ (O SEXTO TIRO SÓ É DISPARADO APÓS O PRIMEIRO SUMIR DA TELA)
	end

-- AS COLISÕES SÃO OS TIROS QUE ACERTAM O ADVERSÁRIO
function collides1(tiro2, jog1)
    return (tiro2.x1 == jog1.x3) and (tiro2.y1 > jog1.y1) and (tiro2.y1 < jog1.y2)
end

function collides2(tiro1, jog2)
    return (tiro1.x1 == jog2.x3) and (tiro1.y1 > jog2.y1) and (tiro1.y1 < jog2.y2)
	
end	


	
function love.update (dt)

--MOVIMENTO DE PROPAGAÇÃO DOS TIROS
p1t1.x1 = p1t1.x1 - 2
p1t2.x1 = p1t2.x1 - 2
p1t3.x1 = p1t3.x1 - 2
p1t4.x1 = p1t4.x1 - 2
p1t5.x1 = p1t5.x1 - 2

p2t1.x1 = p2t1.x1 + 2
p2t2.x1 = p2t2.x1 + 2
p2t3.x1 = p2t3.x1 + 2
p2t4.x1 = p2t4.x1 + 2
p2t5.x1 = p2t5.x1 + 2



--TIROS DE JOGADOR 2 QUE ACERTAM JOGADOR 1 	
if collides1(p2t1, p1) or collides1(p2t2, p1) or collides1(p2t3, p1) or collides1(p2t4, p1) or collides1(p2t5, p1) then
	love.audio.play(atingiu)
	pontos2 = pontos2 + 1
	
end

--TIROS DE JOGADOR 1 QUE ACERTAM JOGADOR 2 	
if collides2(p1t1, p2) or collides2(p1t2, p2) or collides2(p1t3, p2) or collides2(p1t4, p2) or collides2(p1t5, p2) then
        love.audio.play(atingiu)
	pontos1 = pontos1 + 1
end

--APÓS ATINGIR O JOGADOR 1, O TIRO SOME DA TELA

if (p2t1.x1 == p1.x3+48) and (p2t1.y1 > p1.y1) and (p2t1.y1 < p1.y2) then
	p2t1.x1 = p2t1.x1 + 800
elseif (p2t2.x1 == p1.x3+48) and (p2t2.y1 > p1.y1) and (p2t2.y1 < p1.y2) then
	p2t2.x1 = p2t2.x1 + 800
elseif (p2t3.x1 == p1.x3+48) and (p2t3.y1 > p1.y1) and (p2t3.y1 < p1.y2) then
	p2t3.x1 = p2t3.x1 + 800
elseif (p2t4.x1 == p1.x3+48) and (p2t4.y1 > p1.y1) and (p2t4.y1 < p1.y2) then
	p2t4.x1 = p2t4.x1 + 800
elseif (p2t5.x1 == p1.x3+48) and (p2t5.y1 > p1.y1) and (p2t5.y1 < p1.y2) then
	p2t5.x1 = p2t5.x1 + 800
end



--APÓS ATINGIR O JOGADOR 2, O TIRO SOME DA TELA

if (p1t1.x1 == p2.x3-48) and (p1t1.y1 > p2.y1) and (p1t1.y1 < p2.y2) then
	p1t1.x1 = p1t1.x1 - 800
elseif (p1t2.x1 == p2.x3-48) and (p1t2.y1 > p2.y1) and (p1t2.y1 < p2.y2) then
	p1t2.x1 = p1t2.x1 - 800
elseif (p1t3.x1 == p2.x3-48) and (p1t3.y1 > p2.y1) and (p1t3.y1 < p2.y2) then
	p1t3.x1 = p1t3.x1 - 800
elseif (p1t4.x1 == p2.x3-48) and (p1t4.y1 > p2.y1) and (p1t4.y1 < p2.y2) then
	p1t4.x1 = p1t4.x1 - 800
elseif (p1t5.x1 == p2.x3-48) and (p1t5.y1 > p2.y1) and (p1t5.y1 < p2.y2) then
	p1t5.x1 = p1t5.x1 - 800
end

end



function love.draw ()

if (pontos1 >= 30) then
	love.graphics.print("JOGADOR 1 VENCEU!!!", 300,300)
	love.audio.stop(batalha)
	love.audio.play(venceu)
	pontos2 = 0
	elseif (pontos2 >= 30) then
	love.graphics.print("JOGADOR 2 VENCEU!!!", 300,300)
	love.audio.stop(batalha)
	love.audio.play(venceu)
	pontos1 = 0

	else
    
--TIROS DO JOGADOR 1	
	love.graphics.setColor(255,255,0)
	love.graphics.circle( 'fill', p1t1.x1, p1t1.y1, 2 )
	love.graphics.setColor(255,255,0)
	love.graphics.circle( 'fill', p1t2.x1, p1t2.y1, 2 )
	love.graphics.setColor(255,255,0)
	love.graphics.circle( 'fill', p1t3.x1, p1t3.y1, 2 )
	love.graphics.setColor(255,255,0)
	love.graphics.circle( 'fill', p1t4.x1, p1t4.y1, 2 )
        love.graphics.setColor(255,255,0)
	love.graphics.circle( 'fill', p1t5.x1, p1t5.y1, 2 )
	
--TIROS DO JOGADOR 2	
	love.graphics.setColor(255,255,0)
	love.graphics.circle( 'fill', p2t1.x1, p2t1.y1, 2 )
	love.graphics.setColor(255,255,0)
	love.graphics.circle( 'fill', p2t2.x1, p2t2.y1, 2 )
	love.graphics.setColor(255,255,0)
	love.graphics.circle( 'fill', p2t3.x1, p2t3.y1, 2 )
	love.graphics.setColor(255,255,0)
	love.graphics.circle( 'fill', p2t4.x1, p2t4.y1, 2 )
    love.graphics.setColor(255,255,0)
	love.graphics.circle( 'fill', p2t5.x1, p2t5.y1, 2 )

--JOGADOR 1	
    love.graphics.setColor(0,0,255)
    love.graphics.polygon( 'fill', p1.x1,p1.y1,p1.x2,p1.y2,p1.x3,p1.y3)

--JOGADOR 2
	love.graphics.setColor(255,0,0)
    love.graphics.polygon( 'fill', p2.x1,p2.y1,p2.x2,p2.y2,p2.x3,p2.y3)
	
	love.graphics.setColor(255,255,255)
    love.graphics.rectangle('line', 5,5,790,590)
	
	love.graphics.setColor(255,255,255)
    love.graphics.rectangle('line', 5,5,400,590)

	love.graphics.setColor(255,255,255)
	love.graphics.print("Pontos do Jogador 1:", 410,10)
	love.graphics.setColor(255,255,255)
	love.graphics.print(pontos1, 545,10)

	
	love.graphics.setColor(255,255,255)
	love.graphics.print("Pontos do Jogador 2:", 10,10)
	love.graphics.setColor(255,255,255)
	love.graphics.print(pontos2, 145,10)
	end
end
