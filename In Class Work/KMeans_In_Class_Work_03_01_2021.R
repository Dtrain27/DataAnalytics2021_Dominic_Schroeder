# KMeans example with Iris dataset
library(ISLR)
library(ggplot2)
library(cluster)

# Read the documentation for various functions/libraries
help("kmeans")
help("clusplot")

head(iris)
str(iris)

# visually inspecting the three factors: Species clusters with a plot
plot1 <- ggplot(iris, aes(Petal.Length,Petal.Width, color=Species))
print(plot1 + geom_point(size=3))

# set seed for the random numbers
set.seed(101)

# Attempt to do the clustering
irisClusters <- kmeans(iris[,1:4], 3, nstart = 20) # nstart is the number of random start
print(irisClusters)
table(irisClusters$cluster,iris$Species)

# plotting the clusters
clusplot(iris,irisClusters$cluster, color = TRUE, shade = TRUE, labels = 0, lines = 0)
