#Load raw data from current directory
hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#Convert date to 
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

#Create subset of relevant dates
subhpc <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")

#Create plot directly to png file
png("plot1.png", width=480, height=480)
hist(subhpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
