programa
{
	inclua biblioteca Matematica --> mat
	inclua biblioteca Tipos --> tip
	inclua biblioteca Texto --> tex
	funcao inicio()
	{
		setup()
	}

	funcao setup(){ //constroi todos os elementos e roda o programa no run()

	cadeia hexadecimal[16] = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}

	run()

	}

	funcao run() {

	cadeia texto
		leia(texto)
		

		
	}

	
	funcao inteiro toint(cadeia binary) {

		inteiro resposta = tip.cadeia_para_inteiro(binary, 2)

		retorne resposta
	}
	
	funcao cadeia tobinary(inteiro decimal) {

		cadeia resposta = tip.inteiro_para_cadeia(decimal, 2)

		retorne resposta
	}

	funcao cadeia tohex(inteiro decimal){
	
		cadeia resposta = tip.inteiro_para_cadeia(decimal, 16)

		retorne resposta
		
	}
	
	funcao inteiro todec(cadeia hexadecimal){
		inteiro resposta = tip.cadeia_para_inteiro(hexadecimal, 16)

		retorne resposta
		
	}

	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 377; 
 * @DOBRAMENTO-CODIGO = [28, 35, 42, 50];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */