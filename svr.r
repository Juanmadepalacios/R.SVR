#SVR

# Plantilla de Regresi�n

#Importar el dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[, 2:3]


#Dividir los datos en conjunto de entrenamiento y conjunto de test
#install.packages("caTools")
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Purchased, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# testing_set = subset(dataset, split == FALSE)

#Escalado de valores
# training_set[,2:3] = scale(training_set[,2:3])
# testing_set[,2:3] = scale(testing_set[,2:3])

# AJustar SVR con el Conjunto de Datos
library(e1071)
regression = svm(formula = Salary ~ .,
                 data = dataset,
                 type = "eps-regression",
                 kernel = "radial")

#Predicci�n de nuevos resultadosde con SVR
y_pred = predict(regression, newdata = data.frame(Level = 6.5))


# Visualizaci�n del modelo de SVR
# install.packages("ggplot2")
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = "red") +
  geom_line(aes(x = dataset$Level, y = predict(regression, 
                                        newdata = data.frame(Level = dataset$Level))),
            color = "blue") +
  ggtitle("Predicci�n (SVR") + 
  xlab("Nivel del empleado") +
  ylab("Sueldo (en $)")


#Predicci�n de nuevos resultadosde la Regresi�n Polin�mica
y_pred_poly = predict(regression, newdata = data.frame(Level = 6.5))