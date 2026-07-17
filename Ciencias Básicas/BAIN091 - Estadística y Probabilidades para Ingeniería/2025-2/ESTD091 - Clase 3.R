# ESTD091 - Clase 3
# Gerardo E. Soto
# 5 de septiembre de 2025

# Librerias ----
library(tidyverse)
library(moments)

# Gramatica de graficos ----
# Grammar of graphics 

# Recurso muy importante:
# Google: "R graph gallery"

# Datos aleatorios
datos <- rbeta(1000, 2, 3)
datos %>% hist
hist(datos)

# Lamentablemente ggplot necesita una tabla, no usa vectores
grafico1 <- data.frame(
  x_1 = datos
) %>% 
  ggplot(aes(x = x_1)) +  # genera el lienzo
  # ojo que la pipa del ggplot es un signo "+"
  geom_histogram() +
  # Esto es el estandar que usa el LAAR
  theme_light() +  # tema estandarizado
  labs(title = "Histograma", 
       subtitle = "Distribucion Beta(2, 3)\nCon 1000 muestras", 
       x = "Valor (nombre de la variable)", 
       y = "Frecuencia", 
       caption = 'Elaboracion propia')
print(grafico1)
ggsave('C:/Users/lenovo/Documents/UACh/Docencia/2025-2/ESTD091/graficos/grafico1.png', 
       width = 8, 
       height = 7,
       units = 'cm', 
       dpi = 300, 
       scale = 1.5)  # zoom de la figura

# Simulacion de cambio de asimetria con distribucion Beta ----

# Pseudocodigo:
# 1. Generar el contador como vector o tabla para el parametro de interes
# 2. Generar el for loop con un nombre de contador que refleje la variable a cambiar
# 3. Graficar incluyendo el parametro o estadigrafos de interes
# 4. Pausa 

parametroBeta <- seq(5,  # desde
                     2,  # hasta
                     length = 30)  # cada cuanto
nombreArchivo <- 1
for(beta in parametroBeta){
  datosAleatorios <- rbeta(10000,  # exagerar a 10000
                           2,  # alfa
                           beta)  # beta
  grafico <- data.frame(
    x_1 = datosAleatorios
  ) %>% 
  ggplot(aes(x = x_1)) + 
  geom_histogram() +
  theme_light() + 
  labs(title = "Histograma", 
       subtitle = paste("Media =", datosAleatorios %>% mean %>% round(2),
                        "\nAsimetria =", datosAleatorios %>% skewness %>% round(2),
                        "\nCurtosis =", datosAleatorios %>% kurtosis %>% round(2)
                        ),
       x = "Valor (nombre de la variable)", 
       y = "Frecuencia", 
       caption = 'Elaboracion propia')
  print(grafico)
  ggsave(paste0('C:/Users/lenovo/Documents/UACh/Docencia/2025-2/ESTD091/graficos/grafico',
               nombreArchivo, 
               '.png'), 
         width = 8, 
         height = 7,
         units = 'cm', 
         dpi = 300, 
         scale = 1.5)
  Sys.sleep(0.2) # pausa de 1 segundo
  nombreArchivo <- nombreArchivo + 1
}

# Una vez exportados, uso ezgif.com para armar una simulacion

