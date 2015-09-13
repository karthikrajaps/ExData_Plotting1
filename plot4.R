data <- read.csv("household_power_consumption.txt", sep=";")
TempDate <- as.Date(data$Date,"%d/%m/%Y")
SubsetData <- subset(data, TempDate >= "2007-02-01" & TempDate <= "2007-02-02")
WD <- weekdays(as.Date(SubsetData$Date,'%d/%m/%Y'))
png("plot4.png", width = 480, height = 480)

DataPlot1 <- as.numeric(as.character(SubsetData$Global_active_power))
DataPlot2 <- as.numeric(as.character(SubsetData$Sub_metering_1))
DataPlot3 <- as.numeric(as.character(SubsetData$Sub_metering_2))
DataPlot4 <- as.numeric(as.character(SubsetData$Sub_metering_3))
DataPlot5 <- as.numeric(as.character(SubsetData$Voltage))
DataPlot6 <- as.numeric(as.character(SubsetData$Global_reactive_power))

par(mfcol = c(2,2), mar = c(4,4,2,2))
plot(DataPlot1, xaxt ='n', type ="l", xlab="", 
     ylab = "Global Active Power")
axis(1, at = c(1,1441,2881), labels = c("Thu", "Fri", "Sat"))


plot(1:2880, DataPlot2, xaxt ='n', type ="l", xlab="", col = 1:3,
     ylab = "Energy sub metering")
lines(DataPlot3, col = "red")
lines(DataPlot4, col = "blue")
axis(1, at = c(1,1441,2881), labels = c("Thu", "Fri", "Sat"))
legend("topright", lwd=2.0, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(DataPlot5, xaxt ='n', type ="l", xlab="datetime", 
     ylab = "Voltage")
axis(1, at = c(1,1441,2881), labels = c("Thu", "Fri", "Sat"))

plot(DataPlot6, xaxt ='n', type ="l", xlab="datetime", 
     ylab = "Global_reactive_power (kilowatts)")
axis(1, at = c(1,1441,2881), labels = c("Thu", "Fri", "Sat"))


dev.copy(png, file = "plot4.png")
dev.off()
