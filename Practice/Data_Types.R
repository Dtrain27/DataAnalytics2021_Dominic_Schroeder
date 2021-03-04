#Logical Data types

bool <- TRUE
print(class(bool))

#Numerics

num <- 23.5
print(class(num))

#Vectors
#c combines the elements vectors
apple <- c('red','green','yellow')
print(class(apple))

#lists
list1 <- list(c(2,3,5),21.3,sin)
print(list1)

#Matrices
M = matrix( c('a','a','b','c','b','a'), nrow=2, ncol = 3, byrow = TRUE)
print(M)

#arrays
a <- array(c('green', 'yellow'), dim = c(3,3,2))
print(a)

#Factors
