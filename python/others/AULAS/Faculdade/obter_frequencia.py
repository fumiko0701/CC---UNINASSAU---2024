texto = input("Insira um texto: ").lower().replace(",", "").replace(".", "").replace("(", "").replace(")", "").split()
for palavra in set(texto):
    frequencia = texto.count(palavra)
    print(f"{palavra}: {frequencia} vez{'es' if frequencia != 1 else ''}")

#Obtem frequencia de palavras no texto