idades = [int(input(f"Digite a idade da pessoa {i+1}: ")) for i in range(int(input("Digite o número de pessoas: ")))]
media = sum(idades) / len(idades)
print("Média de jovens" if media < 20 else "Média de adultos" if 20 <= media <= 40 else "Média de idosos")

# corte rápido, tramontina.
