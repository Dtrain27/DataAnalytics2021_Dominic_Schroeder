# LDA in class Example

library(MASS)

names(iris)
dim(iris) # check the dimensions of the iris data

head(iris)

# setting the seed value
set.seed(555)

Train <- sample(1:nrow(iris), nrow(iris)/2)
iris_Train <- iris[Train,] # Traning dataset
irist_Test <- iris[-Train,] # Testing dataset

fit1 <- lda(Species ~ Sepal.Length + Sepal.Width +
              Petal.Length + Petal.Width, data = iris_Train)

predict1 <- predict(fit1, iris_Train)
predict1_class <- predict1$class

# generating the confusion matrix using the table() function
table1 <- table(predict1_class, iris_Train$Species)
table1

# Calculating the Accuracy of the prediction
sum(diag(table1))/sum(table1)
