
library(sqldf)
#To read from a csv file using a SQL query.
dat <- read.csv.sql("household_power_consumption.txt", sql = "SELECT * from file
WHERE Date in ('1/2/2007' , '2/2/2007') ", sep = ";", header = TRUE)

#combining Date and Time Column into one
Join<-paste(dat$Date,dat$Time)

#Coverting into objects of classes "POSIXlt" and "POSIXct" representing calendar dates and times.
Date_Time<-strptime(Join, "%d/%m/%Y %H:%M:%S")

Adding this column of Date_Time to original Data set
dat<-cbind(dat,Date_Time)

#Open png device,rather then copying as legend size maybe a problem
png(filename = "plot3.png",width = 480, height = 480)

par(mar=c(5,4,4,3))

#First create a plot
plot(dat$Date_Time,dat$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")

#Annotation plot with points
points(dat$Date_Time,dat$Sub_metering_1,type="l",col="Black")
points(dat$Date_Time,dat$Sub_metering_2,type="l",col="Red")
points(dat$Date_Time,dat$Sub_metering_3,type="l",col="Blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2,
       col=c("black", "red", "blue"))

#close png device
dev.off()
