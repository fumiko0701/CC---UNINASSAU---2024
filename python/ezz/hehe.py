
texto = input("Insira um texto\n").lower().replace(" ", "")
vogais = ["a", "e", "i", "o", "u", "á", "à", "é", "í", "ô", "â", "ã", "ê", "ó"]; contagem = 0

for charindex in range(len(texto)):
    for vogal in vogais:
        if texto[charindex] == vogal:
            contagem += 1
            
print(f"{f"Existem {contagem} vogais" if not(contagem == 1) else f"Existe {contagem} vogal"} no texto.")

"""#dicionario
vogais = set("aeiouáàéíôâãêó")

texto = input("Insira um texto:\n").lower()

contagem = sum(1 for char in texto if char in vogais)

print(f"Existem {contagem} vogais no texto." if contagem != 1 else "Existe 1 vogal no texto.")
"""