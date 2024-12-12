programa
{
	inclua biblioteca Graficos --> gr
	inclua biblioteca Teclado --> te
	inclua biblioteca Util --> ut
	inclua biblioteca Tipos --> ti
	inclua biblioteca Arquivos --> ar
	inclua biblioteca Texto --> tex

	cadeia DOWN = "yDownloadsyTetrisy"
	cadeia DOCS = "yDocumentsyTetrisy"
	cadeia DESK = "yDesktopyTetrisy"
	cadeia path = "path.txt"
	cadeia userpath = ""
	cadeia Source = ""

	inteiro area[200] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
					 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  			    	 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				      0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	  				 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				      0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	    		      	 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
			     	 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	      			 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	   			      0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	      			 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	      		      0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	      		      0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	      		      0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	      	             


//ADMIN TOOLS
inteiro bypass = 1

//block size
inteiro size = 25

//__init__ block info
inteiro blocos = 4
cadeia aim = "cima"

//gravidade e velocidade do bloco
inteiro gravidade = 250 //tempo para queda
inteiro g = 0

	//informacao sobre tipo de blocos
	//cadeia random = "_|_	:	<_	:	_>	:	L:	_|	:	|	:	[]	:	[__"
	cadeia atual = "T"
	//sequencia de bloco cima T atual
	//cadeia sequencia
	inteiro soque = 1 //LADO DO BLOCO 
	inteiro caiu  = 0
	inteiro walleft = 0
	inteiro walright = 0
	inteiro teclatime = 1000
	
	//informacao do bloco
	real x = 300.0
	real y = 50.0
	real maxx //teste
	real maxy = y + size //teste

	//tela
	inteiro cenario = 0
	inteiro LARGURA = 600, ALTURA = 600

	funcao inicio() //CHAMA O CONSTRUTOR DA TELA
	{
		construir_tela()
	}

	
	funcao construir_tela(){
		gr.iniciar_modo_grafico(verdadeiro)
		//inteiro LARGURA = gr.largura_janela()/2.3 + gr.largura_janela()/2
		//inteiro ALTURA = gr.altura_janela() + gr.altura_janela()/4
		
		gr.definir_dimensoes_janela(LARGURA, ALTURA)
		gr.definir_titulo_janela("Ciencias da Computacao | Console")

		cenario = gr.carregar_imagem("\\Resources\\tetrisArena.png")
		cenario = gr.redimensionar_imagem(cenario, LARGURA/2, gr.altura_imagem(cenario)/4, verdadeiro)

		//blocoAtual = gr.carregar_imagem(Source+"\\blocoT.png")

		enquanto(verdadeiro){//mantem a tela ligada e limpa ela (atualiza para branco)
			run() //roda o programa
			
		}
	}//fecha construir_tela()


	funcao run(){ //RODA O PROGRAMA APÓS O CONSTRUTOR DA TELA TER FINALIZADO
		limpe()
		desenharMapa()
		desenharBlocoAtual()
		gr.renderizar()
	}

	funcao limpe(){ //LIMPA TUDO PARA PRETO, CASO NECESSARIO.
		gr.definir_cor(gr.COR_PRETO)
		gr.limpar()
	}

	funcao desenharMapa(){ //DESENHA A ARTE DE FUNDO //ORGANIZAR FUNCOES DEPOIS
		gr.desenhar_imagem(LARGURA/2-LARGURA/4, 25, cenario)
		//gr.desenhar_imagem(x, y, blocoAtual)
		//gr.definir_cor(gr.COR_VERMELHO)

		se(bypass==1){
			gr.definir_cor(gr.COR_VERDE)
			gr.desenhar_retangulo(x, y, size/2, size/2, falso, verdadeiro)
			gr.definir_cor(gr.COR_VERMELHO)
		}
		

	}

	funcao desenharBlocoAtual(){
		//GARANTE QUE O BLOCO NÃO VAI PASSAR DO PISo
		movimento()//anda pros lados e gira
		atualizaSequencia()//lado olhando, trocao  AIM baseado na manipulação do soque no bloco anterior
		
		    g++
		    gravidadeBloco()	
	
		
		///desenha
		gr.definir_cor(gr.COR_AMARELO)
		drawT(x,y)
	}

	funcao movimento(){
		se((te.tecla_pressionada(te.TECLA_A) ou te.tecla_pressionada(te.TECLA_SETA_ESQUERDA)) e teclatime>=1000 e caiu==0 e walleft == 0){
			x = x - size
			teclatime=0
			walright = 0
		}
		
		se((te.tecla_pressionada(te.TECLA_D) ou te.tecla_pressionada(te.TECLA_SETA_DIREITA)) e teclatime>=1000 e caiu==0 e walright == 0){
			x = x + size
			teclatime=0
			walleft = 0
		}
		
		se(te.tecla_pressionada(te.TECLA_Q) e teclatime>=1000 e caiu==0){
			se(soque!=4){
				soque = soque + 1
			} senao {soque = 1}
			teclatime=0
		}
		
		se(te.tecla_pressionada(te.TECLA_E) e teclatime>=1000 e caiu==0){
			se(soque!=1){
				soque = soque - 1
			} senao {soque = 4}
			teclatime=0
		}

		se(bypass==1){
		
		se(te.tecla_pressionada(te.TECLA_R) e teclatime>=1000){
			inteiro escol = ut.sorteia(0, 4)
			se(escol==0){
				atual="[]"
			}
			se(escol==2){
				atual="L"
			}
			se(escol==1){
				atual="T"
			}
			se(escol==3){
				atual="esc"
			}
			se(escol==4){
				atual="|"
			}
			teclatime=0
		}
		}
		
		teclatime++
	
	
	}

	funcao gravidadeBloco(){
		//se(caiu==1){//puxa funcao de salvar dados e inicia outro bloco
			salvarDados()
		//} senao {
		
		se(atual == "|"){ //LARGURA/2 - LARGURA/4-size*4 é o limite de rotação pra direita
			se(aim=="cima" ou aim == "baixo"){
				maxy = y + size*2
				maxx = x
			} senao {maxy = y-size
			maxx = x+size*3}
		}
		se(atual == "T"){
			se(aim=="cima"){
				maxy = y
				maxx = x+size*2
			} senao { maxy = y + size
			maxx = x+size}
		}
		se(atual == "[]"){
			maxy = y
			maxx = x+size
		}
		se(atual == "esc"){
			se(aim == "cima" ou aim == "baixo"){
				maxy = y
				maxx = x+size*2
			} senao { maxy = y + size
			maxx = x+size}
		}
		se(atual == "L"){
			se(aim == "cima" ou aim == "baixo"){
				maxy = y+size
				maxx = x+size
			} senao { maxy = y
			maxx = x+size*2}
		}

//monitora maxx
//gr.desenhar_retangulo(maxx, 30, size, size, falso, verdadeiro)
//gr.desenhar_retangulo(LARGURA/2 + LARGURA/4-size, 30, size, size, falso, verdadeiro)

         
		se(x-size == LARGURA/2 - LARGURA/4){ //colisão esquerda completa
			walleft = 1
			walright = 0
		} senao { //colisoes direita
			se(maxx+size == LARGURA/2 + LARGURA/4-size) {
				walright = 1
				walleft = 0
			}
		}
		
		se(maxy == y-size e maxy <= ALTURA-size*5){
			caiu = 0
			se(g>=gravidade){
				y = y +size
				g = 0
			}
		} senao {

		se(maxy == y e maxy <= ALTURA-size*5){
			caiu = 0
			se(g>=gravidade){
				y = y + size
				g = 0
			}
		} senao {

		se(maxy == y+size e maxy <= ALTURA-size*5){ //colisao cima e baixo |
			caiu = 0
			se(g>=gravidade){
				y = y + size
				g = 0
			}	
	} senao {
	
		se(maxy == y+size*2 e maxy <= ALTURA-size*5){ //colisao cima e baixo |
			caiu = 0
			se(g>=gravidade){
				y = y + size
				g = 0
		
			}
		} senao {caiu = 1}

	
				}
			}//senao segundo
		}//senao primeiro
		//}//senao CAIU
	}

     funcao salvarDados(){
     	para(inteiro o=0; o<201; o++) {

			se(bypass==0){ //admin HUD
     		
     		gr.definir_cor(gr.COR_BRANCO)
     		se(o<=9){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*o, size*2, size, size, falso, falso)
     		} senao {
     		     		se(o<=19){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-10), size*3, size, size, falso, falso)
     		} senao {
     		     		se(o<=29){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-20), size*4, size, size, falso, falso)
     		} senao {
     		     		se(o<=39){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-30), size*5, size, size, falso, falso)
     		} senao {
     		     		se(o<=49){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-40), size*6, size, size, falso, falso)
     		} senao {
     		     		se(o<=59){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-50), size*7, size, size, falso, falso)
     		} senao {
     		     		se(o<=69){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-60), size*8, size, size, falso, falso)
     		} senao {
     		     		se(o<=79){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-70), size*9, size, size, falso, falso)
     		} senao {
     		     		se(o<=89){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-80), size*10, size, size, falso, falso)
     		} senao {
     		     		se(o<=99){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-90), size*11, size, size, falso, falso)
     		} senao {
     		     		se(o<=109){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-100), size*12, size, size, falso,falso)
     		} senao {
     			     	se(o<=119){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-110), size*13, size, size,falso, falso)
     		} senao {
     		     		se(o<=129){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-120), size*14, size, size, falso, falso)
     		} senao {
     		     		se(o<=139){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-130), size*15, size, size, falso, falso)
     		} senao {
     		     		se(o<=149){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-140), size*16, size, size, falso, falso)
     		} senao {
     		     		se(o<=159){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-150), size*17, size, size, falso, falso)
     		} senao {
     		     		se(o<=169){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-160), size*18, size, size, falso, falso)
     		} senao {
     		     		se(o<=179){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-170), size*19, size, size, falso, falso)
     		} senao {
     		     		se(o<=189){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-180), size*20, size, size, falso, falso)
     		} senao {
     		     		se(o<=199){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-190), size*21, size, size, falso, falso)
     		} senao {/*depois de desenhar tudo */ }}}}}}}}}}}}}}}}}}}
     		
     			}
			gr.definir_cor(gr.COR_VERMELHO)}//bypass
     		
     		se(bypass==1){ //player HUD
     		
     		gr.definir_cor(gr.COR_BRANCO)

     		     		     				se(caiu==1){
     		para(inteiro W = x; W<(maxx+size*2);W = W + size) {//captura x da area
     			
     			gr.desenhar_retangulo(W, maxy+size, size, size, falso, verdadeiro)
     			//tenho q obter o index da area para as coordenadas de W e salvar no vetor
     			
     		}
     		     				}//está na linha
     		     			//caiu

     		     			
     		se(o<=9){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*o, size*2, size, size, falso, falso)
     		} senao {
     		     		se(o<=19){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-10), size*3, size, size, falso, falso)
     		} senao {
     		     		se(o<=29){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-20), size*4, size, size, falso, falso)
     		} senao {
     		     		se(o<=39){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-30), size*5, size, size, falso, falso)
     		} senao {
     		     		se(o<=49){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-40), size*6, size, size, falso, falso)
     		} senao {
     		     		se(o<=59){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-50), size*7, size, size, falso, falso)
     		} senao {
     		     		se(o<=69){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-60), size*8, size, size, falso, falso)
     		} senao {
     		     		se(o<=79){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-70), size*9, size, size, falso, falso)
     		} senao {
     		     		se(o<=89){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-80), size*10, size, size, falso, falso)
     		} senao {
     		     		se(o<=99){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-90), size*11, size, size, falso, falso)
     		} senao {
     		     		se(o<=109){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-100), size*12, size, size, falso,falso)
     		} senao {
     			     	se(o<=119){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-110), size*13, size, size,falso, falso)
     		} senao {
     		     		se(o<=129){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-120), size*14, size, size, falso, falso)
     		} senao {
     		     		se(o<=139){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-130), size*15, size, size, falso, falso)
     		} senao {
     		     		se(o<=149){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-140), size*16, size, size, falso, falso)
     		} senao {
     		     		se(o<=159){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-150), size*17, size, size, falso, falso)
     		} senao {
     		     		se(o<=169){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-160), size*18, size, size, falso, falso)
     		} senao {
     		     		se(o<=179){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-170), size*19, size, size, falso, falso)
     		} senao {
     		     		se(o<=189){
     		gr.desenhar_retangulo((LARGURA/2-LARGURA/4+size)+size*(o-180), size*20, size, size, falso, falso)
     		} senao {
     		     		se(o<=199){
     		     			se(maxy==size*20){
     		     				
     		     			}
     		     			
     		} senao {/*depois de desenhar tudo */ }}}}}}}}}}}}}}}}}}}
     		
     			}
			
			
			
			gr.definir_cor(gr.COR_VERMELHO)}//player pass

     		
     		}
     	     
   
     }

	funcao atualizaSequencia(){
		escolha(soque){
				caso 1:
				//sequencia = "0,1,0,1,1,1"
				aim = "cima"
				pare
				caso 2:
				aim = "esquerda"
				pare
				caso 3:
				//sequencia = "1,1,1,0,1,0"
				aim = "baixo"
				pare
				caso 4:
				//sequencia = "1,0,1,1,1,0"
				aim = "direita"
				pare
				
		}
	
	
	}

	funcao vazio drawT(real x, real y){
		
		para(inteiro i=0; i<blocos; i++){              //drawPARTSY(i,aim)
			gr.desenhar_retangulo(drawPARTSX(i, aim, atual), drawPARTSY(i, aim, atual), size, size, falso, verdadeiro)
			//escreva(1+i)
		}//for
	
	}//func

	
	funcao inteiro drawPARTSX(inteiro i, cadeia aim, cadeia atual){
		se(atual=="T"){
			se(aim=="cima"){
				se(i==0){
						retorne x+size	
				} senao {
				se(i==1){
						retorne x			
				} senao {
				se(i==2) {
						retorne x+size				
				} senao {
				se(i==3) {
						retorne x+size*2				
				} senao {
				retorne 2
				}
			}
		}
	}
			}senao {
				se(aim=="esquerda"){
							se(i==0){
								retorne x+size
							} senao {
								se(i==1){
									retorne x
								} senao {
									se(i==2) {
										retorne x+size
									} senao {
										se(i==3) {
											retorne x+size
										} senao {
											retorne 2
										}
									}
								}
							}
				} senao {
					se(aim=="baixo"){
							se(i==0){
								retorne x
							} senao {
								se(i==1){
									retorne x+size
								} senao {
									se(i==2) {
										retorne x+size*2
									} senao {
										se(i==3) {
											retorne x+size
										} senao {
											retorne 2
										}
									}
								}
							}
					} senao {
						se(aim=="direita"){
							se(i==0){
								retorne x
							} senao {
								se(i==1){
									retorne x
								} senao {
									se(i==2) {
										retorne x+size
									} senao {
										se(i==3) {
											retorne x
										} senao {
											retorne 2
										}
									}
								}
							}
						} senao {retorne 2}
					}
				}
			}

			
		}senao {
			se(atual=="L"){
				se(aim=="cima"){
						se(i==0){
								retorne x
							} senao {
								se(i==1){
									retorne x
								} senao {
									se(i==2) {
										retorne x
									} senao {
										se(i==3) {
											retorne x+size
										} senao {
											retorne 2
										}
									}
								}
							}
				}senao {
					se(aim=="esquerda"){
							se(i==0){
								retorne x+size*2
							} senao {
								se(i==1){
									retorne x
								} senao {
									se(i==2) {
										retorne x+size
									} senao {
										se(i==3) {
											retorne x+size*2
										} senao {
											retorne 2
										}
									}
								}
							}
					} senao {
						se(aim=="baixo"){
							se(i==0){
								retorne x
							} senao {
								se(i==1){
									retorne x+size
								} senao {
									se(i==2) {
										retorne x+size
									} senao {
										se(i==3) {
											retorne x+size
										} senao {
											retorne 2
										}
									}
								}
							}
						} senao {
							se(aim=="direita"){
								se(i==0){
									retorne x
								} senao {
									se(i==1){
										retorne x+size
									} senao {
										se(i==2) {
											retorne x+size*2
										} senao {
											se(i==3) {
												retorne x
											} senao {
												retorne 2
											}
										}
									}
								}
							} senao {retorne 2}
						}
					}
				}

			}senao {
				se(atual=="|"){
					se(aim=="cima"){
							se(i==0){
								retorne x
							} senao {
								se(i==1){
									retorne x
								} senao {
									se(i==2) {
										retorne x
									} senao {
										se(i==3) {
											retorne x
										} senao {
											retorne 2
										}
									}
								}
							}
					}senao {
						se(aim=="esquerda"){
							se(i==0){
								retorne x
							} senao {
								se(i==1){
									retorne x+size
								} senao {
									se(i==2) {
										retorne x+size*2
									} senao {
										se(i==3) {
											retorne x+size*3
										} senao {
											retorne 2
										}
									}
								}
							}
						} senao {
							se(aim=="baixo"){
								se(i==0){
									retorne x
								} senao {
									se(i==1){
										retorne x
									} senao {
										se(i==2) {
											retorne x
										} senao {
											se(i==3) {
												retorne x
											} senao {
												retorne 2
											}
										}
									}
								}
							} senao {
								se(aim=="direita"){
									se(i==0){
										retorne x
									} senao {
										se(i==1){
											retorne x+size
										} senao {
											se(i==2) {
												retorne x+size*2
											} senao {
												se(i==3) {
													retorne x+size*3
												} senao {
													retorne 2
												}
											}
										}
									}
								} senao {retorne 2}
							}
						}
					}

				}senao {
					se(atual=="esc"){
						se(aim=="cima"){
							se(i==0){
								retorne x+size
							} senao {
								se(i==1){
									retorne x+size*2
								} senao {
									se(i==2) {
										retorne x
									} senao {
										se(i==3) {
											retorne x+size
										} senao {
											retorne 2
										}
									}
								}
							}
						}senao {
							se(aim=="esquerda"){
								se(i==0){
									retorne x
								} senao {
									se(i==1){
										retorne x
									} senao {
										se(i==2) {
											retorne x+size
										} senao {
											se(i==3) {
												retorne x+size
											} senao {
												retorne 2
											}
										}
									}
								}
							} senao {
									se(aim=="baixo"){
										se(i==0){
											retorne x+size
										} senao {
											se(i==1){
												retorne x+size*2
											} senao {
												se(i==2) {
													retorne x
												} senao {
													se(i==3) {
														retorne x+size
													} senao {
														retorne 2
													}
												}
											}
										}
									} senao {
										se(aim=="direita"){
											se(i==0){
												retorne x
												} senao {
													se(i==1){
														retorne x
														} senao {
														se(i==2) {
															retorne x+size
															} senao {
																se(i==3) {
																	retorne x+size
																	} senao {
																		retorne 2
																	}
																}
															}
														}
											} senao {retorne 2}
										}
									}
								}

					} senao {
						se(atual=="[]"){
							se(i==0){
								retorne x
							} senao {
								se(i==1){
									retorne x+size
								} senao {
									se(i==2) {
										retorne x
									} senao {
										se(i==3) {
											retorne x+size
										} senao {
											retorne 2
										}
									}
								}
							}

							
						} senao {
							retorne 2
						}
					}
				}
			}
		
		}
	}
	
	funcao inteiro drawPARTSY(inteiro i, cadeia aim, cadeia atual){
		se(atual=="T"){
			se(aim=="cima"){
				se(i==0){
						retorne y
				} senao {
				se(i==1){
						retorne y+size		
				} senao {
				se(i==2) {
						retorne y+size				
				} senao {
				se(i==3) {
						retorne y+size			
				} senao {
				retorne 2
				}
			}
		}
	}
			}senao {
				se(aim=="esquerda"){
							se(i==0){
								retorne y
							} senao {
								se(i==1){
									retorne y+size
								} senao {
									se(i==2) {
										retorne y+size
									} senao {
										se(i==3) {
											retorne y+size*2
										} senao {
											retorne 2
										}
									}
								}
							}
				} senao {
					se(aim=="baixo"){
							se(i==0){
								retorne y
							} senao {
								se(i==1){
									retorne y
								} senao {
									se(i==2) {
										retorne y
									} senao {
										se(i==3) {
											retorne y+size
										} senao {
											retorne 2
										}
									}
								}
							}
					} senao {
						se(aim=="direita"){
							se(i==0){
								retorne y
							} senao {
								se(i==1){
									retorne y+size
								} senao {
									se(i==2) {
										retorne y+size
									} senao {
										se(i==3) {
											retorne y+size*2
										} senao {
											retorne 2
										}
									}
								}
							}
						} senao {retorne 2}
					}
				}
			}

			
		}senao {
			se(atual=="L"){
				se(aim=="cima"){
						se(i==0){
								retorne y
							} senao {
								se(i==1){
									retorne y+size
								} senao {
									se(i==2) {
										retorne y+size*2
									} senao {
										se(i==3) {
											retorne y+size*2
										} senao {
											retorne 2
										}
									}
								}
							}
				}senao {
					se(aim=="esquerda"){
							se(i==0){
								retorne y
							} senao {
								se(i==1){
									retorne y+size
								} senao {
									se(i==2) {
										retorne y+size
									} senao {
										se(i==3) {
											retorne y+size
										} senao {
											retorne 2
										}
									}
								}
							}
					} senao {
						se(aim=="baixo"){
							se(i==0){
								retorne y
							} senao {
								se(i==1){
									retorne y
								} senao {
									se(i==2) {
										retorne y+size
									} senao {
										se(i==3) {
											retorne y+size*2
										} senao {
											retorne 2
										}
									}
								}
							}
						} senao {
							se(aim=="direita"){
								se(i==0){
									retorne y
								} senao {
									se(i==1){
										retorne y
									} senao {
										se(i==2) {
											retorne y
										} senao {
											se(i==3) {
												retorne y+size
											} senao {
												retorne 2
											}
										}
									}
								}
							} senao {retorne 2}
						}
					}
				}

			}senao {
				se(atual=="|"){
					se(aim=="cima"){
							se(i==0){
								retorne y
							} senao {
								se(i==1){
									retorne y+size
								} senao {
									se(i==2) {
										retorne y+size*2
									} senao {
										se(i==3) {
											retorne y+size*3
										} senao {
											retorne 2
										}
									}
								}
							}
					}senao {
						se(aim=="esquerda"){
							se(i==0){
								retorne y
							} senao {
								se(i==1){
									retorne y
								} senao {
									se(i==2) {
										retorne y
									} senao {
										se(i==3) {
											retorne y
										} senao {
											retorne 2
										}
									}
								}
							}
						} senao {
							se(aim=="baixo"){
								se(i==0){
									retorne y
								} senao {
									se(i==1){
										retorne y+size
									} senao {
										se(i==2) {
											retorne y+size*2
										} senao {
											se(i==3) {
												retorne y+size*3
											} senao {
												retorne 2
											}
										}
									}
								}
							} senao {
								se(aim=="direita"){
									se(i==0){
										retorne y
									} senao {
										se(i==1){
											retorne y
										} senao {
											se(i==2) {
												retorne y
											} senao {
												se(i==3) {
													retorne y
												} senao {
													retorne 2
												}
											}
										}
									}
								} senao {retorne 2}
							}
						}
					}

				}senao {
					se(atual=="esc"){
						se(aim=="cima"){
							se(i==0){
								retorne y
							} senao {
								se(i==1){
									retorne y
								} senao {
									se(i==2) {
										retorne y+size
									} senao {
										se(i==3) {
											retorne y+size
										} senao {
											retorne 2
										}
									}
								}
							}
						}senao {
							se(aim=="esquerda"){
								se(i==0){
									retorne y
								} senao {
									se(i==1){
										retorne y+size
									} senao {
										se(i==2) {
											retorne y+size
										} senao {
											se(i==3) {
												retorne y+size*2
											} senao {
												retorne 2
											}
										}
									}
								}
							} senao {
									se(aim=="baixo"){
										se(i==0){
											retorne y
										} senao {
											se(i==1){
												retorne y
											} senao {
												se(i==2) {
													retorne y+size
												} senao {
													se(i==3) {
														retorne y+size
													} senao {
														retorne 2
													}
												}
											}
										}
									} senao {
										se(aim=="direita"){
											se(i==0){
												retorne y
												} senao {
													se(i==1){
														retorne y+size
														} senao {
														se(i==2) {
															retorne y+size
															} senao {
																se(i==3) {
																	retorne y+size*2
																	} senao {
																		retorne 2
																	}
																}
															}
														}
											} senao {retorne 2}
										}
									}
								}

					} senao {
						se(atual=="[]"){
							se(i==0){
								retorne y
							} senao {
								se(i==1){
									retorne y
								} senao {
									se(i==2) {
										retorne y+size
									} senao {
										se(i==3) {
											retorne y+size
										} senao {
											retorne 2
										}
									}
								}
							}

							
						} senao {
							retorne 2
						}
					}
				}
			}
		
		}

		
	}



		
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1348; 
 * @DOBRAMENTO-CODIGO = [74, 80, 107, 117, 112, 126, 141, 147, 153, 160, 169, 167, 140, 201, 200, 207, 214, 218, 225, 242, 248, 256, 264, 272, 195, 291, 376, 379, 382, 385, 388, 391, 394, 397, 400, 403, 406, 409, 412, 415, 418, 421, 424, 427, 375, 449, 472, 483, 566, 648, 730, 813, 812, 482, 843, 926, 1008, 1090, 1172, 842];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */