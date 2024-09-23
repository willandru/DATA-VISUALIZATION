import pandas as pd

# Leer los archivos
archivos = [
    "SBPro_2020.txt",
    "SBPro_2021.txt",
    "SBPro_2022-1.txt",
    "SBPro_2022-2.txt",
    "SBPro_20231.txt"
]

# Lista para almacenar los DataFrames de cada archivo
dataframes = []

# Leer 1000 filas de cada archivo y agregarlas a la lista
for archivo in archivos:
    df = pd.read_csv(archivo, delimiter='¬', encoding='utf-8', nrows=1000)
    dataframes.append(df)

# Unir los DataFrames sin eliminar columnas
df_consolidado = pd.concat(dataframes, ignore_index=True)

# CLEANINIG

# Contar los valores en cada columna y contar los NaNs
conteo_valores = df_consolidado.count()
conteo_nans = df_consolidado.isna().sum()

columnas_a_conservar = conteo_nans[conteo_nans <= 100].index

# Crear un nuevo DataFrame sin las columnas con más de 100 NaNs
df_limpio = df_consolidado[columnas_a_conservar]

# Guardar el DataFrame limpio en un archivo .txt
df_limpio.to_csv("SBPro-clean.txt", sep='¬', index=False, encoding='utf-8')

# Mostrar el DataFrame limpio (opcional)
print(df_limpio.head())
