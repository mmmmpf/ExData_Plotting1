# 1. Read the data
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# 2. fix the date and time variables
#str(data) #We see that "Date" and "Time" variable classes are Factor!
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") #change the Date class
data$timetemp <- paste(data$Date, data$Time)  
data$Time <- strptime(data$timetemp, format = "%Y-%m-%d %H:%M:%S")  #change the Time class to POSIX

# 3. subset the required data
Mydata <- subset(data,Date >= "2007-02-01" & Date <= "2007-02-02")

# 4. Plot
png(file = "plot1.png", width = 480, height = 480) ## Open PNG device; create 'plot1.png' in my working directory
hist(Mydata$Global_active_power,col='red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off() ## Close the PNG file device
