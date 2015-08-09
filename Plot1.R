##  Plot1 

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
  
## This part For Filter Data
  
  use_data <- source_data[source_data$Date == "2007-02-02" | source_data$Date == "2007-02-01",] 

## Thuis part to Plot Data to graph
  png("plot1.png")
  hist(use_data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power") ##Creates the Histogram
  dev.off()