##  Plot3

## This part for Load data from source File to R

##Load Data from ; Deilmeter File
source_data=read.csv('household_power_consumption.txt',header=T, sep=';') 

##Create Time Stamp Column
source_data$Datetime = paste(as.character(source_data[,1]) , source_data[,2]) 

## Convert Data Type 
## Date Convertion
source_data$Date <- as.Date(source_data$Date, format = "%d/%m/%Y")
## Integer convertion
source_data$Global_active_power <- as.numeric(as.character(source_data$Global_active_power))
## DateTime Covertion
source_data$Datetime<-strptime(source_data$Datetime, '%d/%m/%Y %H:%M')

## This part For Filter Data

use_data <- source_data[source_data$Date == "2007-02-02" | source_data$Date == "2007-02-01",] 

## This part to Plot Data to graph
png("plot3.png")
plot(use_data$Datetime, as.numeric(use_data$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(use_data$Datetime, as.numeric(use_data$Sub_metering_2), type="l", col="red")
lines(use_data$Datetime, as.numeric(use_data$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()