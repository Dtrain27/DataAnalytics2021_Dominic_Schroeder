# Practice on the Titanic Data
install.packages("titanic")
library(rpart)
library(titanic)
data(titanic_train)
attach(titanic_train)

tree <- rpart(titanic_train$Survived ~ ., data=titanic_train)
plot(fit)

help(ctree)
tree <- ctree(as.factor(titanic_train$Survived) ~ ., data=titanic_train)

              