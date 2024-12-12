# COMEÇANDO NESSA BAGAÇA
# vou usar flask, fds
from flask import Flask as fl #vou usar FL pra mencionar
from flask import render_template, redirect, request, flash
import json

logged = False
aplicativo = fl(__name__)                       #criando aplicação flask e setando dependências
aplicativo.config['SECRET_KEY'] = 'ROOOTER#@'

# | | | PRECISO CRIAR ROTA PARA /LOGIN QUE CITEI NO LOGIN.HTML (FAZER RESPOSTA PARA O BOTÃO)
# | | para isso primeiro eu crio uma rota vazia '/'
@aplicativo.route('/')
def home():                                                                         #VOLTE PARA ROTA
    return render_template('login.html')
    #redireciona para o login.html que eu defini anteriormente (também possui comandos css)

@aplicativo.route('/admin')   #
def admbypass():               # WHO USING THAT? HEHEHEHEHHEHEHE
    if logged == True:
        return render_template('administrador.html')
    else:
        return redirect('/')             



#-------------Depois basta criar a rota padrão de Login que utilizarei
@aplicativo.route('/login', methods=['POST'])
def login():
    global logged #determina que a variavel "logged" que estou usando é na verdade a variavel global que está fora de todas as funções
    # assim por utilizar ela para criar sistema de login com admin e checkup de processos (verificar usuario logado)

                    #NO LOGIN
    nome = request.form.get('usernameLogin') #Biblioteca request do Flask consegue obter o campo de um formulario --> login.html
    senha = request.form.get('passwordLogin') #Biblioteca request do Flask consegue obter o campo de um formulario --> login.html
#já consigo pegar o nome dos campos print(nome),  print(senha)

    with open('python/fumiko/users.json') as listaDeUsuarios: # abre banco de dados de usuários como lista json
        usuarios = json.load(listaDeUsuarios) #carrega json como lista python
        cont = 0 #contando a lista
        for usuario in usuarios: # para cada item na lista
            cont += 1 #contando indice de leitura

            if nome == 'admin' and senha == 'r00t': # ADMIN BYPASSSSS
                logged = True
                return redirect('/admin') # ADMIN BYPASSSSS
            
            if usuario['nome'] == nome and usuario['senha'] == senha: #checa dicionario por validação de usuário
                print('Gotchu!')
                return render_template('home.html') #retorna sucesso
            elif nome == '' and senha == '': #checa campos vazios
                flash("Preencha todos os campos!")
                return redirect('/')
            elif nome == '' or senha == '': #checa UM campo vazio
                flash("Preencha o campo restante!")
                return redirect('/')
            else: #senão, checa contagem da lista
                if cont >= len(usuarios): #se contagem é igual o número de items, alcançou o fim
                    flash("Usuário inválido!")
                    return redirect('/') #retorna para tela inicial
    

    return redirect('/') #redirecionou para rota vazia (deixo aqui por precaução)
    
@aplicativo.route('/signin', methods=['POST'])
def signin():
    print("Ele tentou se inscrever heeheh")
    
    
    return redirect('/')

@aplicativo.route('/fgtpass', methods=['POST'])
def forgotpassword():
    print("Esqueceu a senha foi?")

    return redirect('/')

@aplicativo.route('/register', methods=['POST'])
def cadastrarUser():
    newuser = [] # novo usuario é lista vazia
    nome = request.form.get('usernameLogin') #pega o nome
    senha = request.form.get('passwordLogin') #pega a senha
    
    newuser = [
        {
            "nome": nome,
            "senha": senha
        }
    ] #já salvei o novo usuario com os seus dados respectivos, hora de gravar ele no usuarios.json
    
    with open('python/fumiko/users.json') as listaJsonDeUsuarios: # abre banco de dados de usuários como lista json
        listaPythonDeUsuarios = json.load(listaJsonDeUsuarios) #carrega json como lista python
    novoUsuario = listaPythonDeUsuarios + newuser # concatenei
    
    with open('python/fumiko/users.json', 'w') as gravandoTMP: # abre banco de dados de usuários como lista json
        json.dump(novoUsuario, gravandoTMP, indent=4)
    
    return redirect('/admin')

    




#-------------ESSE TRECHO DO CÓDIGO É RESPONSAVEL POR INICIALIZAR O PROJETO
#------ELE DEVE SEMPRE FICAR NAS ÚLTIMAS LINHAS DESSA PÁGINA
if __name__ in "__main__":
    aplicativo.run(debug=True)

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
