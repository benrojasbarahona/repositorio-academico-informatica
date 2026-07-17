# ESTD091 - Clase 1
# Gerardo E. Soto
# 22 de agosto de 2025

# Instalar y usar librerias 
install.packages("tidyverse")  # solo una vez en la vida
install.packages("moments")
library(tidyverse)
library(moments)

# R y RStudio en google e instala

# Para que el codigo sea interpretado, uso CTRL + ENTER
# Esto ejecuta las instrucciones en la consola

# Elementos en el indice: 
# Variables en R ----

# Vectores de datos
# Los creamos usando la funcion concatenar c()
c(2, 3, 1, 3)

# R es un lenguaje basado en elementos u objetos
a <- 1
b <- 4
a + b
a / b

cc <- c(2, 3, 1, 3)
cc

cc - a

# Camello
nombreCualquiera <- c(99, 109)
nombreCualquiera

# Culebra
nombre_cualquiera <- c(18, 19)
nombre_cualquiera

# puedo usar funciones sobre vectores
# por ejemplo la media o "mean"
mean(cc)
(2 + 3 + 1 + 3) / 4

# por ejemplo un histograma
hist(cc)

# Ejemplo de la clase:
numeroMascotas <- c(2, 3, 5, 4, 4,
                    0, 1, 1, 3, 4, 
                    4, 1, 5, 2, 2, 
                    2, 2, 12, 5, 1,
                    15, 2, 6, 6, 2, 
                    9, 5, 9, 21, 4, 
                    3, 1, 6, 3, 7, 
                    5, 8)
numeroMascotas

hist(numeroMascotas)
hist(numeroMascotas, breaks = 4)  # no es muy flexible, solo sugiero
hist(numeroMascotas, breaks = 3)
hist(numeroMascotas, breaks = 2)
hist(numeroMascotas, breaks = 6)
hist(numeroMascotas, breaks = 8)

# La ayuda de las funciones la puedo acceder usando el signo de pregunta antes del nombre de la funcion
?hist

# Data frames o tablas de datos ----
data.frame(
  edad = c(21, 18, 15, 32), 
  peso = c(78, 80, 97, 60)
)

# Funcion de tabla de resumen que construye una tabla con los resumenes estadisticos que veremos en clases, para cualquier vector
# Funcion de resumen estadistico ----
tablaResumen <- function(datos){
  coefVar <- function(datos){
    cv <- sd(datos) / abs(mean(datos)) * 100
    return(cv)
  }
  
  # calcular el minimo y el maximo
  minimo <- datos %>% min %>% round(3)
  maximo <- datos %>% max %>% round(3)
  
  df <- data.frame(
    Medida = c("N",
               "Minimo", 
               "Maximo", 
               "Rango",
               "Media", 
               "Mediana", 
               "Varianza",
               "Desv. Est.",
               "CV%", 
               "Asimetria", 
               "Curtosis"), 
    Valor = c(datos %>% length %>% round(3),
              minimo, 
              maximo, 
              (maximo - minimo) %>% round(3), 
              datos %>% mean %>% round(3), 
              datos %>% median %>% round(3), 
              datos %>% var %>% round(3), 
              datos %>% sd %>% round(3), 
              datos %>% coefVar %>% round(3),
              datos %>% skewness %>% round(3),
              datos %>% kurtosis %>% round(3))
  )
  return(df)
}

# Tabla con datos simulados
tablaResumen(cc)

# Tabla con datos de numeros de mascotas
tablaResumen(numeroMascotas)

# Funcion de tabla de frecuencias ----
str(hist(numeroMascotas))

histograma <- hist(numeroMascotas)

# vectorizacion de elementos del histograma
tablaFrecuencias <- function(datos){
  df <- data.frame(
    marcaClase = histograma$mids, 
    frecuenciaAbsoluta = histograma$counts
  )
  return(df)
}

tablaFrecuencias(numeroMascotas)

# Muestreo aleatorio de numeros ----
1:10
2:5
sample(1:10, 1)  # una muestra de un numero

sample(1:10, 5) 

sample(1:10, 20)  # no puedo porque es sin reemplazo

sample(1:10, 20, replace = TRUE)

# Ejemplo de pipeline completo de creacion de numeros aleatorios y calculo de tabla de frecuencias
vectorAleatorio <- sample(-1:12, 20, replace = TRUE)
tablaFrecuencias(vectorAleatorio)
hist(vectorAleatorio)



