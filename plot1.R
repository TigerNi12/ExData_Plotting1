data <- read.csv("household_power_consumption.txt", sep=";",na.strings="?", stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

filtered_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

png("plot1.png", width = 480, height = 480)
# Global active power histogram
hist(filtered_data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")

dev.off()

