EPI <- as.numeric(EPI_data$EPI)
EPI
summary(EPI) 	# stats
fivenum(EPI,na.rm=TRUE)

help(stem)
# Begin piping the text for the stem plot to a file
sink(file="EPI_Stem_Plot.txt")
stem(EPI)		 # stem and leaf plot
# Stop piping to a file
sink(file=NULL)

help(hist)
hist(EPI)
hist(EPI, seq(30., 95., 1.0), prob=TRUE)

help(lines)
lines(density(EPI,na.rm=TRUE,bw=1.))

help(rug)
rug(EPI) 

