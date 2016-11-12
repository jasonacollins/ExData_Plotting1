#Load raw data from current directory
hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#Convert date
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

#Create subset of relevant dates
subhpc <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")

#Convert time
subhpc$DateTime <- paste(subhpc$Date, subhpc$Time)
subhpc$DateTime <- strptime(subhpc$DateTime, format = "%Y-%m-%d %H:%M:%S")

#Create plot directly to png file
png("plot2.png", width=480, height=480)
plot(subhpc$DateTime, subhpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
