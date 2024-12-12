import tkinter as tk
from tkinter import ttk, messagebox
import json

class Funcionario:
    def __init__(self, nome, cargo, data_nascimento, email, data_admissao, cpf, municipio_logradouro):
        self.nome = nome
        self.cargo = cargo
        self.data_nascimento = data_nascimento
        self.email = email
        self.data_admissao = data_admissao
        self.cpf = cpf
        self.municipio_logradouro = municipio_logradouro
        self.documentos = []  # Lista para armazenar os documentos do funcionário

class IncluirColaborador(tk.Toplevel):
    def __init__(self, parent):
        super().__init__(parent)
        self.title("Incluir Colaborador")

        self.configure(bg="#f0f0f0")

        self.frame = tk.Frame(self, bg="#f0f0f0")
        self.frame.pack(padx=20, pady=20)

        self.label_nome = tk.Label(self.frame, text="Nome:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_nome.grid(row=0, column=0, padx=10, pady=5, sticky=tk.E)
        self.entry_nome = tk.Entry(self.frame, bg="#fff", fg="#333", font=("Arial", 12))
        self.entry_nome.grid(row=0, column=1, padx=10, pady=5)

        self.label_cargo = tk.Label(self.frame, text="Cargo:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_cargo.grid(row=1, column=0, padx=10, pady=5, sticky=tk.E)
        self.entry_cargo = tk.Entry(self.frame, bg="#fff", fg="#333", font=("Arial", 12))
        self.entry_cargo.grid(row=1, column=1, padx=10, pady=5)

        self.label_data_nascimento = tk.Label(self.frame, text="Data de Nascimento:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_data_nascimento.grid(row=2, column=0, padx=10, pady=5, sticky=tk.E)
        self.entry_data_nascimento = tk.Entry(self.frame, bg="#fff", fg="#333", font=("Arial", 12))
        self.entry_data_nascimento.grid(row=2, column=1, padx=10, pady=5)

        self.label_email = tk.Label(self.frame, text="E-mail:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_email.grid(row=3, column=0, padx=10, pady=5, sticky=tk.E)
        self.entry_email = tk.Entry(self.frame, bg="#fff", fg="#333", font=("Arial", 12))
        self.entry_email.grid(row=3, column=1, padx=10, pady=5)

        self.label_data_admissao = tk.Label(self.frame, text="Data de Admissão:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_data_admissao.grid(row=4, column=0, padx=10, pady=5, sticky=tk.E)
        self.entry_data_admissao = tk.Entry(self.frame, bg="#fff", fg="#333", font=("Arial", 12))
        self.entry_data_admissao.grid(row=4, column=1, padx=10, pady=5)

        self.label_cpf = tk.Label(self.frame, text="CPF:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_cpf.grid(row=5, column=0, padx=10, pady=5, sticky=tk.E)
        self.entry_cpf = tk.Entry(self.frame, bg="#fff", fg="#333", font=("Arial", 12))
        self.entry_cpf.grid(row=5, column=1, padx=10, pady=5)

        self.label_municipio_logradouro = tk.Label(self.frame, text="Município/Logradouro:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_municipio_logradouro.grid(row=6, column=0, padx=10, pady=5, sticky=tk.E)
        self.entry_municipio_logradouro = tk.Entry(self.frame, bg="#fff", fg="#333", font=("Arial", 12))
        self.entry_municipio_logradouro.grid(row=6, column=1, padx=10, pady=5)

        self.button_incluir = tk.Button(self.frame, text="Incluir", command=self.incluir, bg="#4caf50", fg="#fff", font=("Arial", 12, "bold"), relief=tk.FLAT)
        self.button_incluir.grid(row=7, column=0, columnspan=2, padx=10, pady=10, sticky="we")

    def incluir(self):
        nome = self.entry_nome.get().strip()
        cargo = self.entry_cargo.get().strip()
        data_nascimento = self.entry_data_nascimento.get().strip()
        email = self.entry_email.get().strip()
        data_admissao = self.entry_data_admissao.get().strip()
        cpf = self.entry_cpf.get().strip()
        municipio_logradouro = self.entry_municipio_logradouro.get().strip()

        if nome and cargo and data_nascimento and email and data_admissao and cpf and municipio_logradouro:
            funcionario = Funcionario(nome, cargo, data_nascimento, email, data_admissao, cpf, municipio_logradouro)
            app.funcionarios.append(funcionario)
            app.atualizar_tabela()
            app.salvar_funcionarios()
            messagebox.showinfo("Sucesso", "Funcionário cadastrado com sucesso!")
            self.destroy()
        else:
            messagebox.showerror("Erro", "Por favor, preencha todos os campos.")

class DetalhesFuncionario(tk.Toplevel):
    def __init__(self, parent, funcionario):
        super().__init__(parent)
        self.title("Detalhes do Funcionário")
        self.funcionario = funcionario

        self.configure(bg="#f0f0f0")

        self.frame_detalhes = tk.Frame(self, padx=20, pady=20, bg="#f0f0f0")
        self.frame_detalhes.pack(padx=10, pady=10, fill=tk.BOTH, expand=True)

        self.label_nome = tk.Label(self.frame_detalhes, text="Nome:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_nome.grid(row=0, column=0, padx=10, pady=5, sticky=tk.E)
        self.label_nome_info = tk.Label(self.frame_detalhes, text=funcionario.nome, bg="#f0f0f0", fg="#333", font=("Arial", 12))
        self.label_nome_info.grid(row=0, column=1, padx=10, pady=5, sticky=tk.W)

        self.label_cargo = tk.Label(self.frame_detalhes, text="Cargo:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_cargo.grid(row=1, column=0, padx=10, pady=5, sticky=tk.E)
        self.label_cargo_info = tk.Label(self.frame_detalhes, text=funcionario.cargo, bg="#f0f0f0", fg="#333", font=("Arial", 12))
        self.label_cargo_info.grid(row=1, column=1, padx=10, pady=5, sticky=tk.W)

        self.label_data_nascimento = tk.Label(self.frame_detalhes, text="Data de Nascimento:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_data_nascimento.grid(row=2, column=0, padx=10, pady=5, sticky=tk.E)
        self.label_data_nascimento_info = tk.Label(self.frame_detalhes, text=funcionario.data_nascimento, bg="#f0f0f0", fg="#333", font=("Arial", 12))
        self.label_data_nascimento_info.grid(row=2, column=1, padx=10, pady=5, sticky=tk.W)

        self.label_email = tk.Label(self.frame_detalhes, text="E-mail:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_email.grid(row=3, column=0, padx=10, pady=5, sticky=tk.E)
        self.label_email_info = tk.Label(self.frame_detalhes, text=funcionario.email, bg="#f0f0f0", fg="#333", font=("Arial", 12))
        self.label_email_info.grid(row=3, column=1, padx=10, pady=5, sticky=tk.W)

        self.label_data_admissao = tk.Label(self.frame_detalhes, text="Data de Admissão:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_data_admissao.grid(row=4, column=0, padx=10, pady=5, sticky=tk.E)
        self.label_data_admissao_info = tk.Label(self.frame_detalhes, text=funcionario.data_admissao, bg="#f0f0f0", fg="#333", font=("Arial", 12))
        self.label_data_admissao_info.grid(row=4, column=1, padx=10, pady=5, sticky=tk.W)

        self.label_cpf = tk.Label(self.frame_detalhes, text="CPF:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_cpf.grid(row=5, column=0, padx=10, pady=5, sticky=tk.E)
        self.label_cpf_info = tk.Label(self.frame_detalhes, text=funcionario.cpf, bg="#f0f0f0", fg="#333", font=("Arial", 12))
        self.label_cpf_info.grid(row=5, column=1, padx=10, pady=5, sticky=tk.W)

        self.label_municipio_logradouro = tk.Label(self.frame_detalhes, text="Município/Logradouro:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_municipio_logradouro.grid(row=6, column=0, padx=10, pady=5, sticky=tk.E)
        self.label_municipio_logradouro_info = tk.Label(self.frame_detalhes, text=funcionario.municipio_logradouro, bg="#f0f0f0", fg="#333", font=("Arial", 12))
        self.label_municipio_logradouro_info.grid(row=6, column=1, padx=10, pady=5, sticky=tk.W)

        self.button_incluir_documento = tk.Button(self.frame_detalhes, text="Incluir Documento", command=self.incluir_documento, bg="#4caf50", fg="#fff", font=("Arial", 12, "bold"), relief=tk.FLAT)
        self.button_incluir_documento.grid(row=7, column=0, columnspan=2, padx=10, pady=10, sticky="we")

        self.frame_tipos_dados = tk.Frame(self, padx=20, pady=20, bg="#f0f0f0")
        self.frame_tipos_dados.pack(padx=10, pady=10, fill=tk.BOTH, expand=True)

        self.label_tipos_dados = tk.Label(self.frame_tipos_dados, text="Documentos do Funcionário", bg="#f0f0f0", fg="#333", font=("Arial", 14, "bold"))
        self.label_tipos_dados.pack(padx=10, pady=5)

        self.tree_tipos_dados = ttk.Treeview(self.frame_tipos_dados, columns=("Tipo", "Abertura", "Validade", "Status"), show="headings")
        self.tree_tipos_dados.heading("Tipo", text="Tipo")
        self.tree_tipos_dados.heading("Abertura", text="Abertura")
        self.tree_tipos_dados.heading("Validade", text="Validade")
        self.tree_tipos_dados.heading("Status", text="Status")
        self.tree_tipos_dados.pack(fill=tk.BOTH, expand=True)

        self.carregar_tipos_dados(funcionario)

    def incluir_documento(self):
        IncluirDocumento(self, self.funcionario)

    def carregar_tipos_dados(self, funcionario):
        # Limpa a tabela antes de carregar os dados
        for item in self.tree_tipos_dados.get_children():
            self.tree_tipos_dados.delete(item)

        # Adiciona os documentos do funcionário na tabela
        for documento in funcionario.documentos:
            self.tree_tipos_dados.insert("", tk.END, values=documento)

class IncluirDocumento(tk.Toplevel):
    def __init__(self, parent, funcionario):
        super().__init__(parent)
        self.title("Incluir Documento")
        self.funcionario = funcionario

        self.configure(bg="#f0f0f0")

        self.frame = tk.Frame(self, bg="#f0f0f0")
        self.frame.pack(padx=20, pady=20)

        self.label_tipo = tk.Label(self.frame, text="Tipo de Documento:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_tipo.grid(row=0, column=0, padx=10, pady=5, sticky=tk.E)
        self.entry_tipo = ttk.Combobox(self.frame, values=["ASO", "Certificado", "Integração", "KDM", "DEP", "Outros"])
        self.entry_tipo.grid(row=0, column=1, padx=10, pady=5)
        self.entry_tipo.bind("<<ComboboxSelected>>", self.on_tipo_selected)

        self.label_abertura = tk.Label(self.frame, text="Data de Abertura:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_abertura.grid(row=1, column=0, padx=10, pady=5, sticky=tk.E)
        self.entry_abertura = tk.Entry(self.frame, bg="#fff", fg="#333", font=("Arial", 12))
        self.entry_abertura.grid(row=1, column=1, padx=10, pady=5)

        self.label_validade = tk.Label(self.frame, text="Data de Validade:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_validade.grid(row=2, column=0, padx=10, pady=5, sticky=tk.E)
        self.entry_validade = tk.Entry(self.frame, bg="#fff", fg="#333", font=("Arial", 12))
        self.entry_validade.grid(row=2, column=1, padx=10, pady=5)

        self.label_status = tk.Label(self.frame, text="Status:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.label_status.grid(row=3, column=0, padx=10, pady=5, sticky=tk.E)
        self.entry_status = ttk.Combobox(self.frame, values=["Finalizado", "Vencido", "Em Andamento", "OK"])
        self.entry_status.grid(row=3, column=1, padx=10, pady=5)

        self.label_certificado = tk.Label(self.frame, text="Certificado:", bg="#f0f0f0", fg="#333", font=("Arial", 12, "bold"))
        self.entry_certificado = tk.Entry(self.frame, bg="#fff", fg="#333", font=("Arial", 12))
        self.label_certificado.grid(row=4, column=0, padx=10, pady=5, sticky=tk.E)
        self.entry_certificado.grid(row=4, column=1, padx=10, pady=5)

        self.button_incluir = tk.Button(self.frame, text="Incluir", command=self.incluir, bg="#4caf50", fg="#fff", font=("Arial", 12, "bold"), relief=tk.FLAT)
        self.button_incluir.grid(row=5, column=0, columnspan=2, padx=10, pady=10, sticky="we")

    def incluir(self):
        tipo = self.entry_tipo.get()
        abertura = self.entry_abertura.get().strip()
        validade = self.entry_validade.get().strip()
        status = self.entry_status.get()
        certificado = self.entry_certificado.get().strip() if tipo == "Certificado" else ""

        if tipo and abertura and validade and status:
            if tipo == "Certificado":
                tipo = f"{tipo} {certificado}"
            documento = (tipo, abertura, validade, status)
            self.funcionario.documentos.append(documento)
            messagebox.showinfo("Sucesso", "Documento incluído com sucesso!")
            self.destroy()
        else:
            messagebox.showerror("Erro", "Por favor, preencha todos os campos.")

    def on_tipo_selected(self, event):
        tipo = self.entry_tipo.get()
        if tipo == "Certificado":
            self.label_certificado.grid(row=4, column=0, padx=10, pady=5)
            self.entry_certificado.grid(row=4, column=1, padx=10, pady=5)
        else:
            self.label_certificado.grid_forget()
            self.entry_certificado.grid_forget()

class AplicativoFuncionarios:
    def __init__(self, janela):
        self.janela = janela
        self.janela.title("Cadastro e Gestão de Funcionários")
        self.janela.geometry("800x600")

        self.frame_principal = tk.Frame(janela, padx=20, pady=20, bg="#f0f0f0")
        self.frame_principal.pack(padx=10, pady=10, fill=tk.BOTH, expand=True)

        self.button_incluir = tk.Button(self.frame_principal, text="Incluir Funcionário", command=self.mostrar_formulario, bg="#2196f3", fg="#fff", font=("Arial", 12, "bold"), relief=tk.FLAT)
        self.button_incluir.grid(row=0, column=0, padx=10, pady=10, sticky=tk.W)

        self.tree = ttk.Treeview(self.frame_principal, columns=("Nome", "Cargo", "Data de Nascimento", "E-mail", "Data de Admissão", "CPF", "Município/Logradouro"), show="headings")
        self.tree.heading("Nome", text="Nome")
        self.tree.heading("Cargo", text="Cargo")
        self.tree.heading("Data de Nascimento", text="Data de Nascimento")
        self.tree.heading("E-mail", text="E-mail")
        self.tree.heading("Data de Admissão", text="Data de Admissão")
        self.tree.heading("CPF", text="CPF")
        self.tree.heading("Município/Logradouro", text="Município/Logradouro")
        self.tree.grid(row=1, column=0, padx=10, pady=10, sticky="nsew")

        self.scrollbar_vertical = ttk.Scrollbar(self.frame_principal, orient="vertical", command=self.tree.yview)
        self.scrollbar_vertical.grid(row=1, column=1, sticky="ns")
        self.tree.configure(yscrollcommand=self.scrollbar_vertical.set)

        self.funcionarios = self.carregar_funcionarios()
        self.atualizar_tabela()
        self.tree.bind("<Double-1>", self.abrir_detalhes_funcionario)

    def mostrar_formulario(self):
        IncluirColaborador(self.janela)

    def carregar_funcionarios(self):
        try:
            with open("funcionarios.json", "r") as arquivo:
                dados = json.load(arquivo)
                funcionarios = [Funcionario(funcionario["nome"], funcionario["cargo"], funcionario["data_nascimento"], funcionario["email"], funcionario["data_admissao"], funcionario["cpf"], funcionario["municipio_logradouro"]) for funcionario in dados]
                return funcionarios
        except FileNotFoundError:
            return []

    def atualizar_tabela(self):
        for i in self.tree.get_children():
            self.tree.delete(i)

        for funcionario in self.funcionarios:
            self.tree.insert("", tk.END, values=(funcionario.nome, funcionario.cargo, funcionario.data_nascimento, funcionario.email, funcionario.data_admissao, funcionario.cpf, funcionario.municipio_logradouro))

    def salvar_funcionarios(self):
        dados = []
        for funcionario in self.funcionarios:
            dados.append(vars(funcionario))
        with open("funcionarios.json", "w") as arquivo:
            json.dump(dados, arquivo, indent=6)

    def abrir_detalhes_funcionario(self, event):
        item_selecionado = self.tree.selection()[0]
        nome_funcionario = self.tree.item(item_selecionado, "values")[0]
        for funcionario in self.funcionarios:
            if funcionario.nome == nome_funcionario:
                detalhes_window = DetalhesFuncionario(self.janela, funcionario)
                break

if __name__ == "__main__":
    root = tk.Tk()
    app = AplicativoFuncionarios(root)
    root.mainloop()
