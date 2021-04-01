# Practice on the Titanic Data
install.packages("party")
install.packages("titanic")
library(rpart)
library(titanic)
library(randomForest)
library(party)

data(titanic_train)
attach(titanic_train)

part <- rpart(titanic_train$Survived ~ ., data=titanic_train)
part

tree <- ctree(titanic_train$Survived~PassengerId+Pclass+Age+SibSp+Parch+Fare, data=titanic_train)
plot(tree)

help(hclust)
help(dist)
matrix <- dist(titanic_train$Survived)
matrix
cluster <- hclust(matrix)
plot(cluster)

titanic_train <- na.omit(titanic_train)
model <- randomForest(as.factor(Survived) ~ ., data = titanic_train)
model

