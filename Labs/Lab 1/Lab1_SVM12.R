# load the kernlab package
library(kernlab)

data(spam)
attach(spam)

ytrain <- as.factor(spam$type)
xtrain <- as.matrix(spam[,-58])

# train the SVM
svp <- ksvm(xtrain,ytrain,type="C-svc",kernel='vanilladot',C=100,scaled=c())

# General summary
svp

# Attributes that you can access
attributes(svp)

# For example, the support vectors
alpha(svp)
alphaindex(svp)
b(svp)

# Use the built-in function to pretty-plot the classifier
plot(svp,data=xtrain)
