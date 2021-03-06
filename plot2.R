install.packages("sqldf")
library(sqldf)
myFile <- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
power<- read.csv.sql(myFile, sql=mySql, sep=";")
power$newDate<-paste(power$Date,power$Time)
power$newDate<-strptime(power$newDate,"%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(power$newDate, power$Global_active_power, type="l", ylab="Global Active Power (Kilowatts)", xlab="",bg = "transparent")
dev.off()

