
library(sqldf)
#To read from a csv file using a SQL query
dat <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file
WHERE Date in ('1/2/2007' , '2/2/2007') ", sep = ";", header = TRUE)

#combining Date and Time Clumn into one
Join<-paste(dat$Date,dat$Time)

#Coverting into objects of classes "POSIXlt" and "POSIXct" representing calendar dates and times.
Date_Time<-strptime(Join, "%d/%m/%Y %H:%M:%S")

#Adding this column of Date_Time to original Data set
dat<-cbind(dat,Date_Time)

#To Generate the requireD plot
with(dat,plot(Date_Time,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l"))

#Copy to png device png device
dev.copy(png,filename = "plot2.png",width = 480, height = 480)

#close png device
dev.off()
