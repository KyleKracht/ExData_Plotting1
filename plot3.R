library(data.table)
library(lubridate)

full_data <-read.csv('C:/Users/Kyle/Desktop/Data Science coursework/household_power_consumption.txt',header = TRUE, sep = ";")
working_data <- full_data[full_data$Date %in% c("1/2/2007","2/2/2007"),]


working_data$Global_active_power <- as.numeric(as.character(working_data$Global_active_power))

#working_data$Time <- strptime(working_data$Time, format = "%H:%M:%S")

working_data$DateTime <- as.POSIXct(paste(working_data$Date, working_data$Time), format="%d/%m/%Y %H:%M:%S")


working_data$Sub_metering_1 <- as.numeric(working_data$Sub_metering_1)
working_data$Sub_metering_2 <- as.numeric(working_data$Sub_metering_2)
working_data$Sub_metering_3 <- as.numeric(working_data$Sub_metering_3)



png(width = 480, height = 480, filename = "Plot3.png")
par(pch=20, col ="black")
plot( working_data$DateTime,  working_data$Sub_metering_1, type = "n", ylab = "Energy Sub Metering", xlab = "" )#, xlim=c(as.POSIXct('2007/02/01 00:00:00', format="%Y/%m/%d %H:%M:%S"), as.POSIXct('2007/02/02 19:00:00', format="%Y/%m/%d %H:%M:%S")))

lines(working_data$DateTime,  working_data$Sub_metering_1, type ="l")
lines(working_data$DateTime, working_data$Sub_metering_2, type ="l", col = "red")
lines(working_data$DateTime, working_data$Sub_metering_3, type ="l", col = "blue")
legend("topright", legend=c("Sub Metering 1", "Sub Metering 2","Sub Metering 3"),
       col=c("black","red", "blue"), lty = 1)
dev.off()



