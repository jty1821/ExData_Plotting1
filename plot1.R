#Setting my working directory where my data set is also saved
setwd("~/Coursera/Exploratory Data/Week 1/Course Project")
datafile <- "household_power_consumption.txt"
datapower <- read.table(datafile, header = TRUE, stringsAsFactors = FALSE, sep = ";", na.strings = "?")

#checking the table
head(datapower)
names(datapower)

#Correcting the class for the variables needed
datapower$Global_active_power = as.numeric(as.character(datapower$Global_active_power))

#Subsetting
subpower <- subset(datapower, datapower$Date == "1/2/2007" | datapower$Date == "2/2/2007")
head(subpower)

#Plotting
hist(subpower$Global_active_power, col = "red", main =  "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#Saving to PNG
png(file = "plot1.png", width=480, height=480)
dev.off()
