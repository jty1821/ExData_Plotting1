#Setting my working directory where my data set is also saved
setwd("~/Coursera/Exploratory Data/Week 1/Course Project")
datafile <- "household_power_consumption.txt"
datapower <- read.table(datafile, header = TRUE, stringsAsFactors = FALSE, sep = ";", na.strings = "?")

#checking the table
head(datapower)
names(datapower)

#Subsetting
subpower <- subset(datapower, datapower$Date == "1/2/2007" | datapower$Date == "2/2/2007")
head(subpower)

#Correcting the class for the variables needed
datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subpower$Global_active_power)
globalReactivePower <- as.numeric(subpower$Global_reactive_power)
voltage <- as.numeric(subpower$Voltage)
subMetering1 <- as.numeric(subpower$Sub_metering_1)
subMetering2 <- as.numeric(subpower$Sub_metering_2)
subMetering3 <- as.numeric(subpower$Sub_metering_3)

#creating the setup for the plot
par(mfrow = c(2,2))

#plotting the graph
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#converting to PNG
png(file = "plot4.png", width=480, height=480)
dev.off()
