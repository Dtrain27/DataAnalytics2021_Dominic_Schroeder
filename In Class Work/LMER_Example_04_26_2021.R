install.packages("lme4")
install.packages("lmer")
library(lme4)
library(lmer)
library(MASS)
# lmer() available to you, which is the mixed model equivalent of the function lm()

# obtain the data
politeness<-read.csv("http://www.bodowinter.com/uploads/1/2/9/3/129362560/politeness_data.csv")
politeness
# you will see that there there is a missing value in row 39

which(is.na(politeness$frequency))

boxplot(frequency ~ attitude*gender,col=c("white","lightgray"),politeness)
politeness.model = lmer(frequency ~ attitude + (1|subject) + (1|scenario), data=politeness)
summary(politeness.model)