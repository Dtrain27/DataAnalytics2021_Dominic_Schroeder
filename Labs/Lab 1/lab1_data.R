# print(getwd())
# setwd("D:\\Data Analytics\\DataAnalytics2021_Dominic_Schroeder\\Labs\\Lab 1")
# install.packages("xlsx")
# library("xlsx")

EPI_data <- read.csv("data\\2010EPI_data.csv")
# Ensure the first row is the names of the columns
colnames(EPI_data) <- EPI_data[1,]
EPI_data <- EPI_data[-1,]

if (FALSE) {
  "
  I tried to read the excel form of this data sheet but it resulted
  in me running out of memory
   > EPI_Excel_data <- read.xlsx(data\\2010EPI_data.xls, EPI2010_onlyEPIcountries)
     Error in .jcall(RJavaTools, Ljava/lang/Object;, invokeMethod, cl,  : 
     java.lang.OutOfMemoryError: Java heap space
  "
}
#EPI_Excel_data <- read.xlsx("data\\2010EPI_data.xls", "EPI2010_onlyEPIcountries")
#EPI_Excel_data

View(EPI_data)
attach(EPI_data) 	# sets the object
fix(EPI_data) 	# launches a simple data editor
EPI <- EPI_data$EPI 			# prints out values EPI_data$EPI

tf <- is.na(EPI) # records True values if the value is NA
E <- EPI[!tf] # filters out NA values, new array
print(E)


#other data
GRUMP_data <- read.csv("data\\GPW3_GRUMP_SummaryInformation_2010.csv")
GRUMP_data

# Ensure the first row is the names of the columns
colnames(GRUMP_data) <- GRUMP_data[1,]
GRUMP_data <- GRUMP_data[-1,]

attach(GRUMP_data)
fix(GRUMP_data)
