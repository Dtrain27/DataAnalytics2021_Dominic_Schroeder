#print(getwd())
#setwd("D:\\Data Analytics\\DataAnalytics2021_Dominic_Schroeder\\In Class Work\\")

# creating a matrix data with random numbers
# and plotting the matrix using the image() function
# you will see there, it does not have a real pattern in the plot.
set.seed(12345)
help(par)

# par can be used to set or query graphical parameters.
# Parameters can be set by specifying them as arguments 
# to par in tag = value form, or by passing them as a list of tagged values.
par(mar = rep(0.2,4))
data_Matrix <-matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(data_Matrix)[,nrow(data_Matrix):1])

help("heatmap")
help("rep")

par(mar=rep(0.2,4))
heatmap(data_Matrix)

help("rbinom") 

set.seed(678910)

for (idx in 1:40) {
  #flipping a coin and getting the data
  coin_flip <- rbinom(1, size = 1, prob = 0.5)
  
  # If the coin is Heads, add a common pattern to that row
  if (coin_flip) {
    data_Matrix[idx, ] <- data_Matrix[idx, ] + rep(c(0,3), each = 5)
  }
  
}

par(mar= rep(0.2, 4))
image(1:10, 1:40, t(data_Matrix)[, nrow(data_Matrix):1])

par(mar=rep(0.2, 4))
heatmap(data_Matrix)

hh <- hclust(dist(data_Matrix))
data_Matrix_Ordered <- data_Matrix[hh$order,]
par(mfrow = c(1,3))
image(t(data_Matrix_Ordered)[, nrow(data_Matrix_Ordered):1])
plot(rowMeans(data_Matrix_Ordered), 40:1, ,xlab = "The Row Mean", ylab="Row", pch = 19)
plot(colMeans(data_Matrix_Ordered), xlab = "Column", ylab="Column Mean", pch = 19)
