install.packages
library(MASS) # load the library MASS
attach(Boston)
?Boston # help function with "?"
head(Boston)
dim(Boston)
names(Boston) # column names
str(Boston) # str function shows the structure of the dataset
nrow(Boston)
ncol(Boston)
summary(Boston) # summary() function shows the summary statistics
summary(Boston$crim) # summary of the "crime" column in the Boston dataset
