#"""
def decomporIsso(numero): #enquanto numero for maior maior se for numero
    try:
        if int(numero) < 1000:
            c = int(numero) // 100; d = (int(numero) % 100) // 10; u = int(numero) % 10; centena = f"{c} centena" if c == 1 else f"{c} centenas"; dezena = f"{d} dezena" if d == 1 else f"{d} dezenas"; unidade = f"{u} unidade" if u == 1 else f"{u} unidades"; print(f"{centena}, {dezena} e {unidade}.") #result
    except: numero = input("Digite um número menor que 1000: ").replace(" ",""); decomporIsso(numero) if numero.isnumeric() else print("Por favor insira um número válido!")
while True: 
    numero = input("Digite um número menor que 1000: ").replace(" ",""); decomporIsso(numero) if numero.isnumeric() else print("Por favor insira um número válido!")
    


# --------------------------- ☝️🤓

# BACKUP DO CÓDIGO RAIZ
"""
FIX LATERRRRRRRR
def decomporEssaMerda(numero):
    while (int(numero) >=1000 if numero.isnumeric() else False): numero = input("Por favor, insira um número menor que 1000. ").replace(" ",""); c, d, u = int(numero) // 100, (int(numero) % 100) // 10, int(numero) % 10 if numero.isnumeric() else None; centena, dezena, unidade = f"{c} centena" if c == 1 else f"{c} centenas", f"{d} dezena" if d == 1 else f"{d} dezenas", f"{u} unidade" if u == 1 else f"{u} unidades"; print(f"{centena}, {dezena} e {unidade}.")
while True: 
    numero = input("Digite um número inteiro menor que 1000: ").replace(" ",""); decomporEssaMerda(numero) if numero.isnumeric() else print("Por favor, insira um número menor que 1000.")

# -------------------------- ☝️🤓"""

