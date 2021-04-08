# Practice on the Titanic Data
install.packages("titanic")
library(titanic)

data("titanic_train")
attach(titanic_train)

y = titanic_train$Survived
x = as.matrix(titanic_train[, -c(-1, -3, -6, -7, -8, -10)])

cv.folds <- function(n,folds=3) {
  split(sample(n),rep(1:folds,length=length(y)))
}

svp <- ksvm(x,y,type="C-svc",kernel="vanilladot",C=1,scaled=c(),cross=5)
print(cross(svp))
