#load data
data <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";", dec = ".")
sset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#initialize necessary values
gap <- sset$Global_active_power

#plot chart
png(width = 480, height = 480, filename = "Plot1.png")
hist(as.numeric(gap), col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
