# print(getwd())
# setwd("D:\\Data Analytics\\DataAnalytics2021_Dominic_Schroeder\\Labs\\Lab 1")

EPI_data <- read.csv("data\\2010EPI_data.csv")
# Ensure the first row is the names of the columns
colnames(EPI_data) <- EPI_data[1,]
EPI_data <- EPI_data[-1,]

View(EPI_data)
attach(EPI_data) 	# sets the object
fix(EPI_data) 	# launches a simple data editor

#Define the LandLock vector
Landlock = as.logical(as.numeric(EPI_data$Landlock))

#Landlock
EPILand<-EPI[!Landlock]
ELand <- EPILand[!is.na(EPILand)]

#
hist(ELand)
hist(ELand, seq(30., 95., 1.0), prob=TRUE)

#Define the LandLock vector
Landlock = as.logical(as.numeric(EPI_data$Landlock))

#Landlock
EPIair<-AIR_H[!Landlock]
EAir <- EPIair[!is.na(EPIair)]

#
hist(EAir)
hist(EAir, seq(1., 100., 1.0), prob=TRUE)
