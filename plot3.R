install.packages("sqldf")
library(sqldf)
myFile <- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
power<- read.csv.sql(myFile, sql=mySql, sep=";")
power$newDate<-paste(power$Date,power$Time)
power$newDate<-strptime(power$newDate,"%d/%m/%Y %H:%M:%S")
plot(power$newDate, power$Sub_metering_1, type="n",xlab="", ylab="Energy sub metering",bg = "transparent")
points(power$newDate, power$Sub_metering_1, type="l", col="black")
points(power$newDate, power$Sub_metering_2, type="l", col="red")
points(power$newDate, power$Sub_metering_3, type="l", col="blue")
legend("topright",lty=1,cex=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()

