# 1. Read the data
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# 2. fix the date and time variables
#str(data) #We see that "Date" and "Time" variable classes are Factor!
data$Date <- as.Date(data$Date, format = "%d/%m/%Y") #change the Date class

# 3. subset the required data
Mydata <- subset(data,Date >= "2007-02-01" & Date <= "2007-02-02")
# Convert dates
dateTime <- paste(as.Date(Mydata$Date), Mydata$Time)
Mydata$DateTime <- as.POSIXct(dateTime)

# 4. Plot
Sys.setlocale("LC_ALL", "C") #display day names in English
png(file = "plot3.png", width = 480, height = 480) ## Open PNG device; create 'plot1.png' in my working directory
plot(Mydata$Sub_metering_1~Mydata$DateTime, type="l",ylab="Energy sub metering", xlab="")
lines(Mydata$Sub_metering_2~Mydata$DateTime, type="l",ylab="Energy sub metering", xlab="", col="red")
lines(Mydata$Sub_metering_3~Mydata$DateTime, type="l",ylab="Energy sub metering", xlab="", col="blue")
legend("topright", lty=1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
dev.off() ## Close the PNG file device
