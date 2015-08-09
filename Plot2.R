##  Plot2

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
png("plot2.png")
plot(use_data$Datetime, use_data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)" , xlab = "")
dev.off()