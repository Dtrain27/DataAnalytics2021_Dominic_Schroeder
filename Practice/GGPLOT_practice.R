library('ggplot2')
library('dplyr')
attach(diamonds)
?diamonds
ggplot(data=diamonds) + geom_bar(mapping = aes(x = cut))
dplyr::count(): 
    diamonds %>% 
      count(cut)

