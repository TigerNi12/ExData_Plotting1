data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

filtered_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

filtered_data$Sub_metering_1 <- as.numeric(filtered_data$Sub_metering_1)
filtered_data$Sub_metering_2 <- as.numeric(filtered_data$Sub_metering_2)
filtered_data$Sub_metering_3 <- as.numeric(filtered_data$Sub_metering_3)

filtered_data$DateTime <- strptime(paste(filtered_data$Date, filtered_data$Time), 
                                     format="%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(filtered_data$DateTime, filtered_data$Sub_metering_1, 
     type = "l", col = "black",
     xlab = "", ylab = "Energy Sub Metering")

lines(filtered_data$DateTime, filtered_data$Sub_metering_2, col = "red")
lines(filtered_data$DateTime, filtered_data$Sub_metering_3, col = "blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, cex = 0.8)

dev.off()