class Usuarios:
    def __init__(self):
        self.usuarios = {}

    def create_user(self, nome, age, birthdate, email):
        self.usuarios[nome] = {"age": age, "birthdate": birthdate, "email": email}

    def set_atributo(self, nome, atributo, novo_valor):
        if nome in self.usuarios:
            self.usuarios[nome][atributo] = novo_valor
        else:
            print("Usuário não encontrado.")

    def del_user(self, nome):
        if nome in self.usuarios:
            del self.usuarios[nome]
            print(f"Usuário {nome} deletado com sucesso.")
        else:
            print("Usuário não encontrado.")

    def set_age(self, nome, nova_idade):
        self.set_atributo(nome, "age", nova_idade)

    def set_birthdate(self, nome, nova_data_nascimento):
        self.set_atributo(nome, "birthdate", nova_data_nascimento)

    def set_email(self, nome, novo_email):
        self.set_atributo(nome, "email", novo_email)

    def get_age(self, nome):
        return self.usuarios[nome]["age"]

    def get_birthdate(self, nome):
        return self.usuarios[nome]["birthdate"]

    def get_email(self, nome):
        return self.usuarios[nome]["email"]
    
    def get_users(self, string = False):
        if string == True:
            formatedUsers = ", ".join(list(self.usuarios.keys()))
            return formatedUsers
        else:
            return list(self.usuarios.keys())

