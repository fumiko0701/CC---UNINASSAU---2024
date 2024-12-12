def decomporEssaMerda(numero):
    while (int(numero) >=1000 if numero.isnumeric() else True): #enquanto numero for maior que 1000 ou valor não for um numero
        numero = input("Por favor, insira um número menor que 1000. ") #pedir outro input para um número válido
    numero = int(numero) #transforma definitivamente a string numero para int numero
    c, d, u = numero // 100, (numero % 100) // 10, numero % 10 #MATEMATICA PARA OBTER A QUANTIDADE DE C, D, U
    centena = f"{c} centena" if c == 1 else f"{c} centenas" #CORRIGE O PLURAL DE CENTENA
    dezena = f"{d} dezena" if d == 1 else f"{d} dezenas" #CORRIGE O PLURAL DE DEZENA
    unidade = f"{u} unidade" if u == 1 else f"{u} unidades" #CORRIGE O PLURAL DE UNIDADE
    print(f"{centena}, {dezena} e {unidade}.") # PRINTA RESULTADO
while True:
    numero = input("Digite um número inteiro menor que 1000: ") #primeira tentativa, obtendo entrada
    # 👇👇👇👇 chama a função de decompor se o numero for decimal, senão, pede um novo input e o sistema reinicia.
    decomporEssaMerda(numero) if numero.isnumeric() else print("Por favor, insira um número menor que 1000.")
"""||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"""