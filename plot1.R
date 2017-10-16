#################################
## Plot 1: Global Active Power ##
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

# Take the Global_active_power column. 
globalActivePower <- as.numeric(subset$Global_active_power)

# Create PNG file.
png("plot1.png", width=480, height=480)

# Create histogram using the Global Active Power data. 
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close the plot. 
dev.off()
