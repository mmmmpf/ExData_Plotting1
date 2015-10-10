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
png(file = "plot2.png", width = 480, height = 480) ## Open PNG device; create 'plot1.png' in my working directory
plot(Mydata$Global_active_power~Mydata$DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off() ## Close the PNG file device
