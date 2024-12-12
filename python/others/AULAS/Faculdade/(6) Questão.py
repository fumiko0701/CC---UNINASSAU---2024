
# DOIS NUMEROS INTEIROS POSITIVOS

# FAZER MAXIMO DIVISOR COMUM ENTRE ELES

# MOSTRAR

numeroUm = float(input("Insira o número um: "))
numeroDois = float(input("Insira o número dois: "))


def teste():
    """
    COMENTARIO DAORA
    DE VARIAS
    LINHAS

    HUEHUEUUEH

    UAU ESTOU COMENTANDO MUITO

    HAHAHAHAHAH
    """
    return 1+1



from datetime import *








def SLA():
    global numeroDois
    global numeroUm
    while numeroDois != 0:
        numeroUm, numeroDois = numeroDois, numeroUm % numeroDois
    return numeroUm
    
print(SLA())

