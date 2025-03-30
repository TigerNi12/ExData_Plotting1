data <- read.csv("household_power_consumption.txt", sep=";",stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

filtered_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

globActivePower <- as.numeric(filtered_data$Global_active_power)

filtered_data$DateTime <- strptime(paste(weekdays.Date(filtered_data$Date), filtered_data$Time, sep = " "),format="%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(filtered_data$DateTime, globActivePower, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()