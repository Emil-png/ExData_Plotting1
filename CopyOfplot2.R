datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header= TRUE, sep= ";", stringsAsFactors = FALSE, dec= ".")
Date <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#str (Date)
datetime <-  strptime(paste(Date$Date, Date$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(Date$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(datetime, globalActivePower, type = "l", main = "Global Active Power", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
