data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
        library(dplyr)
        library(lubridate)
data <-filter(data, Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- dmy(data$Date)
data <- transform(data, timestamp = paste(Date, Time))

data$timestamp <- ymd_hms(data$timestamp)
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

        hist(data$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
        
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
        