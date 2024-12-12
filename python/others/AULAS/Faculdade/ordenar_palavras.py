
frase = input("Insira uma frase: "); palavras = frase.split(); palavras.sort(); print("Palavras ordenadas: ")
for i in range(len(palavras)): print(palavras[i], end='  ' if i % 3 != 0 else '\n') 
