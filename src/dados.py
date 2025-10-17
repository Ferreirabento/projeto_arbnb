import pandas as pd
import mysql.connector
import matplotlib.pyplot as plt  # Corrigido aqui
import seaborn as sns


tabela = dict()

try:
    coneccao = mysql.connector.connect(
        user="rute",
        password="pass",
        host="localhost",  
        port=1234,         
        database="projeto_airbnb"
        )
    cursor = coneccao.cursor()
    print("Conexão bem-sucedida!")
except mysql.connector.Error as err:
    print(f"Erro na conexão: {err}")

try:    
    query_distinct = "SELECT DISTINCT neighbourhood FROM listings;"
    cursor.execute(query_distinct)
    resultado = cursor.fetchall()
    lugar = []
    for linha in resultado:
        for dis in linha:
            lugar.append(dis)
    #print(lugar)
except mysql.connector.Error as err:
    print(f"Erro na consulta: {err}")

try:
    media = []
    for area in lugar:
        query_avg = f"SELECT AVG(price) FROM listings WHERE neighbourhood = '{area}';"
        cursor.execute(query_avg)
        resultado = cursor.fetchall()
        for linha in resultado:
            for med in linha:
                media.append(med)
except mysql.connector.Error as err:
    print(f"Erro na consulta: {err}")

tabela['visinhança'] = lugar
tabela['preço_médio'] = media
df = pd.DataFrame(tabela)
print(df.head())

# Visualização com Seaborn
plt.figure(figsize=(10, 6))
sns.barplot(x='preço_médio', y='visinhança', data=df)
plt.title('Preço Médio por Vizinhança')
plt.xlabel('Preço Médio')
plt.ylabel('Vizinhança')
plt.show()

#até agora indentifiquei um mudança na média de preço por vizinhança, o próximo passo é identificar o porquê dessas mudanças