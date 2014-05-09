install.packages("sqldf")
library(sqldf)
myFile <- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
power<- read.csv.sql(myFile, sql=mySql, sep=";")
power$newDate<-paste(power$Date,power$Time)
power$newDate<-strptime(power$newDate,"%d/%m/%Y %H:%M:%S")
png("plot1.png", width=480, height=480)
hist(power$Global_active_power, col="red",xlab="Global Active Power (kilowatts)" , main="Global Active Power",bg = "transparent")
dev.off()
