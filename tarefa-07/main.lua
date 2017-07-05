

function new (x,y,vx)			--trabalho 07
    local me; me = {
        move = function (dx,dy)
             
	     x = x + dx
             y = y + dy
             return x, y
	     
	
        end,
        get = function ()
             return x, y
        end,
        co = coroutine.create(function (dt)
            while true do
                me.move( 0,vx*dt)
                dt = coroutine.yield()
            end
        end),
    }
    return me
end


local o1 = new(395,5, 100)		--trabalho 07
local o2 = new(395,545, -100)		--trabalho 07

function love.load ()


largura, altura, flags = love.window.getMode( )

	
--COORDENADAS DE JOGADOR 1 E JOGADOR 2
	p1 = { x1=(largura*97.5)/100, y1=(altura*33.33)/100, x2=(largura*97.5)/100, y2=(altura*41.83)/100, x3=(largura*91.25)/100, y3=(altura*37.5)/100}       
    p2 = { x1= 20, y1=300, x2=20, y2=351, x3=70, y3=325}

--TIROS DO JOGADOR 1	
	p2t1 = { x1=0, y1=0 }	
	p2t2 = { x1=0, y1=0 }
        p2t3 = { x1=0, y1=0 }
	p2t4 = { x1=0, y1=0 }
        p2t5 = { x1=0, y1=0 }
	
--TIROS DO JOGADOR 2	
	p1t1 = { x1=0, y1=0 }
	p1t2 = { x1=0, y1=0 }
        p1t3 = { x1=0, y1=0 }
	p1t4 = { x1=0, y1=0 }
        p1t5 = { x1=0, y1=0 }

--VARIÁVEIS AUXILIARES
	
	aux = {}
	aux[1] = 0
	aux[2] = 0
	
	

--CONTADOR DE PONTOS
	pontos1 = 0
	pontos2 = 0	

--SONS DO JOGO

	tiro = {}				
	
	table.insert(tiro, 1, love.audio.newSource("tiro1.ogg"))   
	table.insert(tiro, 2, love.audio.newSource("tiro2.ogg"))
	table.insert(tiro, 3, love.audio.newSource("tiro3.ogg"))
	table.insert(tiro, 4, love.audio.newSource("tiro4.ogg"))
	table.insert(tiro, 5, love.audio.newSource("tiro5.ogg"))
	table.insert(tiro, 6, love.audio.newSource("tiro6.ogg"))
	table.insert(tiro, 7, love.audio.newSource("tiro7.ogg"))
	table.insert(tiro, 8, love.audio.newSource("tiro8.ogg"))
	table.insert(tiro, 9, love.audio.newSource("tiro9.ogg"))
	table.insert(tiro, 10, love.audio.newSource("tiro10.ogg"))
	
	comeco = love.audio.newSource("start.ogg")
	batalha = love.audio.newSource("batalha.ogg")
	venceu = love.audio.newSource("venceu.ogg")
	atingiu = love.audio.newSource("atingiu.ogg")
	love.audio.play(batalha)


	ganhador = {'JOGADOR 1 VENCEU!!!', 2}   


    
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function love.keypressed(key)

if (pontos1 < 30) and (pontos2 < 30) then          -- faz com que os jogadores não consigam mais dar tiros após um deles ser declarado vencedor. Só consegui consertar esse erro na tarefa 06

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
		aux[2] = aux[2] + 1
		if aux[2] == 1 then
		love.audio.play(tiro[1])
		p2t1.x1 = p2.x3 + p2.x3%2
	        p2t1.y1 = p2.y3
		elseif aux[2] == 2 then
		love.audio.play(tiro[2])
		p2t2.x1 = p2.x3 + p2.x3%2
		p2t2.y1 = p2.y3
		elseif aux[2] == 3 then                    --p2ti É TIRO i DO JOGADOR 1 (SEM QUERER INVERTI O ÍNDICE DO JOGADOR E NÃO CONSEGUI CONSERTAR)
		love.audio.play(tiro[3])
		p2t3.x1 = p2.x3 + p2.x3%2
		p2t3.y1 = p2.y3
		elseif aux[2] == 4 then
		love.audio.play(tiro[4])
		p2t4.x1 = p2.x3 + p2.x3%2
		p2t4.y1 = p2.y3
		elseif aux[2] == 5 and p2t1.x1 > 799 then
		love.audio.play(tiro[5])
		p2t5.x1 = p2.x3 + p2.x3%2
		p2t5.y1 = p2.y3
		aux[2] = aux[2] - 5
		elseif aux[2] == 5 and p2t1.x1 < 799 then
		aux[2] = aux[2] - 1
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
		aux[1] = aux[1] + 1
		if aux[1] == 1 then
		love.audio.play(tiro[6])
		p1t1.x1 = p1.x3 + p1.x3%2
	        p1t1.y1 = p1.y3
		elseif aux[1] == 2 then
		love.audio.play(tiro[7])
		p1t2.x1 = p1.x3 + p1.x3%2 
		p1t2.y1 = p1.y3
		elseif aux[1] == 3 then
		love.audio.play(tiro[8])
		p1t3.x1 = p1.x3 + p1.x3%2                   --p1ti É TIRO i DO JOGADOR 2 (SEM QUERER INVERTI O ÍNDICE DO JOGADOR E NÃO CONSEGUI CONSERTAR)
		p1t3.y1 = p1.y3
		elseif aux[1] == 4 then
		love.audio.play(tiro[9])
		p1t4.x1 = p1.x3 + p1.x3%2
		p1t4.y1 = p1.y3
		elseif aux[1] == 5 and p1t1.x1 < 1 then
		love.audio.play(tiro[10])
		p1t5.x1 = p1.x3 + p1.x3%2
		p1t5.y1 = p1.y3
		aux[1] = aux[1] - 5
		elseif aux[1] == 5 and p1t1.x1 > 1 then
		aux[1] = aux[1] - 1
		end
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

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
function love.update (dt)

    coroutine.resume(o1.co, dt)		--trabalho 07
    coroutine.resume(o2.co, dt)		--trabalho 07

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



function pontuaP1(ponto1)              
	inc1 = 1
	pontos1 = ponto1 + inc1
	return (ponto1)


end

function pontuaP2(ponto2)   		
	inc2 = 1
	pontos2 = ponto2 + inc2
	return (ponto2)
end


--TIROS DE JOGADOR 2 QUE ACERTAM JOGADOR 1 	
if collides1(p2t1, p1) or collides1(p2t2, p1) or collides1(p2t3, p1) or collides1(p2t4, p1) or collides1(p2t5, p1) then
	love.audio.play(atingiu)
	pontuaP2(pontos2)
	
end

--TIROS DE JOGADOR 1 QUE ACERTAM JOGADOR 2 	
if collides2(p1t1, p2) or collides2(p1t2, p2) or collides2(p1t3, p2) or collides2(p1t4, p2) or collides2(p1t5, p2) then
        love.audio.play(atingiu)
	pontuaP1(pontos1)
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

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function love.draw ()


if (pontos1 >= 30) then
	love.graphics.print(ganhador[1], 300,300)     
	love.audio.stop(batalha)
	love.audio.play(venceu)
	
	pontos2 = 0
	elseif (pontos2 >= 30) then
	love.graphics.print("JOGADOR", 300,300)	       
	love.graphics.print(ganhador[2], 360,300)      
	love.graphics.print("VENCEU!!!!", 375,300)     
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
        love.graphics.rectangle('line', 5,5,(largura*98.75)/100,(altura*98.33)/100)
	
	love.graphics.setColor(255,255,255)
        love.graphics.rectangle('line', 5,5,(largura/2),(altura*98.33)/100)

	love.graphics.setColor(255,255,255)
	love.graphics.print("Pontos do Jogador 1:", 410,10)
	love.graphics.setColor(255,255,255)
	love.graphics.print(pontos1, 545,10)

	
	love.graphics.setColor(255,255,255)
	love.graphics.print("Pontos do Jogador 2:", 10,10)
	love.graphics.setColor(255,255,255)
	love.graphics.print(pontos2, 145,10)

     x,y = o1.get()    --trabalho 07
    love.graphics.rectangle('fill', x,y, 20,50)

    r,s = o2.get()		--trabalho 07
    love.graphics.rectangle('fill',r,s, 20,50)

	end



end

