#Load data
data <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";", dec = ".")
sset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#initialize necessary values
gap <- sset$Global_active_power
grp <- sset$Global_reactive_power
tdata <- strptime(paste(sset$Date, sset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
s1 <- sset$Sub_metering_1
s2 <- sset$Sub_metering_2
s3 <- sset$Sub_metering_3
volt <- sset$Voltage


#start plotting
png(width = 480, height = 480, filename = "Plot4.png")
par(mfcol = c(2,2))

#Upper Right
plot(tdata, gap, ylab = "Global Active Power (kilowatts)", type = "l")

#lower left
plot(tdata, s1, ylab = "Energy sub metering", type = "l", ylim = c(0,40))
par(new = TRUE)
plot(tdata, s2, ylab = "Energy sub metering", type = "l", col = "red", ylim = c(0,40))
par(new = TRUE)
plot(tdata, s3, ylab = "Energy sub metering", type = "l", col = "blue", ylim = c(0,40))
par(new = FALSE)
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#lower left
plot(tdata, volt, ylab = "Voltage", type = "l")

#lower right
plot(tdata, grp, ylab = "Global Reactive Power (kilowatts)", type = "l")

dev.off()