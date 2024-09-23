import pandas as pd

# Lista con los nombres de los archivos
archivos = [
    'SB11_20201.txt',
    'SB11_20202.txt',
    'SB11_20211.txt',
    'SB11_20212.txt',
    'SB11_20221.TXT',
    'SB11_20222.TXT',
    'SB11_20231.TXT',
    'SB11_20232.TXT'
]

# Lista para almacenar los DataFrames de cada archivo
dataframes = []

# Leer 1000 filas de cada archivo y agregarlas a la lista
for archivo in archivos:
    df = pd.read_csv(archivo, delimiter='¬', encoding='utf-8', nrows=1000)
    dataframes.append(df)

# Lista de columnas a eliminar
columnas_a_eliminar = {
    'ESTU_GENERACION-E', 'ESTU_NSE_INDIVIDUAL', 'ESTU_GENERACION', 
    'ESTU_TINEETNIA', 'ESTU_NSE_ESTABLECIMIENTO', 'SEED_CODIGOMEN', 
    'ESTU_INSE_INDIVIDUAL', 'PERCENTIL_ESPECIAL_GLOBAL', 
    'ESTU_PRESENTACIONSABADO', 'SEED_NOMBRE', 'ESTU_LENGUANATIVA', 
    'ESTU_AGREGADO'
}

# Tomar aleatoriamente 2000 filas de cada DataFrame y concatenar
dataframes_muestrados = []
for df in dataframes:
    df_muestrado = df.sample(n=1000, random_state=1)  # Ajusta el random_state si necesitas diferentes resultados
    dataframes_muestrados.append(df_muestrado)

# Concatenar todos los DataFrames muestreados en uno solo
df_combined = pd.concat(dataframes_muestrados, ignore_index=True)


#CLEANING

# Eliminar columnas no deseadas
df_combined.drop(columns=columnas_a_eliminar, errors='ignore', inplace=True)

df_combined = df_combined.dropna(subset=['ESTU_DEPTO_RESIDE', 'FAMI_ESTRATOVIVIENDA'])


df_combined['COLE_NOMBRE_SEDE'] = df_combined['COLE_NOMBRE_SEDE'].str.strip()
df_combined['COLE_NOMBRE_ESTABLECIMIENTO'] = df_combined['COLE_NOMBRE_ESTABLECIMIENTO'].str.strip()


# Guardar el DataFrame combinado en un archivo .txt
df_combined.to_csv('SB11-clean.txt', sep='¬', index=False, encoding='utf-8')

# Mostrar las primeras filas del DataFrame combinado
print(df_combined.head())
