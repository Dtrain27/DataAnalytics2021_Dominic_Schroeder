# Bagging and Random Forest Example
library(randomForest)

set.seed(1)
bag.boston = randomForest(medv ~., data=Boston, subset = train, mtry=13, importance= TRUE)
bag.boston

# The argument mtry=13 indicates that all 13 predictors should be considered
# for each split of the tree-in other words, that bagging should be done.
# How well does this bagged model perform on the test set?
yhat.bag = predict(bag.boston ,newdata=Boston[-train ,])
plot(yhat.bag, boston.test)

# adding the abline()
abline(0,1)
mean((yhat.bag-boston.test)^2)

bad.boston =bag.boston=randomForest(medv~.,data=Boston,subset=train, mtry=13,ntree=40)
yhat.bag = predict(bag.boston ,newdata=Boston[-train ,])
mean((yhat.bag-boston.test)^2)

set.seed(1)
rf.boston=randomForest(medv~.,data=Boston,subset=train,
                       mtry=6,importance =TRUE)
yhat.rf = predict(rf.boston ,newdata=Boston[-train ,])
mean((yhat.rf-boston.test)^2)

importance (rf.boston)
varImpPlot (rf.boston)
