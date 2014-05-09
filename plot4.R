#This R code generates a Histogramm of the Global activ power
#for the first two days of February 2007

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


#Writing to a png file
png(filename = "plot4.png", width = 480, height = 480)

#4 plots
par(mfrow = c(2,2))


#plot the data while specifying other options as well
plot(DateTime, data$Global_active_power, xlab = "", 
     ylab = "Global active power (kilowatts)", type = "l")

plot(DateTime, data$Voltage, xlab = "datetime", 
     ylab = "Voltage", type = "l")

plot(DateTime, data$Sub_metering_1, xlab = "", 
     ylab = "Energy sub metering", type = "n")

lines(DateTime, data$Sub_metering_1, col = "black")
lines(DateTime, data$Sub_metering_2, col = "red")
lines(DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), bty ="n")

plot(DateTime, data$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power", type = "l")


dev.off()