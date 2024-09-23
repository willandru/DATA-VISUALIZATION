import pandas as pd

# Cargar el archivo CSV
df = pd.read_csv("MEN_EDUCACION.csv")  # Cambia la codificación si es necesario

# Eliminar filas donde TASA_MATRICULACIÓN_5_16 es NaN
df_limpio = df.dropna(subset=['TASA_MATRICULACIÓN_5_16'])

# Tomar 3,000 filas aleatorias
df_muestra = df_limpio.sample(n=3000, random_state=1)  # random_state para reproducibilidad

# Guardar el DataFrame de la muestra en un nuevo archivo CSV (opcional)
df_muestra.to_csv("MEN_EDUCACION_limpio.csv", index=False, encoding='utf-8')

# Mostrar las primeras filas del DataFrame de la muestra
print(df_muestra.head())