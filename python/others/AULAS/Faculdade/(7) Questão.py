while True:
    # frase a ser lida
    frase = input("Digite uma frase: ")
    palavra = input("Digite uma palavra para contar as ocorrências: ") #palavra buscada

    # dividindo a frase em palavras usando espaço e contando o número de ocorrências da palavra
    ocorrencias = frase.lower().split().count(palavra.lower())
    #fim <3
    print(f"A palavra '{palavra}' ocorre {ocorrencias} vezes na frase.")
