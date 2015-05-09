### load data ###
power <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors=F, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

power$Time <- strptime(paste(power$Date, power$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# subset only observertions between 2007-02-01 and 2007-02-02
power.s <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

#release memory
rm(power)

### plot data ###
hist(power.s$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#save to plot1.png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()

