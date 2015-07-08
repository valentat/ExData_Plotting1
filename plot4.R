# Exploratory Data Analysis: Course project 1
# Plot 4

# Read the desired portion of the data
fname <- "household_power_consumption.txt"
data <- read.csv2(fname, nrows = 1)
data <- read.csv2(fname, na.strings = "?", col.names = colnames(data),
                  skip = 66637, nrows = 69517 - 66637, header = FALSE,
                  colClasses = c(rep("character", 2), rep("numeric", 7)),
                  stringsAsFactors = FALSE, dec=".")
data$DateTime <- strptime(paste(data$Date, data$Time),
                          "%d/%m/%Y %H:%M:%S")

# Draw Plot 4
# X-axis values (day of week names) are locale-specific
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(data, {

plot(DateTime,
     Global_active_power,
     type = "l",
     xlab = NA,
     ylab = "Global Active Power")

plot(DateTime,
     Voltage,
     type = "l")

plot(DateTime,
     Sub_metering_1,
     type = "l",
     col = "black",
     xlab = NA,
     ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

plot(DateTime,
     Global_reactive_power,
     type = "l")

})
dev.off()
