# Lab 1 Part 2 Exercise 1: Fitting distribution beyond histograms

#print(getwd())
#setwd("D:\\Data Analytics\\DataAnalytics2021_Dominic_Schroeder\\Labs\\Lab 1")

EPI_data_2010 <- read.csv("data\\2010EPI_data.csv")
# Ensure the first row is the names of the columns
colnames(EPI_data_2010) <- EPI_data_2010[1,]
EPI_data_2010 <- EPI_data_2010[-1,]

View(EPI_data_2010)
attach(EPI_data_2010) 	# sets the object
fix(EPI_data_2010) 	# launches a simple data editor

EPI_2010 <- as.numeric(EPI_data_2010$EPI) 			# prints out values EPI_data$EPI

if (FALSE) {
  "
  tf <- is.na(EPI) # records True values if the value is NA
  E <- EPI[!tf] # filters out NA values, new array
  "
}
# Plot the CDF function
plot(ecdf(EPI_2010), do.points=FALSE, verticals=TRUE)

help("qqnorm")
par(pty="s")
help("par")

qqnorm(EPI_2010);
qqline(EPI_2010);

x <- seq(30,95,1)

qqplot(qt(ppoints(250), df = 5), x, xlab="Q-Q plot fot t dsn")
qqline(x)

# Plotting EPI against Air and Water H
Air_data_2010 <- as.numeric(EPI_data_2010$AIR_H)
Water_data_2010 <- as.numeric(EPI_data_2010$WATER_H)

qqplot(EPI_2010, Air_data_2010)
qqplot(EPI_2010, Water_data_2010)

boxplot(EPI_2010, Air_data_2010)
boxplot(EPI_2010, Water_data_2010)

# EPI data 2016 analysis
EPI_data_2016 <- read.csv("data\\2016EPI_data.csv")
# Ensure the first row is the names of the columns
#colnames(EPI_data_2016) <- EPI_data_2016[1,]
#EPI_data_2016 <- EPI_data_2016[-1,]

View(EPI_data_2016)
attach(EPI_data_2016) 	# sets the object
fix(EPI_data_2016) 	# launches a simple data editor
