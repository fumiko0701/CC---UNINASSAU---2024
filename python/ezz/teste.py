
while True:
    numero = input("Insira um número inteiro!\n")
    def callone(numero):
        contagem = 0
        if numero.isdigit():
            print(f"----------------------------------\nO digito '{numero}' foi o número escolhido")
            print(f"{numero} é par") if(int(numero) % 2) == 0 else print(f"{numero} é impar")     
            for i in range(int(numero) + 1):

                if (i % 2 == 0) & (i != 0):
                    if contagem == 0:
                        print("[ ", end="")
                    contagem += i
                    fim = f"{', ' if i < int(numero) else '. ]' if i == int(numero) else None}"
                    print(i, end=fim)
                if i == int(numero):
                    print(f" -- A soma de todos os elementos é: _{contagem}_")
                    exq = input("Continuar operação?\n Digite (Y) para sim ou (N) para não.")
                    if exq.lower() == "y": callone(input("Insira outro número inteiro!\n"))
                    else:
                        break

        elif numero in ("E", "e", "exit", "leave", "end", "quit"):
            print("Encerrando o programa..."); return None
        else:
            numero = print("Insira apenas números inteiros!\n"); callone(numero) #recursão
        
    callone(numero)
    break
