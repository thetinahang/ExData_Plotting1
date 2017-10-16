#################################
## Plot 3: Energy sub metering ##
#################################

# Each plot has to a PNG file, width of 480 pixels and height of 480 pixels. 
# Name each of the plot files as plot1.png, plot2.png, etc.
# Create a separate R code file (plot1.R, plot2.R, etc.) 
# that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot.

#### Start ####

# Clear
rm(list=ls())

# Load in file.
file <- "./household_power_consumption.txt"

# Read in data. 
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Only use dates 2007-02-01 and 2007-02-02.
# One alternative is to read the data from just those dates
# rather than reading in the entire dataset and subsetting to those dates.
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] # Convert the dates.

# Convert the dates and times.
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Take the Global_active_power column. 
#globalActivePower <- as.numeric(subset$Global_active_power)

# Create the submetering. 
submetering1 <- as.numeric(subset$Sub_metering_1)
submetering2 <- as.numeric(subset$Sub_metering_2)
submetering3 <- as.numeric(subset$Sub_metering_3)

# Create PNG file.
png("plot3.png", width=480, height=480)

# Create line graph using the submetering data. 
plot(datetime, submetering1, type="l", xlab="", ylab="Energy submetering")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")

# Add a legend to the plot. 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


# Close the plot. 
dev.off()
