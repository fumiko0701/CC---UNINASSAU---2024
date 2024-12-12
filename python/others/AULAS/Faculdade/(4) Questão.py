def trianguloRetan(lados):
    lados.sort() #põe os valores em ordem crescente
    #       cateto ao quadrado + cateto ao quadrado = hipotenusa ao quadrado
    return lados[0]**2 + lados[1]**2 == lados[2]**2 #retorna um calculo do teorema de pitagoras
                #☝️    caso seja verdadeiro o triangulo é retangulo
def main():
    #cria lista "lados" e determina que ela receberá 3 inputs no laço for através do index 1
    lados = [float(input(f"Digite o valor do {i+1}º lado: ")) for i in range(3)]
    if trianguloRetan(lados): #se for verdade
        print("Os lados informados formam um triângulo retângulo.")
    else:
        print("Os lados informados NÃO formam um triângulo retângulo.")

if __name__ == "__main__": #puxa o main, hehehe <3
    main()

