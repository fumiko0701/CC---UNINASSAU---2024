"""Escreva um programa Python que verifique se uma palavra inserida pelo usuário é um palíndromo."""
texto = input("Digite uma palavra: ").replace(" ", "").lower() # Remover espaços em branco e converter para minúsculas
print("A palavra é um palíndromo!") if all(texto[i] == texto[-i - 1] for i in range(len(texto) // 2)) else print("A palavra não é um palíndromo.")
# Verifica se toda a expressão é correta e válida, usando all(for i.)

