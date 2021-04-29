# Oats Dataset LME Example
library(MASS)
library(nlme)

data(oats)
names(oats) = c('block', 'variety', 'nitrogen', 'yield')
oats$mainplot = oats$variety
oats$subplot = oats$nitrogen
summary(oats)

m1.nlme = lme(yield ~ variety*nitrogen,
              random = ~ 1|block/mainplot,
              data = oats)
summary(m1.nlme)
anova(m1.nlme)
