from dateutil.parser import parse

def data_por_extenso(data):
    try: #tenta retornar um valor baseado em função externa
        return parse(data).strftime('%d de %B de %Y')
    except ValueError: #já esperava que isso acontecesse...
        return "Formato de data inválido. Use o formato dia/mês/ano (ex: 25/12/2023)."

def main(): #inicia a bagaça toda
    data = input("Digite a data no formato (dia/mês/ano): ")
    textoEmIngles = (f"A data por extenso é: {data_por_extenso(data)}" if not("inválido" in data_por_extenso(data)) else data_por_extenso(data))

    textoEmIngles = textoEmIngles.replace("January", "Janeiro"); textoEmIngles = textoEmIngles.replace("February", "Fevereiro"); textoEmIngles = textoEmIngles.replace("March", "Março"); textoEmIngles = textoEmIngles.replace("April", "Abril"); textoEmIngles = textoEmIngles.replace("May", "Maio");textoEmIngles = textoEmIngles.replace("June", "Junho");textoEmIngles = textoEmIngles.replace("July", "Julho");textoEmIngles = textoEmIngles.replace("August", "Agosto");textoEmIngles = textoEmIngles.replace("September", "Setembro");textoEmIngles = textoEmIngles.replace("October", "Outubro"); textoEmIngles = textoEmIngles.replace("November", "Novembro"); textoEmIngles = textoEmIngles.replace("December", "Dezembro")
    print(textoEmIngles)

if __name__ == "__main__":
    while True: main()

