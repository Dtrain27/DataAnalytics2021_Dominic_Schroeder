# PCA Analysis In-Class work

############## PCA Analysis on Iris Dataset ##############
data("iris")
head(iris)

# creating another dataset from iris dataset that contains the columns from 1 to 4 
irisdata1 <- iris[,1:4]
irisdata1

head(irisdata1)

# Read the documentation for the princomp() function in RStudio.
help("princomp")
principal_components <- princomp(irisdata1, cor = TRUE, score = TRUE)

# cor = a logical value indicating whether the calculation should 
#use the correlation matrix or the covariance matrix.
# (The correlation matrix can only be used if there are no constant variables.)
# score = a logical value indicating whether the score on  
# each principal component should be calculated.
summary(principal_components)

# in the summary you can see that it has four Principal Components it is because the input data has
# four different features.

# using the plot() function, we can plot the principal components.
plot(principal_components)

# plotting the principal_components using the a line in plot() functions 
plot(principal_components, type = "l")

# using the biplot() function we can plot the components
# Read the documentation for the bilopt() function in the RStudio
help("biplot")
biplot(principal_components)

############## PCA Analysis on the Boston Dataset ##############
install.packages('MASS')
data(Boston, package="MASS")

# Read the documentation of Boston dataset in RStudio to understand the dataset
help(Boston)

# Principal Component Analysis
# the prcomp() fucntion computes the principal components and we have turned on scalling
# Read the documentation for prcompt() function in RStudio
help(prcomp)

pca_out <- prcomp(Boston,scale. = T)

# pca_out shows the loadings that used.
pca_out
plot(pca_out)

# plotting using the biplot()
# Read the documentation for biplot() function in RStudio
help(biplot)

biplot(pca_out, scale = 0)
boston_pc <- pca_out$x
boston_pc

# boston_pc has the Principal Components having the same number of rows in the original dataset
head(boston_pc)
summary(boston_pc)
