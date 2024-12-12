"""Escreva um programa Python que solicite ao usuário um número inteiro positivo e calcule o fatorial desse número. O fatorial de um número"""
import math #eita caraio
while True:
    def loopi(eitaPrr):
        print(eitaPrr) if eitaPrr != "" else None
        for i in range(10):
            numero = input(f"Insira o {i+1}º número: ")
            fatorial_numero = math.factorial(int(numero)) if numero.isnumeric() else loopi(eitaPrr="Insira um número inteiro válido!")
            print(f"O fatorial do {i+1}º número ({numero}) é {fatorial_numero}")
    loopi(eitaPrr="")
