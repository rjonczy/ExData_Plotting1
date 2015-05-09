### load data ###
power <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors=F, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

power$Time <- strptime(paste(power$Date, power$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# subset only observertions between 2007-02-01 and 2007-02-02
power.s <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

#release memory
rm(power)

# set 2 x 2 plots
par(mfrow = c(2, 2))

### plot data ###
with(power.s, {
    plot(Global_active_power ~ as.POSIXct(Time), type = "l", xlab="", ylab="Global Active Power")
    plot(Voltage ~ as.POSIXct(Time), type = "l", xlab="datetime", ylab="Voltage")
    plot(Sub_metering_1 ~ as.POSIXct(Time), type = "l", xlab="", ylab="Energy sub metering")
        lines(Sub_metering_2 ~ as.POSIXct(Time), col = "red")
        lines(Sub_metering_3 ~ as.POSIXct(Time), col = "blue")
    legend("topright",  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")
    plot(Global_reactive_power ~ as.POSIXct(Time), type = "l", xlab="datetime", ylab="Global_Reactive_Power")
    
})

#save to plot4.png file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
