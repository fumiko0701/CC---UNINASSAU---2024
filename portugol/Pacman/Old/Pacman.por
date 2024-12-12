programa
{
	inclua biblioteca Graficos --> gr
	inclua biblioteca Teclado --> te
	inclua biblioteca Util --> ut
	inclua biblioteca Tipos --> ti
	inteiro LARGURA = 600, ALTURA = 600 //tela


	//menu init
	inteiro start = 0

     //player atributes
	real x = 282.0, y = 320.0 //quadrado
	real speed = 0.045
	inteiro size = 36 //36

	//CENARIO PAREDES
	inteiro lado = 20
	//inteiro ladoHorizontal = 20

	//POSICOES
	inteiro CORA = gr.criar_cor(21, 10, 173)

     //PLAYER INSTANCES
	inteiro playerL = 0
	inteiro playerR = 0
	inteiro playerU = 0
	inteiro playerD = 0
	inteiro player = 0

     			//HITBOX
     			//onde ele está indo
     			cadeia side = "esquerda"

     			//input é para onde ele quer ir
     			cadeia input = ""
     			inteiro bypass = 1
     			inteiro mapa = 0
	
	funcao inicio()
	{
		construir_tela()
	}//fecha inicio()
	funcao construir_tela(){
		gr.iniciar_modo_grafico(verdadeiro)
		inteiro LARGURA = gr.largura_janela()/2.3 + gr.largura_janela()/2
		inteiro ALTURA = gr.altura_janela() + gr.altura_janela()/4
		
		gr.definir_dimensoes_janela(LARGURA, ALTURA)
		gr.definir_titulo_janela("Ciências da Computação | Console")

		mapa = gr.carregar_imagem("C:\\Users\\Marcos Emanuel\\Downloads\\pacmanMAP.png")
		player = gr.carregar_imagem("C:\\Users\\Marcos Emanuel\\Downloads\\Original_PacMan_esquerda.png")
		playerL = gr.carregar_imagem("C:\\Users\\Marcos Emanuel\\Downloads\\Original_PacMan_esquerda.png")
		playerR = gr.carregar_imagem("C:\\Users\\Marcos Emanuel\\Downloads\\Original_PacMan_direita.png")
		playerU = gr.carregar_imagem("C:\\Users\\Marcos Emanuel\\Downloads\\Original_PacMan_cima.png")
		playerD = gr.carregar_imagem("C:\\Users\\Marcos Emanuel\\Downloads\\Original_PacMan_baixo.png")
		mapa = gr.redimensionar_imagem(mapa, LARGURA, ALTURA, verdadeiro)
		player = gr.redimensionar_imagem(player, size, size, verdadeiro)
		playerL = gr.redimensionar_imagem(playerL, size, size, verdadeiro)
		playerR = gr.redimensionar_imagem(playerR, size, size, verdadeiro)
		playerU = gr.redimensionar_imagem(playerU, size, size, verdadeiro)
		playerD = gr.redimensionar_imagem(playerD, size, size, verdadeiro)
		enquanto(verdadeiro){//mantem a tela ligada e limpa ela (atualiza para branco)
			run() //roda o programa
			
		}
	}//fecha construir_tela()





	
	funcao run(){
		gr.definir_tamanho_texto(30.0)
		se(start==0) {//SE NÃO INICIOU FAÇA:
			gr.definir_cor(gr.COR_PRETO)//cor menu inicio
			gr.limpar()//limpa para setar a cor
			gr.definir_cor(CORA)
			gr.desenhar_retangulo(LARGURA/2-(lado*7), ALTURA/2+lado*2, lado*14, lado*3, falso, verdadeiro)
			gr.definir_cor(gr.COR_PRETO)
			gr.desenhar_retangulo(LARGURA/2-(lado*6+lado/2), ALTURA/2+lado*2+lado/4, lado*13, lado*2+lado/2, falso, verdadeiro)
			gr.definir_cor(gr.COR_AMARELO)
			gr.desenhar_texto(LARGURA/2-(lado*5-lado/3), (ALTURA/2)+lado*3, "PRESS ENTER")
			gr.definir_tamanho_texto(20.5)
			gr.desenhar_imagem(LARGURA/4, ALTURA/4, playerR)
			gr.definir_cor(gr.COR_BRANCO)
			gr.desenhar_texto(LARGURA/4+lado*2+lado/2, ALTURA/3-lado*2, "PACMAN em PORTUGOL!")
			gr.desenhar_texto(LARGURA-(lado*14), ALTURA-lado*2, "Por: Marcos E. @marc0s_ec")
			

		
			gr.renderizar()//renderiza tudo
		}
		se(te.tecla_pressionada(te.TECLA_ENTER) e start == 0){//aperte ENTER para começar
			start=1	//jogo iniciado
		}//fecha se (enter para iniciar o jogo)
		
		se(start==1){ //""""""""""""""""""""""""""JOGO INICIADO
			limpe() //reseta
			//criaTerreno() //cria as bordas
			desenharMapa()
			checkin() //atualiza o sentido da velocidade //TALVEZ COLOCAR ELA DENTRO DA HITBOX
			hitbox()//DESENHA CAIXA DE COLISÃO
			drawCUBE() //desenha o player
			gr.renderizar() //desenha toda a cena
		}
		
	}//fecha run()--------------------------------------------------------------------





	
	funcao limpe(){
		gr.definir_cor(gr.COR_PRETO)
		gr.limpar()
	}//fecha limpar_Tela()
	
	funcao desenharMapa(){
		gr.desenhar_imagem(0, 0, mapa)
	}
	
	funcao criaTerreno() //old
	
	{
		gr.definir_cor(gr.COR_AZUL)

		//TENTANDO NOVA COLISÃO (21/03/2024)

	

		
		
		//cria areas de colisão, TESTE
		//TENTEI CRIAR AREA DE COLISÃO PARA PAREDE ESPECIFICA ====//gr.desenhar_retangulo(wallxl, wallyl, lado*2, lado*2, falso, verdadeiro)
			
		/*DESENHA QUADRADO ESQUERDO DE BAIXO*/gr.desenhar_retangulo(lado, (ALTURA/2)+lado, lado*4+(lado/2), lado*2, falso, verdadeiro)
		/*DESENHA QUADRADO ESQUERDO DE CIMA*/gr.desenhar_retangulo(lado, (ALTURA/2)-(lado*3), lado*4+(lado/2), lado*2, falso, verdadeiro)
	     
	     /*DESENHA QUADRADO DIREITO DE BAIXO*/gr.desenhar_retangulo(LARGURA-(lado*5)-lado/2, (ALTURA/2)+lado, lado*4+(lado/2), lado*2, falso, verdadeiro)
		/*DESENHA QUADRADO DIREITO DE CIMA*/gr.desenhar_retangulo(LARGURA-(lado*5)-lado/2, (ALTURA/2)-(lado*3), lado*4+(lado/2), lado*2, falso, verdadeiro)



		///////////////////////////////////////////////////////////////////////////////////////////////
		//gr.desenhar_retangulo(x, y, largura, altura, arredondar_cantos, preencher)
			gr.desenhar_retangulo(0, 0, lado, (ALTURA/2)-lado, falso, verdadeiro)
			gr.desenhar_retangulo(0, (ALTURA/2)+lado, lado, (ALTURA/2)-(lado*2), falso, verdadeiro)
		
		gr.desenhar_retangulo(LARGURA-lado, 0, lado, (ALTURA/2)-lado, falso, verdadeiro)
		gr.desenhar_retangulo(LARGURA-lado, (ALTURA/2)+lado, lado, (ALTURA/2)-(lado*2), falso, verdadeiro)

		
		//partes de cima e baixo
			gr.desenhar_retangulo(0, 0, LARGURA, lado, falso, verdadeiro)
			gr.desenhar_retangulo(0, ALTURA-lado, LARGURA, lado, falso, verdadeiro)
          /////////////////////////////////////////////////////////////////////////////////////////////





			
	}//fecha criaTerreno()
     
     
     funcao drawCUBE(){
     	//gr.definir_cor(gr.COR_VERMELHO) //cor do quadrado
     	//gr.desenhar_retangulo(x, y, 30, 30, falso, verdadeiro) //desenha o quadrado (pode ser uma imagem)
     	gr.desenhar_imagem(x, y, player) //imagem
     	
     }//fecha drawCUBE()
     
     funcao updateSpeed() //ATUALIZA O SENTIDO DA VELOCIDADE
     {
     		se(side=="cima"){y = y - speed}
     		se(side=="baixo"){y = y + speed}
     		se(side=="esquerda"){x = x - speed}
     		se(side=="direita"){x = x + speed}
     	
     }//fecha updateSpeed()
     
     funcao checkin(){
          //MOVIMENTAÇÃO E VELOCIDADE
     	se(te.tecla_pressionada(te.TECLA_SETA_ACIMA) ou te.tecla_pressionada(te.TECLA_W)){ //CIMA
     		//player = playerU
     		input = "cima"
     		se(side == "baixo" e input == "cima"){
     			side = "cima"
     			player = playerU
     		}
     	}//fecha SE - cima
     	se(te.tecla_pressionada(te.TECLA_SETA_ABAIXO) ou te.tecla_pressionada(te.TECLA_S)){ //BAIXO
     		//player = playerD
     		input = "baixo"
     		se(side == "cima" e input == "baixo"){
     			side = "baixo"
     			player = playerD
     		}
     	}//fecha SE - baixo
     	se(te.tecla_pressionada(te.TECLA_SETA_ESQUERDA) ou te.tecla_pressionada(te.TECLA_A)){ //ESQUERDA
     
     		input = "esquerda"
     		se(side == "direita" e input == "esquerda"){
     			side = "esquerda"
     			player = playerL
     		}
     	}//fecha SE - esquerda
     	se(te.tecla_pressionada(te.TECLA_SETA_DIREITA) ou te.tecla_pressionada(te.TECLA_D)){ //DIREITA
     		input = "direita"
     		se(side == "esquerda" e input == "direita"){
     			side = "direita"
     			player = playerR
     		}
     	}//fecha SE - direita
     	
     	updateSpeed() //APOS TER ALTERADO O VALOR DA FACE, ATUALIZA O SENTIDO DA VELOCIDADE
     	
     }//fecha checkin()
     
     funcao hitbox(){
		//TENTA COLISÃO NESSE CAMPO ()
		//X 180, 320
     		se(bypass == 1){//COORDENADAS E PONTOS DO JOGADOR
     		gr.definir_cor(gr.COR_VERMELHO)
     		gr.definir_tamanho_texto(20.0)
     		gr.desenhar_texto(lado*12, lado, "Side: " + side + " Input: " + input)
     		gr.desenhar_texto(lado, lado*2+lado/2, "X: " + ti.inteiro_para_cadeia(ti.real_para_inteiro(x),10) + " Y: " + ti.inteiro_para_cadeia(ti.real_para_inteiro(y),10))
     		gr.desenhar_retangulo(x, y, 2, 2, falso, verdadeiro)
     		gr.definir_cor(gr.COR_VERDE)
     		gr.desenhar_texto(lado, lado, "RX: " + ti.inteiro_para_cadeia(ti.real_para_inteiro(x+size),10) + " DY: " + ti.inteiro_para_cadeia(ti.real_para_inteiro(y+size),10))
     		gr.desenhar_retangulo(x+size, y+size, 2, 2, falso, verdadeiro)
     		}

			se(1==1){//COORDENADAS E PONTOS DO MAPA

				se(bypass == 1){
				gr.desenhar_retangulo(LARGURA/4+(size-1), ALTURA/2+((size/2)+3), size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/4+(size-1), ALTURA/2+((size/2)+3), "1")
				gr.definir_cor(gr.COR_VERDE)
				}
				se(ti.real_para_inteiro(x)-1 == LARGURA/4+(size-1) e ti.real_para_inteiro(y)+1 == ALTURA/2+((size/2)+3)){ //INTERACAO (X) BLOCO 1
					se(input == "esquerda"){side = side}
					se(input == "direita"){side = "direita"}
					se(input == "cima"){side = "cima"}
					se(input == "baixo"){side = "baixo"}
					se(side == "esquerda"){side = ""}
					se(side == ""){
						se(input!="esquerda"){side = input}
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

				se(bypass == 1){
				gr.desenhar_retangulo(LARGURA/4+(size-1), ALTURA/2-size-2, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/4+(size-1), ALTURA/2-size-2, "1+")
				gr.definir_cor(gr.COR_VERDE)
				}
				se(ti.real_para_inteiro(x)-1 == LARGURA/4+(size-1) e ti.real_para_inteiro(y)+1 == ALTURA/2-size-2){ //INTERACAO (X) BLOCO 1+
					se(input == "esquerda"){side = "esquerda"}
					se(input == "direita"){side = side}
					se(input == "cima"){side = "cima"}
					se(input == "baixo"){side = "baixo"}
					se(side == "direita"){side = ""}
					se(side == ""){
						se(input!="direita"){side = input}
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

				
				se(bypass == 1){
				gr.desenhar_retangulo(LARGURA/4+(size-1), ALTURA/3+4, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/4+(size-1), ALTURA/3+4, "1^")
				gr.definir_cor(gr.COR_VERDE)
				}
				se(ti.real_para_inteiro(x)-1 == LARGURA/4+(size-1) e ti.real_para_inteiro(y)+1 == ALTURA/3+4){ //INTERACAO (X) BLOCO 1^
					se(input == "esquerda"){side = side}
					se(input == "direita"){side = "direita"}
					se(input == "cima"){side = side}
					se(input == "baixo"){side = "baixo"}
					se(side == "cima"){side = ""}
					se(side == "esquerda"){side = ""}
					se(side == ""){
						se(input!="cima" e input!="esquerda"){side = input}
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

			
				se(bypass == 1){
				gr.desenhar_retangulo(LARGURA/4+size*2+27, ALTURA/3+4, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/4+size*2+27, ALTURA/3+4, "1^D")
				gr.definir_cor(gr.COR_VERDE)
				}
				se(ti.real_para_inteiro(x)-1 == LARGURA/4+size*2+27 e ti.real_para_inteiro(y)+1 == ALTURA/3+4){ //INTERACAO (X) BLOCO 1^D
					se(input == "esquerda"){side = "esquerda"}
					se(input == "direita"){side = "direita"}
					se(input == "cima"){side = "cima"}
					se(input == "baixo"){side = side}
					se(side == "baixo"){side = ""}
					se(side == ""){
						se(input!="baixo"){side = input}
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

				se(bypass == 1){
				gr.desenhar_retangulo(LARGURA/4+(size-1), ALTURA/4-4, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/4+(size-1), ALTURA/4-4, "1^2")
				gr.definir_cor(gr.COR_VERDE)
				}	
				se(ti.real_para_inteiro(x)-1 == LARGURA/4+(size-1) e ti.real_para_inteiro(y)+1 == ALTURA/4-4){ //INTERACAO (X) BLOCO 1
					se(input == "esquerda"){side = side}
					se(input == "direita"){side = "direita"}
					se(input == "cima"){side = "cima"}
					se(input == "baixo"){side = side}
					se(side == "baixo"){side = ""}
					se(side == "esquerda"){side = ""}
					se(side == ""){
						se(input!="baixo" e input!="esquerda"){side = input}
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

				se(bypass == 1){
				gr.desenhar_retangulo(LARGURA/4+size*2+27, ALTURA/4-4, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/4+size*2+27, ALTURA/4-4, "1^^")
				gr.definir_cor(gr.COR_VERDE)
				}
				se(ti.real_para_inteiro(x)-1 == LARGURA/4+size*2+27 e ti.real_para_inteiro(y)+1 == ALTURA/4-4){ //INTERACAO (X) BLOCO 1
					se(input == "esquerda"){side = "esquerda"}
					se(input == "direita"){side = side}
					se(input == "cima"){side = side}
					se(input == "baixo"){side = "baixo"}
					se(side == "cima"){side = ""}
					se(side == "direita"){side = ""}
					se(side == ""){
						se(input!="direita" e input!="cima"){side = input}
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

				se(bypass == 1){
				gr.desenhar_retangulo(LARGURA/4+(size-1), ALTURA/2+size*2+6, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/4+(size-1), ALTURA/2+size*2+6, "1v")
				gr.definir_cor(gr.COR_VERDE)
				}
				se(ti.real_para_inteiro(x)-1 == LARGURA/4+(size-1) e ti.real_para_inteiro(y)+1 == ALTURA/2+size*2+6){ //INTERACAO (X) BLOCO 1
					se(input == "esquerda"){side = "esquerda"}
					se(input == "direita"){side = "direita"}
					se(input == "cima"){side = "cima"}
					se(input == "baixo"){side = side}
					se(side == "baixo"){side = ""}
					se(side == ""){
						se(input!="baixo"){side = input}
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

				se(bypass == 1){
				gr.desenhar_retangulo(LARGURA/5+1, ALTURA/2+size*2+6, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/5+1, ALTURA/2+size*2+6, "-1v")
				gr.definir_cor(gr.COR_VERDE)
				}
				se(ti.real_para_inteiro(x)-1 == LARGURA/5+1 e ti.real_para_inteiro(y)+1 == ALTURA/2+size*2+6){ //INTERACAO (X) BLOCO 1
					se(input == "esquerda"){side = "esquerda"}
					se(input == "direita"){side = "direita"}
					se(input == "cima"){side = "cima"}
					se(input == "baixo"){side = "baixo"}
					se(side == ""){
						side = input
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

				se(bypass == 1){
				gr.desenhar_retangulo(size/2-4, ALTURA/2+size*2+6, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(size/2-4, ALTURA/2+size*2+6, "--v")
				gr.definir_cor(gr.COR_VERDE)
				}
				se(ti.real_para_inteiro(x)-1 == size/2-4 e ti.real_para_inteiro(y)+1 == ALTURA/2+size*2+6){ //INTERACAO (X) BLOCO 1
					se(input == "esquerda"){side = side}
					se(input == "direita"){side = "direita"}
					se(input == "cima"){side = side}
					se(input == "baixo"){side = "baixo"}
					se(side == "cima"){side = ""}
					se(side == "esquerda"){side = ""}
					se(side == ""){
						se(input!="cima" e input!="esquerda"){side = input}
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

				
				se(bypass == 1){
				gr.desenhar_retangulo(size/2-4, ALTURA/2+ALTURA/4-14, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(size/2-4, ALTURA/2+ALTURA/4-14, "-v")
				gr.definir_cor(gr.COR_VERDE)
				}
				se(ti.real_para_inteiro(x)-1 == size/2-4 e ti.real_para_inteiro(y)+1 == ALTURA/2+ALTURA/4-14){ //INTERACAO (X) BLOCO 1
					se(input == "esquerda"){side = side}
					se(input == "direita"){side = "direita"}
					se(input == "cima"){side = "cima"}
					se(input == "baixo"){side = side}
					se(side == "baixo"){side = ""}
					se(side == "esquerda"){side = ""}
					se(side == ""){
						se(input!="baixo" e input!="esquerda"){side = input}
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

				
				se(bypass == 1){
				gr.desenhar_retangulo(size*2-15, ALTURA/2+ALTURA/4-14, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(size*2-15, ALTURA/2+ALTURA/4-14, "v-1")
				gr.definir_cor(gr.COR_VERDE)
				}
				se(ti.real_para_inteiro(x)-1 == size*2-15 e ti.real_para_inteiro(y)+1 == ALTURA/2+ALTURA/4-14){ //INTERACAO (X) BLOCO 1
					se(input == "esquerda"){side = "esquerda"}
					se(input == "direita"){side = side}
					se(input == "cima"){side = side}
					se(input == "baixo"){side = "baixo"}
					se(side == "cima"){side = ""}
					se(side == "direita"){side = ""}
					se(side == ""){
						se(input!="cima" e input!="direita"){side = input}
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

				
				se(bypass == 1){
				gr.desenhar_retangulo(LARGURA/5+1, ALTURA/2+ALTURA/4-14, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/5+1, ALTURA/2+ALTURA/4-14, "v")
				gr.definir_cor(gr.COR_VERDE)
				}
				se(ti.real_para_inteiro(x)-1 == LARGURA/5+1 e ti.real_para_inteiro(y)+1 == ALTURA/2+ALTURA/4-14){ //INTERACAO (X) BLOCO 1
					se(input == "esquerda"){side = side}
					se(input == "direita"){side = "direita"}
					se(input == "cima"){side = "cima"}
					se(input == "baixo"){side = "baixo"}
					se(side == "esquerda"){side = ""}
					se(side == ""){
						se(input!="esquerda"){side = input}
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

				
				se(bypass == 1){
				gr.desenhar_retangulo(LARGURA/4+size*2+27, ALTURA/2+size*2+6, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/4+size*2+27, ALTURA/2+size*2+6, "1vD")
				gr.definir_cor(gr.COR_VERDE)
				}
				se(ti.real_para_inteiro(x)-1 == LARGURA/4+size*2+27 e ti.real_para_inteiro(y)+1 == ALTURA/2+size*2+6){ //INTERACAO (X) BLOCO 1
					se(input == "esquerda"){side = "esquerda"}
					se(input == "direita"){side = side}
					se(input == "cima"){side = side}
					se(input == "baixo"){side = "baixo"}
					se(side == "direita"){side = ""}
					se(side == "cima"){side = ""}
					se(side == ""){
						se(input!="direita" e input!="cima"){side = input}
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

				
				gr.desenhar_retangulo(LARGURA/4+(size-1), ALTURA/2+ALTURA/4-14, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/4+(size-1), ALTURA/2+ALTURA/4-14, "1vv")
				gr.definir_cor(gr.COR_VERDE)
				se(ti.real_para_inteiro(x)-1 == LARGURA/4+(size-1) e ti.real_para_inteiro(y)+1 == ALTURA/2+ALTURA/4-14){ //INTERACAO (X) BLOCO 1
					se(input == "esquerda"){side = "esquerda"}
					se(input == "direita"){side = "direita"}
					se(input == "cima"){side = side}
					se(input == "baixo"){side = "baixo"}
					se(side == "cima"){side = ""}
					se(side == ""){
						se(input!="cima"){side = input}
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

				gr.desenhar_retangulo(LARGURA/4+size*2+27, ALTURA/2+ALTURA/4-14, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/4+size*2+27, ALTURA/2+ALTURA/4-14, "vDD")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(LARGURA/4+(size-1), ALTURA/2+ALTURA/3-6, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/4+(size-1), ALTURA/2+ALTURA/3-6, "1v3")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(LARGURA/5+1, ALTURA/2+ALTURA/3-6, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/5+1, ALTURA/2+ALTURA/3-6, "-v3")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(size*2-15, ALTURA/2+ALTURA/3-6, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(size*2-15, ALTURA/2+ALTURA/3-6, "--3")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(LARGURA/4+size*2+27, ALTURA/2+ALTURA/3-6, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/4+size*2+27, ALTURA/2+ALTURA/3-6, "+vD")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(LARGURA/4+size*2+27, ALTURA/2+ALTURA/3+size+16, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/4+size*2+27, ALTURA/2+ALTURA/3+size+16, "vD")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(size/2-4, ALTURA/2+ALTURA/3+size+16, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(size/2-4, ALTURA/2+ALTURA/3+size+16, "-vD")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(size/2-4, ALTURA/2+ALTURA/3-5, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(size/2-4, ALTURA/2+ALTURA/3-5, "^vD")
				gr.definir_cor(gr.COR_VERDE)
				
				gr.desenhar_retangulo(LARGURA/2+LARGURA/8+2, ALTURA/2+((size/2)+3), size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/2+LARGURA/8+2, ALTURA/2+((size/2)+3), "2")
				gr.definir_cor(gr.COR_VERDE)
				se(ti.real_para_inteiro(x)-1 == LARGURA/2+LARGURA/8+2 e ti.real_para_inteiro(y)+1 == ALTURA/2+((size/2)+3)){ //INTERACAO (X) BLOCO 1
					se(input == "esquerda"){side = "esquerda"}
					se(input == "direita"){side = side}
					se(input == "cima"){side = "cima"}
					se(input == "baixo"){side = "baixo"}
					se(side == "direita"){side = ""}
					se(side == ""){
						se(input!="direita"){side = input}
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

				gr.desenhar_retangulo(LARGURA/2+LARGURA/8+2, ALTURA/2-size-2, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/2+LARGURA/8+2, ALTURA/2-size-2, "2+")
				gr.definir_cor(gr.COR_VERDE)
				
				gr.desenhar_retangulo(LARGURA/2+LARGURA/8+2, ALTURA/3+4, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/2+LARGURA/8+2, ALTURA/3+4, "2^")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(LARGURA/2+LARGURA/8+2, ALTURA/4-4, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/2+LARGURA/8+2, ALTURA/4-4, "2^2")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(LARGURA/2+14, ALTURA/3+4, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/2+14, ALTURA/3+4, "2^E")
				gr.definir_cor(gr.COR_VERDE)
				
				gr.desenhar_retangulo(LARGURA/2+LARGURA/8+2, ALTURA/2+size*2+6, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/2+LARGURA/8+2, ALTURA/2+size*2+6, "2v")
				gr.definir_cor(gr.COR_VERDE)
				se(ti.real_para_inteiro(x)-1 == LARGURA/2+LARGURA/8+2 e ti.real_para_inteiro(y)+1 == ALTURA/2+size*2+6){ //INTERACAO (X) BLOCO 1
					se(input == "esquerda"){side = "esquerda"}
					se(input == "direita"){side = "direita"}
					se(input == "cima"){side = "cima"}
					se(input == "baixo"){side = side}
					se(side == "baixo"){side = ""}
					se(side == ""){
						se(input!="baixo"){side = input}
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

			
				gr.desenhar_retangulo(LARGURA/2+LARGURA/4-8, ALTURA/2+size*2+6, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/2+LARGURA/4-8, ALTURA/2+size*2+6, "2v1")
				gr.definir_cor(gr.COR_VERDE)
				se(ti.real_para_inteiro(x)-1 == LARGURA/2+LARGURA/4-8 e ti.real_para_inteiro(y)+1 == ALTURA/2+size*2+6){ //INTERACAO (X) BLOCO 1
					se(input == "esquerda"){side = "esquerda"}
					se(input == "direita"){side = "direita"}
					se(input == "cima"){side = "cima"}
					se(input == "baixo"){side = "baixo"}
					se(side == ""){
						side = input
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		


				gr.desenhar_retangulo(LARGURA-size-15, ALTURA/2+size*2+6, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA-size-15, ALTURA/2+size*2+6, "2v2")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(LARGURA/2+14, ALTURA/2+size*2+6, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/2+14, ALTURA/2+size*2+6, "2vE")
				gr.definir_cor(gr.COR_VERDE)
				se(ti.real_para_inteiro(x)-1 == LARGURA/2+14 e ti.real_para_inteiro(y)+1 == ALTURA/2+size*2+6){ //INTERACAO (X) BLOCO 1
					se(input == "esquerda"){side = side}
					se(input == "direita"){side = "direita"}
					se(input == "cima"){side = side}
					se(input == "baixo"){side = "baixo"}
					se(side == "esquerda"){side = ""}
					se(side == "cima"){side = ""}
					se(side == ""){
						se(input!="esquerda" e input!="cima"){side = input}
					}
	se(side=="esquerda"){player=playerL}se(side=="direita"){player=playerR}se(side=="cima"){player=playerU}se(side=="baixo"){player=playerD}
				}		

				gr.desenhar_retangulo(LARGURA/2+LARGURA/8+2, ALTURA/2+ALTURA/4-14, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/2+LARGURA/8+2, ALTURA/2+ALTURA/4-14, "2vv")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(LARGURA/2+LARGURA/4-8, ALTURA/2+ALTURA/4-14, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/2+LARGURA/4-8, ALTURA/2+ALTURA/4-14, "3vv")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(LARGURA-size*2-23, ALTURA/2+ALTURA/4-14, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA-size*2-23, ALTURA/2+ALTURA/4-14, "3v+")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(LARGURA-size-15, ALTURA/2+ALTURA/4-14, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA-size-15, ALTURA/2+ALTURA/4-14, "3++")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(LARGURA/2+14, ALTURA/2+ALTURA/4-14, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/2+14, ALTURA/2+ALTURA/4-14, "vED")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(LARGURA/2+LARGURA/8+2, ALTURA/2+ALTURA/3-6, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/2+LARGURA/8+2, ALTURA/2+ALTURA/3-6, "2v3")
				gr.definir_cor(gr.COR_VERDE)
	
				gr.desenhar_retangulo(LARGURA/2+LARGURA/4-8, ALTURA/2+ALTURA/3-6, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/2+LARGURA/4-8, ALTURA/2+ALTURA/3-6, "+v3")
				gr.definir_cor(gr.COR_VERDE)
				
				gr.desenhar_retangulo(LARGURA-size*2-23, ALTURA/2+ALTURA/3-6, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA-size*2-23, ALTURA/2+ALTURA/3-6, "++3")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(LARGURA/2+14, ALTURA/2+ALTURA/3-6, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/2+14, ALTURA/2+ALTURA/3-6, "-vE")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(LARGURA/2+14, ALTURA/2+ALTURA/3+size+16, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA/2+14, ALTURA/2+ALTURA/3+size+16, "vE")
				gr.definir_cor(gr.COR_VERDE)
				
				gr.desenhar_retangulo(LARGURA-size-15, ALTURA/2+ALTURA/3+size+16, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA-size-15, ALTURA/2+ALTURA/3+size+16, "vE+")
				gr.definir_cor(gr.COR_VERDE)

				gr.desenhar_retangulo(LARGURA-size-15, ALTURA/2+ALTURA/3-5, size, size, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto(LARGURA-size-15, ALTURA/2+ALTURA/3-5, "^vE")
				gr.definir_cor(gr.COR_VERDE)
				



     		
     	}//fecha bypass
     	
     }//fecha hitbox

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 19796; 
 * @DOBRAMENTO-CODIGO = [40, 44, 77, 96, 117, 122, 126, 170, 177, 186, 246, 264, 283, 303, 321, 340, 359, 377, 394, 414, 434, 454, 473, 491, 547, 583, 600, 621];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */