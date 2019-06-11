library(data.table)
library(lubridate)

full_data <-read.csv('C:/Users/Kyle/Desktop/Data Science coursework/household_power_consumption.txt',header = TRUE, sep = ";")
working_data <- full_data[full_data$Date %in% c("1/2/2007","2/2/2007"),]


working_data$Global_active_power <- as.numeric(as.character(working_data$Global_active_power))



png(width = 480, height = 480, filename = "Plot1.png")
hist(working_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.off()




