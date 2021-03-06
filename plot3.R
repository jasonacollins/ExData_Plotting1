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
png("plot3.png", width=480, height=480)
plot(subhpc$DateTime, subhpc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subhpc$DateTime, subhpc$Sub_metering_2, type = "l", col = "red")
lines(subhpc$DateTime, subhpc$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))
dev.off()
