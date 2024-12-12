def calcular_tempo_viagem(distancia_km, velocidade_media_km_h):
    tempo_segundos = (distancia_km / velocidade_media_km_h) * 3600 #conversão de kms andados para segundos restantes
    horas, resto = divmod(tempo_segundos, 3600) #divide a quantidade de segundos restantes pelo equivalente a uma hora e obtem o resto
    """|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    exemplo = divmod(50, 2) #50 divido por 2 dá 25 e o resto é 0
    print(resultado)  # Saída: (25, 0) 
🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓🤓
    exemplo = divmod(17, 4) #17 divido por 4 dá 4,25 porem divmod retorna 4 e resto 1
    print(resultado)  # Saída: (4, 1) 
    ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"""
    minutos, segundos = divmod(resto, 60) #a quantidade de minutos é a divisão do resto da divisão de 1 hora por 60, segundos é o resto do resto

    return int(horas), int(minutos), int(segundos) #retorna 3 valores, para as 3 variaveis

distancia_km = float(input("Distância em quilômetros: ")) #recebe um numero, podendo ser float
velocidade_media_km_h = float(input("Velocidade média em km/h: ")) #recebe um numero, podendo ser float

#atribui o valor de iniciliação de 3 variaveis ao retorno de uma função
horas, minutos, segundos = calcular_tempo_viagem(distancia_km, velocidade_media_km_h)

#retorna resultado
print(f"Tempo estimado de viagem: {int(horas)} horas, {int(minutos)} minutos e {int(segundos)} segundos.")
