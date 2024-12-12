programa
{
	inclua biblioteca Graficos --> gr
	inclua biblioteca Tipos --> tip
	inclua biblioteca Matematica --> mat
	inclua biblioteca Mouse --> mou


	const inteiro LARGURA = 1200
	const inteiro ALTURA = 1200
	const logico old = falso

	
	inteiro tx = 400, ty = 600, tz = 200, screenx = 600, screeny= 600, focall = 200
	inteiro ue = 0


	inteiro redsprite
	inteiro spritesize = 20

	
	funcao inicio()
	{
		construir()
	}

	funcao construir(){
		gr.iniciar_modo_grafico(verdadeiro)
		gr.definir_dimensoes_janela(LARGURA, ALTURA)
		redsprite = gr.carregar_imagem("\\Recursos\\red.png")
		redsprite = gr.redimensionar_imagem(redsprite, 1,1,verdadeiro)
		enquanto(verdadeiro){
			run() //roda o programa
		}
		
	}

	funcao run(){
		limpe()
		render()
		cenario()




		gr.renderizar()
		
	}
	
	funcao limpe(){
		gr.limpar()
	}

inteiro n = 3
inteiro r = 8
inteiro l = 4
inteiro f = 6
inteiro t = 7
inteiro b = 3

  inteiro pjmatr[16] = {2*n/r-1, 0, r+1/r-1, 0,
				    0, 2*n/t-b, t+b/t-b, 0,
				    0, 0, -(f+n/f-n), -(2*f*n/f-n),
				    0, 0, -1, 0 }

	funcao render(){ //RENDERIZA TUDO

	screenx = 600
	screeny = 600
		screenx = focall * (tx/tz)
		screeny = focall * (ty/tz) //ANGULO
		spritesize = focall

		para(inteiro f = 1; f<5; f++) {
			escreva(pjmatr[f],", ")
			se(f==4){
				escreva("\n")
				para(inteiro k = 5; k<9; k++) {
					escreva(pjmatr[k],", ")
				}
				
			}
			
		}

		
		para(inteiro i = 0; i<spritesize;i++) { //face da frente
			gr.desenhar_imagem(screenx+i, screeny, redsprite)
			gr.desenhar_imagem(screenx, screeny-i, redsprite)
			gr.desenhar_imagem((screenx+spritesize)-i, screeny-spritesize, redsprite)
			gr.desenhar_imagem(screenx+spritesize, screeny-i, redsprite)


			gr.desenhar_imagem((screenx+spritesize/7) + i-(0.28*i), screeny-spritesize/7, redsprite)
			gr.desenhar_imagem((screenx+spritesize/7) + i-(0.28*i), screeny-spritesize/2-spritesize/2.8, redsprite)
	//cima e baixo

	//esquerda e direita
			gr.desenhar_imagem(screenx+spritesize/7, screeny-spritesize+spritesize/7 + i-(0.28*i), redsprite)
			gr.desenhar_imagem(screenx+(spritesize-spritesize/7), screeny-spritesize+spritesize/7 + i-(0.28*i), redsprite)

			para(inteiro w = 0; w<spritesize/7;w++){//desenha lados para o meio
//LADOS BAIXO		
				gr.desenhar_imagem(screenx+w, screeny-w, redsprite)
				gr.desenhar_imagem((screenx+spritesize)-w, screeny-w, redsprite)

//LADOS CIMA
				gr.desenhar_imagem(screenx+w, (screeny-spritesize)+w, redsprite)
				gr.desenhar_imagem((screenx+spritesize)-w, (screeny-spritesize)+w, redsprite)
				
			}
			
		}
	



leia(focall)

		

		
	}

	funcao cenario(){

		

		
	}


	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1114; 
 * @DOBRAMENTO-CODIGO = [21, 26, 37, 49];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */