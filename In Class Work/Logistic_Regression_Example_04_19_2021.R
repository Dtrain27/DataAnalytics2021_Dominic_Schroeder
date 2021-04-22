# Logisitic regression in class work

library(ISLR)

data("Smarket")
head(Smarket)

# data set consists of percentage returns for the S&P 500 stock index over 1, 250 days, from the
# beginning of 2001 until the end of 2005
names(Smarket)

dim(Smarket)
summary(Smarket)
cor(Smarket[,-9])
attach(Smarket)
plot(Volume)

help("glm")

glm.fit.model1 = glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume, data = Smarket, family = binomial)
summary(glm.fit.model1)

glm.probs <- predict(glm.fit.model1, type="response")
glm.probs[1:10]
contrasts(Direction)

glm.pred <- rep("Down", 1250) # this command creates a vector of 1,250 "Down" elements
glm.pred[glm.probs > 0.5] = "Up"

table(glm.pred, Direction)

mean(glm.pred == Direction)

# Next, in order to implement this strategy, we will first create a vector corresponding
# to the observations from 2001 through 2004. We will then use this vector
# to create a held out data set of observations from 2005.
train <- (Year <2005)
Smarket.2005 = Smarket[!train,]
dim(Smarket.2005)
Direction.2005 <- Direction[!train]

# We now we will fit a logistic regression model using only the subset of the observations
# that correspond to dates before 2005, using the subset argument.
glm.fit.model2 <- glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 +Volume, data=Smarket,
                      family = binomial, subset = train)
glm.prob2 = predict(glm.fit.model2, Smarket.2005, type="response")

# Finally, we compute the predictions for 2005 and compare them to the actual movements
# of the market over that time period.
glm.pred2 <- rep("Down", 252)
glm.pred2[glm.prob2 > 0.5] = "Up"
table(glm.pred2, Direction.2005)

mean(glm.pred2 == Direction.2005)
mean(glm.pred2 != Direction.2005)

# Model 3
glm.fit.model3 <- glm(Direction ~ Lag1 + Lag2, data = Smarket, family = binomial,
                      subset = train)
glm.probs3 <- predict(glm.fit.model3, Smarket.2005, type = "response")
glm.pred3 <- rep("Down", 252)
glm.pred3[glm.probs3 > 0.5] = "Up"
table(glm.pred3, Direction.2005)
mean(glm.pred3 == Direction.2005)
