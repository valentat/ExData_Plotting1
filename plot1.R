# Exploratory Data Analysis: Course project 1
# Plot 1

# Read the desired portion of the data
fname <- "household_power_consumption.txt"
data <- read.csv2(fname, nrows = 1)
data <- read.csv2(fname, na.strings = "?", col.names = colnames(data),
                  skip = 66637, nrows = 69517 - 66637, header = FALSE,
                  colClasses = c(rep("character", 2), rep("numeric", 7)),
                  stringsAsFactors = FALSE, dec=".")
data$DateTime <- strptime(paste(data$Date, data$Time),
                          "%d/%m/%Y %H:%M:%S")

# Draw Plot 1
png(file = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
