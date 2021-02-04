#Cumulative Density Function
plot(ecdf(EPI), do.points=FALSE, verticals=TRUE) 

#Quantile-Quantile?
par(pty="s") 
qqnorm(EPI); qqline(EPI)

#Simulated data from t-distribution:
if (FALSE) {
  "rt is the function for generating a pseudo-random number generation
   n is the number of points to be plot and df (degrees of freedom)
  "
}
x <- rt(250, df = 5)
qqnorm(x); qqline(x)

#Make a Q-Q plot against the generating distribution by: x<-seq(30,95,1)
x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

help(distributions)

# Try the exponential distribution
plot(dexp(x), do.points=FALSE, verticals=TRUE)

# Try the normal distribution
plot(dnorm(x), do.points=FALSE, verticals=TRUE)

# Explore two other variables from the EPI_Data set
AIR_H <- as.numeric(EPI_data$AIR_H)
WATER_H <- as.numeric(EPI_data$WATER_H)

tf <- is.na(AIR_H) # records True values if the value is NA
filteredAIR <- AIR_H[!tf] # filters out NA values, new array
print(filteredAIR)
