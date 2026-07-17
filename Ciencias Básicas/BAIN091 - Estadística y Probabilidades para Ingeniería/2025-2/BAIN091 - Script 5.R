# BAIN091 - Script 5
# Regresion lineal 

# libraries 
library(tidyverse)

# todos los set de datos de R
data()  

# Datos de mtcars
View(mtcars)

# Grafico de dispersion de mpg y peso
plot(mtcars$wt, mtcars$mpg)

# estimar una regresion lineal entre cyl y mpg
modelo1 <- lm(mpg ~ wt, data = mtcars)
modelo1

# resumen completo del modelo
summary(modelo1)
  
# Grafico de dispersion con curva de regresion 
mtcars %>% 
  ggplot(aes(x = wt, y = mpg)) + 
  geom_smooth(method = 'lm', 
              se = TRUE, 
              color = 'red') +
  geom_point() + 
  theme_light() + 
  labs(subtitle = 'Regresion entre peso y eficiencia', 
       x = 'Peso [ton]', 
       y = 'Eficiencia [mpg]')

# Links a Geogebra:
# https://www.geogebra.org/m/g5cweyqt # efectos de atipicos y residuales no homogeneos
# https://www.geogebra.org/m/xC6zq7Zv  # Residuales

# estimar una regresion lineal entre carb y gear
modelo2 <- lm(carb ~ gear, data = mtcars)
modelo2

# resumen completo del modelo
summary(modelo2)

# Grafico de dispersion con curva de regresion 
mtcars %>% 
  ggplot(aes(x = gear, y = carb)) + 
  geom_smooth(method = 'lm', 
              se = TRUE, 
              color = 'red') +
  geom_point() + 
  theme_light() + 
  labs(subtitle = 'Regresion entre cambios y carburadores', 
       x = 'Cambios', 
       y = 'Carburadores')

# modelo de desplazamiento explicando el tiempo en el cuarto de milla
modelo3 <- lm(qsec ~ disp, data = mtcars)
modelo3 %>% summary

# Por lo tanto:
# qsec = -0.006 * disp + 19.291
# En palabras: 
# El tiempo en el cuarto de milla cuando el desplazamiento es cero es de 19.291 segundos. Además, la disminución del tiempo en el cuarto de milla cuando el desplazamiento aumenta una unidad es de 0.006. 

# Además, el intercepto es distinto de cero con una confianza del 99.9% porque su valor de P es menor a 0.001. 

# Mientras tanto, la pendiente es distinta de cero con una confianza del 95% porque su valor de P es menor a 0.05. 


# Regresiones con datos Niños ----
ninos <- "~/Documents/Clases/BAIN091/Niños.csv" %>% read_csv
ninos

ninos %>% glimpse  # ojeada

# Primer modelo. CI del padre
modelo_padre <- lm(Puntaje ~ CI_padre, data = ninos)
modelo_padre %>% summary

# Tenemos que:
# Primero, los residuales son ligeramente asimétricos positivos. 

# Sergundo, la ecuación es:
# Puntaje = 0.2501 * CI_padre + 130.4294
# Lo que se interpreta como: 
# El valor del puntaje cuando el CI del padre es cero es de 130.4294. Además, por cada unidad que aumente el CI del padre, el puntaje aumenta en 0.2501. 
# Si bien el intercepto es distinto de cero con una confianza del 99.9%, la pendiente no es distinta de cero porque su valor de P es mayor a 0.1. 

# Además, el modelo predice sólo el 3.537% de la varianza en el puntaje. 


# Modelo 2: CI de la madre
modelo_madre <- lm(Puntaje ~ CI_madre, data = ninos)
modelo_madre %>% summary

# Primero, los residuales son mínimamente asimétricos positivos.

# Segundo, la ecuación es:
# Puntaje = 0.4066 * CI_madre + 111.093
# Lo que significa que:
# Cuando el CI de la madre es 0, el puntaje es de 111.093, y que por cada unidad que aumente el CI de la madre, el puntaje aumenta 0.4066. 

# Tercero: 
# Tanto el intercepto como la pendiente son distintos de cero con una confianza del 99.9%. 

# Cuarto:
# La proporción de la varianza del Puntaje explicada por el CI de la madre es del 32.63%. 


# Graficos ----
ninos %>% 
  ggplot(aes(x = CI_padre, y = Puntaje)) + 
  geom_smooth(method = 'lm', color = 'red') + 
  geom_point() + 
  theme_light() + 
  labs(subtitle = 'Regresión de CI del padre explicando el Puntaje del niño', 
       x = 'CI_padre', 
       y = 'Puntaje del niño')

ninos %>% 
  ggplot(aes(x = CI_madre, y = Puntaje)) + 
  geom_smooth(method = 'lm', color = 'red') + 
  geom_point() + 
  theme_light() + 
  labs(subtitle = 'Regresión de CI de la madre explicando el Puntaje del niño', 
       x = 'CI_madre', 
       y = 'Puntaje del niño')

# Tarea, terminar con las otras variables.
# La idea es que descubra qué pasa con la tele y la lectura.















