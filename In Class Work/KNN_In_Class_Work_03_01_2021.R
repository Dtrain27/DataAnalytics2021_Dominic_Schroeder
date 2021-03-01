library(ISLR) # you need to install the ISLR package first
library(ggplot2)
# Caravan dataset is about the insurance
library(class)

PREDICTOR_COL_IDX <- 86

head(Caravan)
str(Caravan)

# Purchase: Factor w/ 2 levels "No","Yes": 1 1 1 1 1 1 1 1 1 1 ...
# "Yes" or "No" indicates whether people purchased the insurance policy or not. 
dim(Caravan) # it has 5822 rows (observations) and 86 features/columns  
summary(Caravan)
summary(Caravan$Purchase)

# check for any NA and missing values
any(is.na(Caravan)) # FALSE, that means no NA values in this dataset 

# Now we want to check the scales of the variables because the variable with a large scale
# will have a larger effect on distances between observations when using the KNN Algorithm 
# Checking the Variances on features/Columns using the var() function in R
var(Caravan[,1]) # Variance of the 1st column is 165.0378
var(Caravan[,2]) # Variance of the 2nd column is 0.1647
var(Caravan[,3]) # Variance of the 3rd column is 0.6238

# You can see that the variances are different for each of the column variables, 1st one is 165.03 and 2nd one is 0.16
# and there is a huge difference, because of that we want to standardize the variables. 
# We will do that for all the columns except the "Purchase" variable which we are going predict.
purchase <- Caravan[,PREDICTOR_COL_IDX]

# purchase <-Caravan[,'Purchase'] with the column name
purchase

# Now we want to Standardize the columns except the 86th column
# when we use -86 it will not include the 86th column which is the value we wish to analyze.
StandardizedCaravan <- scale(Caravan[,-PREDICTOR_COL_IDX])
var(StandardizedCaravan[,1])
var(StandardizedCaravan[,2])
var(StandardizedCaravan[,3])

# test set
test_index <- 1:1000
test_data <- StandardizedCaravan[test_index,]
test_purchase <- purchase[test_index]

# train set
train_data <- StandardizedCaravan[-test_index,]
train_purchase <- purchase[-test_index]

# set seed
set.seed(101)
predicted_purchase <- knn(train_data,test_data,train_purchase, k = 10)
head(predicted_purchase)

missClassError <- mean(test_purchase != predicted_purchase)
print(missClassError)

# Choosing the K value
# we can write a for-loop
predicted_purchase <- NULL
error_rate <- NULL

for (i in 1:20) {
  set.seed(101)
  predicted_purchase <- knn(train_data, test_data, train_purchase, k =i)
  error_rate[i] <- mean(test_purchase != predicted_purchase)
}

print(error_rate)

# Plot the K value on a graph
k_values <- 1:20

error_df <- data.frame(error_rate, k_values)
print(error_df)
ggplot(error_df,aes(k_values,error_rate)) + geom_point() + geom_line(lty='dotted', color='blue')
