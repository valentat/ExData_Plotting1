# Exploratory Data Analysis: Course project 1
# Plot 3

# Read the desired portion of the data
fname <- "household_power_consumption.txt"
data <- read.csv2(fname, nrows = 1)
data <- read.csv2(fname, na.strings = "?", col.names = colnames(data),
                  skip = 66637, nrows = 69517 - 66637, header = FALSE,
                  colClasses = c(rep("character", 2), rep("numeric", 7)),
                  stringsAsFactors = FALSE, dec=".")
data$DateTime <- strptime(paste(data$Date, data$Time),
                          "%d/%m/%Y %H:%M:%S")

# Draw Plot 3
# X-axis values (day of week names) are locale-specific
png(file = "plot3.png", width = 480, height = 480)
plot(data$DateTime,
     data$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = NA,
     ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)
dev.off()
