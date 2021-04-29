# Fitting a Regression Trees
install.packages("tree")
library(MASS)
library(tree)

# Randomly setup the seed value
set.seed(1)

head(Boston)
train = sample(1:nrow(Boston), nrow(Boston)/2)
tree.boston = tree(medv ~., Boston, subset = train)

summary(tree.boston)
# Note that the output summary() indicates that only three of the variables have been
# used to constructing the tree. In the context of a regression tree,
# the deviance is simply the sum of squared errors for the tree

# Regression Tree
tree(formula = medv ~. , data = Boston, subset = train)

# We now plot the tree
plot(tree.boston)
text(tree.boston, pretty = 0)

cv.boston=cv.tree(tree.boston)
plot(cv.boston$size ,cv.boston$dev ,typ ='b')

#In this case, the most complex tree is selected by cross-validation.
# However, if we wish to prune the tree, we could do so as follows,
#using the prune.tree() function
prune.boston=prune.tree(tree.boston ,best=5)

plot(prune.boston)
text(prune.boston ,pretty=0)

# we use the unpruned tree to make predictions on the test set.
yhat=predict(tree.boston ,newdata=Boston[-train ,])
boston.test=Boston[-train ,"medv"]
plot(yhat,boston.test)

# adding the abline()
abline(0,1)
mean((yhat-boston.test)^2)
