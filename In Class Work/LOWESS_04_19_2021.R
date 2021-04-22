install.packages("lowess")
data(economics, package="ggplot2") # load data

economics$index <- 1:nrow(economics) # create index variable
economics <- economics[1:80, ] # retail 80rows for better graphical understanding

loessMod10 <- loess(uempmed ~ index, data=economics, span=0.10) # 10% smoothing span
loessMod25 <- loess(uempmed ~ index, data=economics, span=0.25) # 25% smoothing span
loessMod50 <- loess(uempmed ~ index, data=economics, span=0.50) # 50% smoothing span

# Predict Loess
smoothed10 <- predict(loessMod10)
smoothed25 <- predict(loessMod25)
smoothed50 <- predict(loessMod50)

# From above plot, you would notice that as the span increases, the smoothing of the curve also increases.
# Plot it
plot(economics$uempmed, x=economics$date, type="l", main="Loess Smoothing and Prediction",
     xlab="Date", ylab="Unemployment (Median)")
lines(smoothed10, x=economics$date, col="red")
lines(smoothed25, x=economics$date, col="green")
lines(smoothed50, x=economics$date, col="blue")

if (FALSE) {
  "
  I could not find the appropriate data for the cars dataset. The one I was utilizing
  does not have a speed column so I'm not sure what data is being used
  "
}

# LOWESS example using the Cars dataset
data(cars, package="lowess")

str(cars) # we see 50 observation and 2 variables
# now we create a plot, speed Vs distance
plot(speed ~ dist, data = cars)

