import math #eita preula, o bicho pegou
#nn finalizeiii
def viagensMinimas(capacidadeDacabine, qtdAlunos):
    num_viagens = math.ceil((qtdAlunos - 1) / capacidadeDacabine) #mathceil arredonda o valor para o inteiro maior mais proximo
    return num_viagens

capacidadeDacabine = int(input("Capacidade da cabine do teleférico: "))
qtdAlunos = int(input("Número total de alunos: "))

min_viagens = viagensMinimas(capacidadeDacabine, qtdAlunos)

#verificar se o número é multiplo de nois, 2, 4, 6, 8, etc...
if min_viagens == 2:
    min_viagens = min_viagens + 1

# Saída
print(f"Número mínimo de viagens: {min_viagens}")
