data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

filtered_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

filtered_data$DateTime <- strptime(paste(filtered_data$Date, filtered_data$Time), format="%Y-%m-%d %H:%M:%S")
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))  # 2x2 layout

# Plot 1: Global Active Power
plot(filtered_data$DateTime, filtered_data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

# Plot 2: Voltage
plot(filtered_data$DateTime, filtered_data$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

# Plot 3: Energy Sub Metering
plot(filtered_data$DateTime, filtered_data$Sub_metering_1, type = "l", col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(filtered_data$DateTime, filtered_data$Sub_metering_2, col = "red")
lines(filtered_data$DateTime, filtered_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

# Plot 4: Global Reactive Power
plot(filtered_data$DateTime, filtered_data$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global Reactive Power")

dev.off()