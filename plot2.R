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
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
subpower[1:1440, "Time"]
#plotting the graph
plot(subpower$Time, as.numeric(as.character(subpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")

#Saving to PNG
png(file = "plot2.png", width=480, height=480)
dev.off()

