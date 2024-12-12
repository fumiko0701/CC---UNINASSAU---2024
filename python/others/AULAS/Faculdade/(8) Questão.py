while True:
    #entrada dos numerossss
    numero1 = float(input("Digite o primeiro número: "))
    numero2 = float(input("Digite o segundo número: "))

    #os originais
    print(f"Primeiro número: {numero1}")
    print(f"Segundo número: {numero2}")

    #troca 2 por 1 e 1 por 2
    numero1, numero2 = numero2, numero1

    #resultado
    print("\n-----Números trocados:-----")
    print(f"Primeiro número: {numero1}")
    print(f"Segundo número: {numero2}")
