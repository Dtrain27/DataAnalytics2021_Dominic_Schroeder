#print(getwd())
#setwd("D:\\Data Analytics\\In Class Work\\")

multivariate <- read.csv("data\\multivariate.csv")
attach(multivariate)
names(multivariate)
multivariate

# Create some Scatterplots
plot(Income,Immigrant, main = "Scatterplot")
plot(Immigrant, Homeowners)

# Fitting Linear Models using "lm" function
help(lm)
mm <- lm(Homeowners ~ Immigrant)
mm
plot(Immigrant, Homeowners)

help(abline)
abline(mm)
abline(mm, col=2, lwd=3)

summary(mm)
attributes(mm)
mm$coefficients
