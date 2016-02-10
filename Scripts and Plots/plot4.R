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

        par(mfrow=c(2,2))
        
        plot(data$timestamp, data$Global_active_power, xlab="", ylab="Global Active Power", type = "l")        
        
        plot(data$timestamp, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
        
        plot(data$timestamp, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
        lines(data$timestamp, data$Sub_metering_2, col="red")
        lines(data$timestamp, data$Sub_metering_3, col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1), bty="n", cex=.25)
        
        plot(data$timestamp, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
        
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
