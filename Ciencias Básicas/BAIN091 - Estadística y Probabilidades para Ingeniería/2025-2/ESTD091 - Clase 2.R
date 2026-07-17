# ESTD091 - Clase 2
# Gerardo E. Soto
# 29 de agosto de 2025

# librerias ----
library(tidyverse)
library(moments)

# Funciones ----
source("~/UACh/Docencia/2025-2/ESTD091/funciones.R")

# Datos aleatorios ----
datosAleatorios1 <- sample(1:6,  # secuencia del 1 al 6
                           100,  # numero de muestras
                           replace = TRUE)  # con reemplazo
datosAleatorios1

tablaResumen(datosAleatorios1)
tablaFrecuencias(datosAleatorios1)

# Datos aleatorios 2 ----
# rnorm es la distribucion Normal
datosAleatorios2 <- rnorm(1000,  # numero de muestras
                          10,  # media 
                          2)  # desviacion estandar

tablaResumen(datosAleatorios2)

# Datos aleatorios 3 ----
# rbeta es la distribucion Beta
datosAleatorios3 <- rbeta(1000,  # N
                          2,  # alpha
                          5)  # beta (ver wikipedia)

tablaResumen(datosAleatorios3)  # As = 0.65, K = 3.06
tablaFrecuencias(datosAleatorios3)

# Tarea: jugar con los parametros de la distribucion Beta para entender el comportamiento y los valores de los estadigrafos.

# Responda: Qué valor de asimetria es "similar a cero"?


# Simulaciones de parametros ----
contador <- 1:10
for(i in contador){
  print(i)
}

# Simulacion de cambio de parametro alfa en rbeta
parametroBeta <- seq(0.2,  # desde
                     2,  # hasta
                     by = 0.2)  # cada cuanto
for(alfa in parametroBeta){
  datosAleatorios <- rbeta(1000, 
                           alfa, 
                           1)
  hist(datosAleatorios)
  Sys.sleep(1) # pausa de 1 segundo
}

# Añadir un estadigrafo de la tabla
parametroBeta <- seq(0.2,  # desde
                     2,  # hasta
                     by = 0.2)  # cada cuanto
for(alfa in parametroBeta){
  datosAleatorios <- rbeta(1000, 
                           alfa, 
                           1)  # Ojo! lo pueden cambiar
  hist(datosAleatorios, 
       main = paste("Asimetria =", 
                    tablaResumen(datosAleatorios)[10, 2]))
  Sys.sleep(1) # pausa de 1 segundo
}

# Tarea: jugar incluyendo otros estadigrafos

