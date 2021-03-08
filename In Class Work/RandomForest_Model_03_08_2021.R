# Random Forest Example

install.packages("randomForest")
library(randomForest)

# Load the dataset
data <- read.csv(file.choose(), header = TRUE)
head(data)

# Add the column names
colnames(data) <- c("BuyingPrice", "Maintenance", "NumDoors", "NumPersons", "BootSpace","Safety","Condition")
head(data)
str(data)

# Take a look at the leavel of the Condition column
levels(data$Condition)
summary(data)

# Creating the training and Validation dataset
# Choose 70% of the training and 30% for validation

set.seed(100)
train <- sample(nrow(data), 0.7*nrow(data), replace = FALSE)
TrainSet <- data[train,]
ValidSet <- data[-train,]
summary(TrainSet)
summary(ValidSet)

help(randomForest)

# Random Forest Model with default parms
model <- randomForest(factor(Condition) ~ ., data = TrainSet, importance = TRUE)
model

model2 <- randomForest(factor(Condition)~., data=TrainSet, ntree = 500, mtry = 6, importance = TRUE)
model2

predTrain <- predict(model2, TrainSet, type="class")
table(predTrain, TrainSet$Condition)

predValid <- predict(model2, ValidSet, type="class")
table(predValid, ValidSet$Condition)

# check the importance of the values
importance(model2)
varImpPlot(model2)

# Check for different values of mtry
a = c()
i = 5
for (i in 3:8) {
  model3 <- randomForest(factor(Condition)~., data = TrainSet, ntree=500, mtry = i, importance = TRUE)
  predValid <- predict(model3, ValidSet, type="class")
  a[i-2] = mean(predValid == ValidSet$Condition)
}
a
plot(3:8, a)

# Compare with Decision Tree
library(rpart)
install.packages("caret")
library(caret)
install.packages("e1071")
library(e1071)

# compare model1 of RandomForest to DecisionTreeModel
model_dt <- train(factor(Condition) ~ ., data=TrainSet, method="rpart")
model_dt_1 = predict(model_dt, newdata=TrainSet)

table(model_dt_1, TrainSet$Condition)
mean(model_dt_1 == TrainSet$Condition)
table(model_dt_1, TrainSet$Condition)
mean(model_dt_1 == TrainSet$Condition)

model_dt_vs = predict(model_dt, newdata = ValidSet)
table(model_dt_vs, ValidSet$Condition)
mean(model_dt_vs == ValidSet$Condition)
