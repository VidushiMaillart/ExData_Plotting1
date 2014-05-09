#This R code generates a Histogramm of the Global activ power
#for the first two days of February 2007

#We define the column names by this list, because we are skipping lines while reading
colnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
              "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
              "Sub_metering_3")


#Only the required data is read
data <- read.table("./household_power_consumption.txt", header = FALSE, 
                   sep = ";", col.names = colnames, nrows = 2880, skip = 66637)

#We create a histogramm but don't plot it
w <- hist(data$Global_active_power, plot = FALSE)

#We plot the histogramm while specifying other options as well
plot(w, col = "red", xlab = "Global active power (kilowatts)", main = "Global activ power")

#Copy my plot to a PNG file
dev.copy(png, file = "plot1.png")
dev.off()