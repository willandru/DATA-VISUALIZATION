library(readxl)
desercion <- read_excel("C:/Users/willa/GITHUB/DATA-VISUALIZATION/Semana 9/Deserción.xlsx")

str(desercion)

desercion$`Tasa D`<- 100*(desercion$`Tasa D`)

colors <- rep("lightgray", length(desercion$`Tasa D`))
colors[4] <- "red"  # Resaltar abril con color rojo

# Create the barplot using the '2019' and 'Tasa D' columns
bp <- barplot(desercion$`Tasa D`, names.arg = desercion$`2019`, col = colors,
        main = "Tasa de Deserción por Mes en 2019", 
        xlab = "Meses", ylab = "Tasa de Deserción (%)", 
        las = 2, cex.names = 0.8, ylim = c(0, 1))
# Dibujar una línea conectando los valores de mayo a agosto
lines(bp[6:8], desercion$`Tasa D`[6:8], 
      type = "o", col = "red", lwd = 2, pch = 16)

lines(bp[11:12], desercion$`Tasa D`[11:12], 
      type = "o", col = "blue", lwd = 2, pch = 16)

# Add gridlines for better readability
grid(nx = NA, ny = NULL)

