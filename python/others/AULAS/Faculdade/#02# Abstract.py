#BORA SIMBORA CARAIOOOOOOOO 🤬🤬🤬🤬🤬🤬
def testando():
    try:
        for i in range(int(input("Digite o número de pessoas: "))): #para i na lista de: input(X)
            idades = int(input(f"Digite a idade da pessoa {i+1}: ")) #variavel idade é escrita X vezes e cada i é salvo na lista
    except:
        print("Escreva um número válido"); testando()
    media = sum(idades) / len(idades) #media, soma todos os items na variavel e divide pelo tamanho da lista.

    if media < 20:#                    AI MDS QUE LINDO ESSE CÓDIGO 😻
        print("Média de jovens")
    elif 20 <= media <= 40:
        print("Média de adultos")
    else:
        print("Média de idosos")
        
testando()

# revezar 
