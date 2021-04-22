data(cars)
cars.lo <- loess(dist ~ speed, cars)
predict(cars.lo, data.frame(speed = seq(5, 30, 1)), se = TRUE)

# to allow extrapolation
cars.lo2 <- loess(dist ~ speed, cars, control = loess.control(surface = "direct"))
predict(cars.lo2, data.frame(speed = seq(5, 30, 1)), se = TRUE)

students_and_performance <- read.csv(file.choose(), header = TRUE, sep = ";") 
summary(students_and_performance)

students_and_performance$school <- as.numeric(as.factor(students_and_performance$school))
students_and_performance$address <- as.numeric(as.factor(students_and_performance$address))
students_and_performance$Pstatus <- as.numeric(as.factor(students_and_performance$Pstatus))
students_and_performance$Mjob <- as.numeric(as.factor(students_and_performance$Mjob))
students_and_performance$Fjob <- as.numeric(as.factor(students_and_performance$Fjob))
students_and_performance$reason <- as.numeric(as.factor(students_and_performance$reason))
students_and_performance$guardian <- as.numeric(as.factor(students_and_performance$guardian))
students_and_performance$schoolsup <- as.numeric(as.factor(students_and_performance$schoolsup))
students_and_performance$famsup <- as.numeric(as.factor(students_and_performance$famsup))
students_and_performance$paid <- as.numeric(as.factor(students_and_performance$paid))
students_and_performance$activities <- as.numeric(as.factor(students_and_performance$activities))
students_and_performance$nursery <- as.numeric(as.factor(students_and_performance$nursery))
students_and_performance$higher <- as.numeric(as.factor(students_and_performance$higher))
students_and_performance$internet <- as.numeric(as.factor(students_and_performance$internet))
students_and_performance$romantic <- as.numeric(as.factor(students_and_performance$romantic))

students_and_performance.lo <- loess(school ~ G1, students_and_performance)
predict(students_and_performance.lo, data.frame( = seq(5, 30, 1)), se = TRUE)
