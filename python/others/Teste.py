"""from others.AULAS.fumik import Usuarios"""
from CT_LIB import Usuarios

#criei novo controle de usuario
gest = Usuarios()

#criei usuario
gest.create_user("Marcos", 30, "19/07/2006", "marcos@example.com")
gest.create_user("Lucas", 25, "05/07/2008", "lucas@example.com")

#usando essa prrrrrr
print(f"Esses são todos os usuarios que existem: {gest.get_users(True)}")
entrada = input("Qual deles você gostaria de saber a idade? \nDigite M para Marcos e L para Lucas: ").lower().replace(" ", "")

while entrada != "l" and entrada != "m":
  print(f"Entrada é _{entrada}_")
  entrada = input("Qual deles você gostaria de saber a idade? \nDigite M para Marcos e L para Lucas: ").lower().replace(" ", "")

if entrada == "l":
    print(f"Lucas tem {gest.get_age("Lucas")} anos!")
elif entrada == "m":
    print(f"Marcos tem {gest.get_age("Marcos")} anos!")
else:
    print("Fatal error")



