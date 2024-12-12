programa
{
	inclua biblioteca Graficos --> gr
	inclua biblioteca Util --> ut
	inclua biblioteca Teclado --> te
	inclua biblioteca ServicosWeb --> sw
	
	funcao inicio()
	{
		
		inteiro i = 0 //keyon
		inteiro oxe = 0

		//TELA
		inteiro alturaPC = gr.largura_tela()/2
		inteiro larguraPC = (gr.altura_tela()/2)-gr.altura_tela()/40

				//TIPO DE BRANCO E TIPO DE AZUL
		inteiro corCC = gr.criar_cor(24, 28, 64)
		inteiro fundoG = gr.criar_cor(216, 224, 227)

                    //DESENHAR FUNCAO
		cadeia input = "Digite sua função!"
		cadeia save = ""
		cadeia resultado =""
		

		
		para(i=0;i<1;oxe++){
			se(oxe==0){gr.iniciar_modo_grafico(verdadeiro)
		
	     		gr.definir_titulo_janela("Cienciâs da Computação | Console")
				gr.definir_dimensoes_janela(alturaPC, larguraPC)
				gr.definir_cor(corCC)
/*         gr.desenhar_retangulo(0, 0, alturaPC, larguraPC, falso, verdadeiro)    */
				gr.limpar()
				gr.definir_cor(gr.COR_BRANCO)
/*         gr.desenhar_texto(x, y, texto)               */
				gr.desenhar_texto(45, 45, "Análise de Gráficos")
				gr.definir_estilo_texto(falso, falso, falso)
				gr.definir_fonte_texto("Arial")
				gr.definir_tamanho_texto(32.0)
				gr.definir_cor(fundoG)
				gr.desenhar_retangulo((alturaPC/28),180,300,300, falso, verdadeiro)
				//gr.desenhar_retangulo(x, y, largura, altura, arredondar_cantos, preencher)
				gr.desenhar_retangulo((alturaPC/2)+(alturaPC/18), 30, 400, 50, falso, verdadeiro)
				gr.definir_cor(gr.COR_PRETO)
				gr.desenhar_texto((alturaPC/2)+(alturaPC/16), 40, input)
				
				gr.renderizar() //atualiza (1)
				
				leia(input)
				 
				se(input!=""){
					save = input
					
					resultado = sw.obter_dados("https://api.mathjs.org/v4?expr="+input)
					
	     			gr.definir_titulo_janela("Cienciâs da Computação | Console")
					gr.definir_dimensoes_janela(alturaPC, larguraPC)
					gr.definir_cor(corCC)
					//gr.desenhar_retangulo(0, 0, alturaPC, larguraPC, falso, verdadeiro)
					gr.limpar()
					gr.definir_cor(gr.COR_BRANCO)
					//gr.desenhar_texto(x, y, texto)
					gr.desenhar_texto(45, 45, "Análise de Gráficos")
					gr.definir_estilo_texto(falso, falso, falso)
					gr.definir_fonte_texto("Arial")
					gr.definir_tamanho_texto(32.0)
					gr.definir_cor(fundoG)
					gr.desenhar_retangulo((alturaPC/28),180,300,300, falso, verdadeiro)
					//gr.desenhar_retangulo(x, y, largura, altura, arredondar_cantos, preencher)
					gr.desenhar_retangulo((alturaPC/2)+(alturaPC/18), 30, 400, 50, falso, verdadeiro)
					gr.definir_cor(gr.COR_PRETO)
					gr.desenhar_texto((alturaPC/2)+(alturaPC/16), 40, resultado)
					inteiro opa = gr.carregar_imagem("C:\\Users\\Marcos Emanuel\\Downloads\\wwww.png")
					gr.redimensionar_imagem(opa,20, 20, verdadeiro)
					gr.desenhar_imagem(50, 80, opa)
					
				
					gr.renderizar() //atualiza (1)
				
					
				}


				


			}//FECHA SE
		
		}//FECHA FOR

	}
//enquanto (i==0) {
		//	se (oxe==0){
		//		gr.iniciar_modo_grafico(verdadeiro)
		//	     gr.definir_titulo_janela("Cienciâs da Computação | Console")
		//		gr.definir_dimensoes_janela(alturaPC, larguraPC)
		//		gr.desenhar_retangulo(0, 0, alturaPC, larguraPC, verdadeiro, verdadeiro)
		//		oxe = oxe+1
		//		
		//	}
		//}
		
}



		
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2712; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */