#This R code generates a png file with a line plot

#We define the column names by this list, because we are skipping lines while reading
colnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
              "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
              "Sub_metering_3")


#Only the required data is read
data <- read.table("./household_power_consumption.txt", header = FALSE, 
                   sep = ";", col.names = colnames, nrows = 2880, skip = 66637)



#Conversion to day names
DateTime <- paste(data$Date, data$Time, sep = " ")
DateTime <- strptime(DateTime, format = "%d/%m/%Y %H:%M:%S")


#plot the data while specifying other options as well
plot(DateTime, data$Global_active_power, xlab = "", 
     ylab = "Global active power (kilowatts)", type = "l")

#Copy my plot to a PNG file
dev.copy(png, file = "plot2.png")
dev.off()