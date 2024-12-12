#obtem o número de vogais
def vogaisCount(entrada):
    text = entrada.lower().replace(" ", "")
    numDeVogais, numDeConsoantes, vogais = 0, 0, "aeiouáéíóúâêîôûãõ" if text != "s" else  exit(print("Saindo..."))
    while not(text.isalpha()):
        text = input("Digite uma frase válida: ").lower().replace(" ", "") 
    for index in text if text != "s" else  exit(print("Saindo...")):
        if index in vogais: numDeVogais+=1  
        else: numDeConsoantes+=1
        
    print(f"O número de vogais no texto é de: '{numDeVogais}' e o de consoantes: '{numDeConsoantes}'")


entrada = input("Digite seu texto: ")

print(vogaisCount(entrada))


# REFORMULAR DEPOIS, CRIAR METODO DE CHECAGEM