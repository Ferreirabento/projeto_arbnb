import pandas as pd
import matplotlib.pyplot as plt

# Ler os dados do arquivo CSV
dados = pd.read_csv('c:\\Users\\joaob\\Desktop\\project_arbnb\\data\\dataset.csv', sep=';')

# Criar gráfico de barras para mostrar a diferença de preço entre as vizinhanças
plt.figure(figsize=(12, 6))
plt.bar(dados['visinhanca'], dados['preco'], color='skyblue')
plt.title('Diferença de Preço entre Vizinhanças')
plt.xlabel('Vizinhança')
plt.ylabel('Preço Médio')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()