#Open data.table library as we will be using the fread function
library(data.table)

#Check if data file exists and otherwise download and unzip it
if(!file.exists("ExData_Plotting1/household_power_consumption.txt")) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="ExData_Plotting1/exdata_data_household_power_consumption.zip")
    unzip("ExData_Plotting1/exdata_data_household_power_consumption.zip", exdir="ExData_Plotting1")
}

#Read in the data for the dates February 1-2, 2007
df <- fread("ExData_Plotting1/household_power_consumption.txt", header=FALSE, sep = ";", skip = "1/2/2007",nrows = 2880, 
            col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
                          "Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Create a histogram of the Global Active Power
png("ExData_Plotting1/plot1.png")
hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",
     main = "Global Active Power")
dev.off()
