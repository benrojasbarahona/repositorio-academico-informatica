# Regresion lineal 

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
