library(gdata) 
library("xlsx")

#alternate
bronx1<-read.xlsx(file.choose(),pattern="BOROUGH",stringsAsFactors=FALSE,sheetIndex=1,startRow=5,header=TRUE)
View(bronx1)

# Clean the data to remove NA rows
bronx1 <- na.omit(bronx1)

attach(bronx1) # If you choose to attach, leave out the "data=." in lm regression

# Select the data and split utilizing a REGEX
SALE.PRICE<-sub("\\$","",SALE.PRICE) 
SALE.PRICE<-as.numeric(gsub(",","", SALE.PRICE)) 
GROSS.SQUARE.FEET<-as.numeric(gsub(",","", GROSS.SQUARE.FEET)) 
LAND.SQUARE.FEET<-as.numeric(gsub(",","", LAND.SQUARE.FEET)) 

plot(log(GROSS.SQUARE.FEET), log(SALE.PRICE)) 

# Compute the logs of the necessary data and clean the values
log_sales_price <- log(SALE.PRICE)
log_GSF <- log(GROSS.SQUARE.FEET)
log_LSF <- log(LAND.SQUARE.FEET)

logged_DF <- data.frame(
  "LOG_SP" = log_sales_price,
  "LOG_GSF" = log_GSF,
  "LOG_LSF" = log_LSF
)

logged_DF <- na.omit(logged_DF)

fctr_NEIGHBOR <- factor(bronx1$NEIGHBORHOOD)
fctr_NEIGHBOR <- fctr_NEIGHBOR[!is.infinite(rowSums(logged_DF))]

fctr_BLDNG_CLSS <- factor(bronx1$BUILDING.CLASS.CATEGORY)
fctr_BLDNG_CLSS <- fctr_BLDNG_CLSS[!is.infinite(rowSums(logged_DF))]

logged_DF <- logged_DF[!is.infinite(rowSums(logged_DF)),]

attach(logged_DF)

m1<-lm(logged_DF$LOG_SP~logged_DF$LOG_GSF)
summary(m1)
abline(m1,col="red",lwd=2)
plot(resid(m1))

# Model 2
m2<-lm(logged_DF$LOG_SP~logged_DF$LOG_GSF+logged_DF$LOG_LSF+fctr_NEIGHBOR)
summary(m2)
plot(resid(m2))

# Suppress intercept - using "0+ ..."
m2a<-lm(logged_DF$LOG_SP~0+logged_DF$LOG_GSF+logged_DF$LOG_LSF+fctr_NEIGHBOR)
summary(m2a)
plot(resid(m2a))

# Model 3
m3<-lm(logged_DF$LOG_SP~0+logged_DF$LOG_GSF+logged_DF$LOG_LSF+fctr_NEIGHBOR+fctr_BLDNG_CLSS)
summary(m3)
plot(resid(m3))

# Model 4
m4<-lm(logged_DF$LOG_SP~0+logged_DF$LOG_GSF+logged_DF$LOG_LSF+fctr_NEIGHBOR*fctr_BLDNG_CLSS)
summary(m4)
plot(resid(m4))
#
