data <- read.csv("household_power_consumption.txt", sep=";")
TempDate <- as.Date(data$Date,"%d/%m/%Y")
SubsetData <- subset(data, TempDate >= "2007-02-01" & TempDate <= "2007-02-02")
png("plot1.png", width = 480, height = 480)
DataPlot1 <- as.numeric(as.character(SubsetData$Global_active_power))
hist(DataPlot1, col = "red", xlab = "Global Active Power (kilowatts)", 
     ylab ="Frequency", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()