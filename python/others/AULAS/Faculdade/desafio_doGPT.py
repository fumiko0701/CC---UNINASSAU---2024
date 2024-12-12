while(True):
    entrada = input("Digite uma lista de números separados por vírgula: ");
    try: 
        numeros = [int(x.strip()) for x in entrada.split(',')]; soma = sum(numero for numero in numeros if numero % 2 == 0); print(f"A soma dos números pares na lista é: {soma}")
    except: None
#// ESSE CÓDIGO FAZ EU DIGITAR UMA LISTA DE NÚMEROS, CHECA OS PARES E DIZ A SOMA DOS PARES

