# Dplyr for Data Manipulating
# Tidyr for Data Cleaning

# Dplyr 
install.packages('dplyr')
install.packages('nycflights13')

library(dplyr)
library(nycflights13)
head(flights)
summary(flights)

# filter() function in dplyr allows us to select a subset of rows in a dataframe.
# it allows us to filter by conditions
filter(flights,month == 10, day == 4, carrier =='AA')
head(filter(flights, month == 10, day == 4, carrier == 'AA'))

# slice() function  allows us to select rows by the position
slice(flights, 1:15) # selecting first 15 rows

# arrange() function works similar to filter() function except that instead of filtering or selcting rows, it reorder the rows
arrange(flights,year,month,day, arr_time)
head(arrange(flights,year,month,day,arr_time))
# if I want to use the descending time instead of accending time, 
head(arrange(flights,year,month,day, desc(arr_time)))

# select()
select(flights,carrier)
head(select(flights,carrier))
# We can add aditional columns easily 

head(select(flights, carrier, arr_time))
head(select(flights, carrier, arr_time, day))
head(rename(flights, airline.carrier = carrier))

# distinct() function in dplyr helps us to select the distinct or unique values in a column.
distinct(select(flights, carrier))

# in addition to selecting sets of existing columns in the dataframe, sometimes 
# we need to add new columns that are functions of existing columns in the dataframe.
# we can use the mutate() function to do that.
help("mutate")
head(mutate(flights, MyNewColumn = arr_delay - dep_delay))

# If you only want to see the new column instead of calling the mutate, you can 
# use the transmute() fuction.
# The difference between the mutate() and transmute() is that mutate() function returns
# the entire dataframe along with the new column and the transmute() shows only the new column.
head(transmute(flights, MyNewColumn = arr_delay - dep_delay))

# The summarize() allows us to summarize the data frame into a single row using another aggrigate function
summarise(flights, avg_air_time = mean(air_time, na.rm = TRUE)) # average airtime
summarise(flights, TotalFlightTime = sum(air_time, na.rm = TRUE)) # Total Flight Time

# sample_n() function allows us to pick random number of rows that we wish to choose:
sample_n(flights, 15) # random 15 rows. 
sample_n(flights, 71) # random 71 rows. 

# if you wan to pick a percentage of rows, sample_frac() function allow us to do that,
# you need to assign the fraction, example: 30% = 0.3, similaly 10% = 0.1
sample_frac(flights,0.1) # sample with a 10% of rows from the total number of rows 
sample_frac(flights, 0.3) # sample with a 30% of rows from the total number of rows 
sample_frac(flights, 0.7)
sample_n(flights, 30)
sample_frac(flights, 0.5)

# dbl stands for doubles, or real numbers.
# dttm stands for date-times (a date + a time).

library(dplyr)
df_mtcars <- mtcars
head(df_mtcars)

# nesting 
filter(df_mtcars, mpg > 20) # filter mpg > 20

# we want to get 10 samples of that
sample_n(filter(df_mtcars, mpg > 20), 10)

# now we want to arrange them in the descending order based on the mpg
arrange( sample_n(filter(df_mtcars, mpg >20), 10) ,desc(mpg))

# we can assign this result to a variable called results_mpg
results_mpg <- arrange( sample_n(filter(df_mtcars, mpg >20), 10) ,desc(mpg))
results_mpg 

# You can do the same thing what you did above by multiple assignments
a1 <- filter(df_mtcars, mpg >20)
a2 <- sample_n(a1, 5) # getting a random sample of 5
results_mpg_des <- arrange(a2, desc(mpg))
results_mpg_des

# instead of using the multiple assignments, you can use the Pipe Operator to 
# do the above in a single line.

library(dplyr) # pipe operator is a part of dplyr library.

# You can do the above using the Pipe Operator %>%
# Example:  dataFrame %>% operation1 %>% operation2 %>% operation3
df_mtcars %>% filter(mpg >20) %>% sample_n(size = 5) %>% arrange(desc(mpg))
results <- df_mtcars %>% filter(mpg >20) %>% sample_n(5) %>% arrange(desc(mpg))
results
