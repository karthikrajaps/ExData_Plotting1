data <- read.csv("household_power_consumption.txt", sep=";")
TempDate <- as.Date(data$Date,"%d/%m/%Y")
SubsetData <- subset(data, TempDate >= "2007-02-01" & TempDate <= "2007-02-02")
WD <- weekdays(as.Date(SubsetData$Date,'%d/%m/%Y'))
png("plot2.png", width = 480, height = 480)
DataPlot1 <- as.numeric(as.character(SubsetData$Global_active_power))
plot(DataPlot1, xaxt ='n', type ="l", xlab="", 
     ylab = "Global Active Power (kilowatts)")
axis(1, at = c(1,1441,2881), labels = c("Thu", "Fri", "Sat"))
dev.copy(png, file = "plot2.png")
dev.off()

