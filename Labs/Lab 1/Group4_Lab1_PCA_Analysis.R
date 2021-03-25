# Group 4 Lab 1 
# 6000 Level

# There are 13 variables in the dataset such as Alcohol, Malic Acid, Ash, Alkalinity of Ash, Magnesium, ...
wine_data <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", sep = ",")

# Peek at the data
head(wine_data)
nrow(wine_data) 

# Noticed the colnames are missing and thus, we need to add them
# Adding the variable names 
colnames(wine_data) <- c("Cvs", "Alcohol", 
                         "Malic_Acid", "Ash", "Alkalinity_of_Ash", 
                         "Magnesium", "Total_Phenols", "Flavanoids", "NonFlavanoid_Phenols",
                         "Proanthocyanins", "Color_Intensity", "Hue", "OD280/OD315_of_Diluted_Wine", 
                         "Proline")
head(wine_data) # Now you can see the header names.

# Using the Heatmap() function, we can check the correlations,
# In the heatmap(), the "Dark Colors" represent the "Correlated"
# In the heatmap(), the "Light Colors" represent the "Not Correlated"
# Now we will use the heatmap() function to show the correlation among variables.
heatmap(cor(wine_data),Rowv = NA, Colv = NA) 

# declaring the cultivar_classes using the factor() function each cultivar Cv1,Cv2 and Cv3.
cultivar_classes <- factor(wine_data$Cvs) 
cultivar_classes

# We will not normalize the Cvs variable (first column) so we exclude the Cvs column with with -1 
wine_data_PCA <- prcomp(scale(wine_data[,-1]))

# Get a summary of the PCA
summary(wine_data_PCA)

# Plot the PCA analysis
plot(wine_data_PCA)

# Plot a L line graph
plot(wine_data_PCA, type = "l")

# Create a biplot
biplot(wine_data_PCA)
