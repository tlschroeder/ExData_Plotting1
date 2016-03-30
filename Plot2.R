#Load data
data <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";", dec = ".")
sset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#initialize necessary values
gap <- sset$Global_active_power
tdata <- strptime(paste(sset$Date, sset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create chart
png(width = 480, height = 480, filename = "Plot2.png")
plot(tdata, gap, ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()