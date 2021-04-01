library(e1071)
library(rpart)
library(plyr)

ozone_data <- data.frame(ozone)
attach(ozone_data)

# split data into a train and test set
index <- 1:nrow(ozone_data)
testindex <- sample(index, trunc(length(index)/3))
testset <- na.omit(ozone_data[testindex,-3])
trainset <- na.omit(ozone_data[-testindex,-3])

svm.model <- svm(V4 ~ ., data = trainset, cost = 1000, gamma = 0.0001)
svm.pred <- predict(svm.model, testset[,-3])
crossprod(svm.pred - testset[,3]) / length(testindex)