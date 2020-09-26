datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header= TRUE, sep= ";", stringsAsFactors = FALSE, dec= ".")
Date <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]


#transform data to numeric
datetime <-  strptime(paste(Date$Date, Date$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(Date$Global_active_power)
globalReactivePower <- as.numeric(Date$Global_reactive_power)
subMetering1 <- as.numeric(Date$Sub_metering_1)
subMetering2 <- as.numeric(Date$Sub_metering_2)
subMetering3 <- as.numeric(Date$Sub_metering_3)
Voltage <- as.numeric(Date$Voltage)


#par
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2, 2))



#plots
##Global Active Power
plot(datetime, globalActivePower, type = "l", main = "Global Active Power", xlab = "", ylab = "Global Active Power ", cex = 0.2)


##Voltage
plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

##Sub metering 
plot(datetime, subMetering1, type = "l", xlab = "", ylab = "Energy sub Metering")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "o")


##Global Reactive Power
plot(datetime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()