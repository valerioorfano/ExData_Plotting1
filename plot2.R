install.packages("sqldf")
library(sqldf)
myFile <- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
power<- read.csv.sql(myFile, sql=mySql, sep=";")
power$newDate<-paste(power$Date,power$Time)
power$newDate<-strptime(power$newDate,"%d/%m/%Y %H:%M:%S")
plot(power$newDate, power$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab="")
dev.copy(png,file="plot2.png")
dev.off()

