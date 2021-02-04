# Creating a dataframe
# Example: RPI Weather dataframe

days <- c("Mon","Tue","Wed","Thur","Fri","Sat","Sun")
tempurature <- c(28,30.5,32,31.2,29.3,27.9,26.4)
snowed <- c('T','T','F','F','T','T','F')

help("data.frame")
rpiWeatherWeek <- data.frame(days, tempurature, snowed)

rpiWeatherWeek
head(rpiWeatherWeek)
str(rpiWeatherWeek)
summary(rpiWeatherWeek)

rpiWeatherWeek[1,]
rpiWeatherWeek[,1]

rpiWeatherWeek[,'snowed']
rpiWeatherWeek[,'days']
rpiWeatherWeek[,'tempurature']
rpiWeatherWeek[1:5, c("days", "tempurature")]
rpiWeatherWeek$tempurature
subset(rpiWeatherWeek, subset=snowed==TRUE)

sorted.snowed <- order(rpiWeatherWeek['snowed'])
sorted.snowed
rpiWeatherWeek[sorted.snowed,]

# Sort in descending order
desc.snow <- order(-rpiWeatherWeek$tempurature)
desc.snow

# Creating dataframe
# creating an empty dataframe
empty.DataFrame <- data.frame()
v1 <- 1:10
v1
letters
v2 <- letters[1:10]
df <- data.frame(col.name.1 = v1, col.name.2 = v2)
df

# import and export data
# writing to a csv file
write.csv(df, file = 'saved_rpi_example.csv')
df2 <- read.csv('saved_rpi_example.csv')
df2
