#Load data
data <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";", dec = ".")
sset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#initialize necessary values
s1 <- sset$Sub_metering_1
s2 <- sset$Sub_metering_2
s3 <- sset$Sub_metering_3
tdata <- strptime(paste(sset$Date, sset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot chart
png(width = 480, height = 480, filename = "Plot3.png")
plot(tdata, s1, ylab = "Energy sub metering", type = "l", ylim = c(0,40))
par(new = TRUE)
plot(tdata, s2, ylab = "Energy sub metering", type = "l", col = "red", ylim = c(0,40))
par(new = TRUE)
plot(tdata, s3, ylab = "Energy sub metering", type = "l", col = "blue", ylim = c(0,40))
dev.off()
