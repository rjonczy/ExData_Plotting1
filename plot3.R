### load data ###
power <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors=F, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

power$Time <- strptime(paste(power$Date, power$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# subset only observertions between 2007-02-01 and 2007-02-02
power.s <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

#release memory
rm(power)

### plot data ###
with(power.s, {
     plot(Sub_metering_1 ~ as.POSIXct(Time), type = "l", xlab="", ylab="Energy sub metering")
     lines(Sub_metering_2 ~ as.POSIXct(Time), col = "red")
     lines(Sub_metering_3 ~ as.POSIXct(Time), col = "blue")
     })

legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save to plot3.png file
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
