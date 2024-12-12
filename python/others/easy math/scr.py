#                   Easy loop - math (Python matemática por Fumiko)
def lendo():
    with open("procedure.txt", "r") as arquivo:
        procedure = arquivo.read()
    print(procedure)
    if procedure == "Y" or procedure == "N":
        print("# Método de equação encontrado! Continuando . . .")
        return procedure
    else:
        print("Criando método de cálculo!")
        procedure = input("Insira Y para o método: \nNúmero +\nOperador +\nNúmero\n Ou insira N para o método: \n1 + 1")
        with open("procedure.txt", "w") as salvando:
            salvando.write(procedure)
        return procedure

while (1==1): #     MANTÉM A MATEMÁTICA RODANDO
    def __init__():
        valor = lendo()
        if valor == "Y":
            a = int(input("Digite o 1º valor númerico"))
            b = input("Digite o operador matemático")
            c = int(input("Digite o 2º valor númerico"))
            print(myMath1(a,b,c))
        else:
            expressao = input("Insira sua expressão matemática!")
            if "+" in expressao:
                 c = int(expressao[expressao.find("+")+1:])
                 a = int(expressao[:expressao.find("+")])
                 print(a + c)
            elif "-" in expressao:
                 c = int(expressao[expressao.find("-")+1:])
                 a = int(expressao[:expressao.find("-")])
                 print(a - c)
            elif "/" in expressao:
                 c = int(expressao[expressao.find("/")+1:])
                 a = int(expressao[:expressao.find("/")])
                 print(a / c)
            elif "*" in expressao:
                 c = int(expressao[expressao.find("*")+1:])
                 a = int(expressao[:expressao.find("*")])
                 print(a * c)
            else:
                 print("FATAL ERROR")
        def myMath1 (a, b, c):
            if b == "+":
                    return (a+c)
            elif b == "-":
                    return (a-c)
            elif b == "/":
                    return (a/c)
            elif b == "*":
                    return (a*c)
            else:
                return "Fatal Error"  
    __init__()
