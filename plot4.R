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

time <- strptime(paste(df$Date,df$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Create all four plots
png("ExData_Plotting1/plot4.png")
par(mfrow = c(2,2))
plot(time,df$Global_active_power,type = "l", col="black", xlab ="",ylab = "Global Active Power")
plot(time,df$Voltage, type = "l", col = "black", xlab = "datetime",ylab = "Voltage")
plot(time, df$Sub_metering_1,xlab = "",ylab="Global Active Power (kilowatts)", type = "n")
lines(time,df$Sub_metering_1,col="black")
lines(time,df$Sub_metering_2,col="red")
lines(time,df$Sub_metering_3,col="blue")
legend("topright",col = c("black","red","blue"),lty = c(1,1,1),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(time,df$Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()

