#obtem o número de vogais
while True:
    texto = input("Digite uma frase válida: ").lower().replace(" ", "")
    numDeVogais, numDeConsoantes, vogais = 0, 0, "aeiouáéíóúâêîôûãõ" if texto != "s" else  exit(print("Saindo..."))
    while not(texto.isalpha()):
        texto = input("Digite uma frase válida: ").lower().replace(" ", "") 
    for index in texto if texto != "s" else  exit(print("Saindo...")):
        if index in vogais: numDeVogais+=1  
        else: numDeConsoantes+=1
        
    print(f"O número de vogais no texto é de: '{numDeVogais}' e o de consoantes: '{numDeConsoantes}'")
    