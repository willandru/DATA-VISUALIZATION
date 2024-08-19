library(readxl)
sample_superstore_sales <- read_excel("C:/Users/willi/GITHUB/DATA-VISUALIZATION/Semana 5/SAMPLE SUPER STORE - VISUALIZATION/sample_superstore_sales.xlsx",
                                      col_types = c("numeric", "numeric", "date",
                                      "text", "numeric", "numeric", "numeric",
                                      "text", "numeric", "numeric", "numeric",
                                      "text", "text", "numeric", "text","text",
                                      "text", "text", "text", "text","text",
                                      "numeric", "date"))

sample_superstore_sales$Rentabilidad <- (sample_superstore_sales$Profit / sample_superstore_sales$Sales) * 100

central <- sample_superstore_sales[sample_superstore_sales$Region == "Central", ]
east <- sample_superstore_sales[sample_superstore_sales$Region == "East", ]
south <- sample_superstore_sales[sample_superstore_sales$Region == "South", ]
west <- sample_superstore_sales[sample_superstore_sales$Region == "West", ]

# Load necessary libraries
library(ggplot2)
# Crear el diagrama de caja y bigotes de la rentabilidad por subcategoría de producto y región
ggplot(sample_superstore_sales, aes(x = `Product Sub-Category`, y = Rentabilidad, fill = Region)) +
  geom_boxplot() +
  facet_wrap(~ Region) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Diagrama de Caja y Bigotes de Rentabilidad por Subcategoría de Producto y Región",
       x = "Subcategoría de Producto",
       y = "Rentabilidad (%)") +
  scale_fill_discrete(guide = "none")+
  ylim(-800, 100)



# Crear el diagrama de caja y bigotes para Rentabilidad por Order Priority
boxplot(Rentabilidad ~ `Order Priority`, 
        data = sample_superstore_sales, 
        main = "Diagrama de Caja y Bigotes de Rentabilidad por Prioridad de Orden",
        xlab = "Prioridad de Orden",
        ylab = "Rentabilidad (%)",
        col = "lightblue",
        border = "blue",
        las = 2)  # `las = 2` para rotar las etiquetas del eje x si es necesario

# Crear el diagrama de caja y bigotes para Rentabilidad por Product Category
boxplot(Rentabilidad ~ `Product Category`, 
        data = sample_superstore_sales, 
        main = "Diagrama de Caja y Bigotes de Rentabilidad por Categoría de Producto",
        xlab = "Categoría de Producto",
        ylab = "Rentabilidad (%)",
        col = "lightgreen",
        border = "darkgreen",
        las = 2,  # `las = 2` para rotar las etiquetas del eje x si es necesario
        cex.axis = 0.7)  # Ajustar el tamaño del texto del eje x si es necesario

# Calcular la rentabilidad promedio por prioridad de orden
avg_rentabilidad_prioridad <- aggregate(Rentabilidad ~ `Order Priority`, 
                                        data = sample_superstore_sales, 
                                        FUN = mean)
barplot(avg_rentabilidad_prioridad$Rentabilidad,
        names.arg = avg_rentabilidad_prioridad$`Order Priority`,
        main = "Rentabilidad Promedio por Prioridad de Orden",
        xlab = "Prioridad de Orden",
        ylab = "Rentabilidad Promedio (%)",
        col = "lightcoral",
        border = "red",
        las = 2,
        cex.names = 0.7)

# Cargar la librería necesaria
library(ggplot2)

# Crear el diagrama de violín
ggplot(sample_superstore_sales, aes(x = `Order Priority`, y = Rentabilidad, fill = `Order Priority`)) +
  geom_violin() +
  labs(title = "Diagrama de Violín de Rentabilidad por Prioridad de Orden",
       x = "Prioridad de Orden",
       y = "Rentabilidad (%)") +
  theme_minimal() +
  theme(legend.position = "none")  

ggplot(sample_superstore_sales, aes(x = `Order Priority`, y = Rentabilidad, fill = `Order Priority`)) +
  geom_bar(stat = "summary", fun = "mean") +
  labs(title = "Rentabilidad Promedio por Prioridad de Orden",
       x = "Prioridad de Orden",
       y = "Rentabilidad Promedio (%)") +
  theme_minimal() +
  theme(legend.position = "none")  


ggplot(sample_superstore_sales, aes(x = `Product Category`, y = Rentabilidad, fill = `Product Category`)) +
  geom_violin() +
  labs(title = "Diagrama de Violín de Rentabilidad por Categoría de Producto",
       x = "Categoría de Producto",
       y = "Rentabilidad (%)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), # Rotar las etiquetas del eje x
        legend.position = "none")





# Calcular la rentabilidad promedio por categoría de producto
avg_rentabilidad_categoria <- aggregate(Rentabilidad ~ `Product Category`, 
                                        data = sample_superstore_sales, 
                                        FUN = mean)

# Ordenar los datos por rentabilidad promedio
avg_rentabilidad_categoria <- avg_rentabilidad_categoria[order(avg_rentabilidad_categoria$Rentabilidad, decreasing = TRUE), ]

# Crear el diagrama de barras
barplot(avg_rentabilidad_categoria$Rentabilidad,
        names.arg = avg_rentabilidad_categoria$`Product Category`,
        main = "Rentabilidad Promedio por Categoría de Producto",
        xlab = "Categoría de Producto",
        ylab = "Rentabilidad Promedio (%)",
        col = "lightblue",
        border = "blue",
        las = 2, # Rotar las etiquetas del eje x para mejor visibilidad
        cex.names = 0.7) # Ajustar el tamaño de las etiquetas del eje x



# Asegurarse de que la columna 'Order Date' está en formato de fecha
sample_superstore_sales$`Order Date` <- as.Date(sample_superstore_sales$`Order Date`, format = "%m/%d/%Y")

# Agrupar las ventas por fecha y sumar las ventas
ventas_por_fecha <- aggregate(Sales ~ `Order Date`, data = sample_superstore_sales, FUN = sum)

# Crear el gráfico de líneas de la suma de ventas por fecha
ggplot(ventas_por_fecha, aes(x = `Order Date`, y = Sales)) +
  geom_line(color = "blue") +
  labs(title = "Desempeño de Ventas a lo Largo del Tiempo",
       x = "Fecha",
       y = "Suma de Ventas") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rotar 

