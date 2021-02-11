# Multivariate Exercise
library(dplyr)

#print(getwd())
#setwd("D:\\Data Analytics\\DataAnalytics2021_Dominic_Schroeder\\Labs\\Lab 1")



multivar_data <- read.csv("data\\multivariate.csv")
# Ensure the first row is the names of the columns
#colnames(multivar_data) <- multivar_data[1,]
#multivar_data <- multivar_data[-1,]

head(multivar_data)
attach(multivar_data)

help(lm)
mm <- lm(Homeowners~Immigrant)
mm

summary(mm)
plot(Homeowners~Immigrant)
help(abline)

abline(mm)
abline(mm, col=2, lwd=3)

newImmigrantdata <- data.frame(Immigrant = c(0, 20))
mm %>% predict(newImmigrantdata)

abline(mm)
abline(mm,col=3,lwd=3) # line color = green, line width = 3
attributes(mm)
mm$coefficients
