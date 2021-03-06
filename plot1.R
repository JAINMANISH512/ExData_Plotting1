

#package for SQL query.
library(sqldf)

#To read from a csv file using a SQL query
dat <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file
WHERE Date in ('1/2/2007' , '2/2/2007') ", sep = ";", header = TRUE)

#Priting a Histogram Plot
hist(dat$Global_active_power,main="Global Active Power",xlab="Global active power (kilowatts)",col="Red")

#Copy to png device png device
dev.copy(png,filename = "plot1.png",width = 480, height = 480)

#close png device
dev.off()
