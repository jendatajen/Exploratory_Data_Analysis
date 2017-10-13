rm(data_full)

#reading data into R

data_full<-read.table('G:/MyCoursera/4_ExploratoryDataAnalysis/exdata_data_household_power_consumption/household_power_consumption.txt',
                      sep=";",nrows= 2075260, header=TRUE, strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?", quote= "")

# Subsetting the full data

sub<- subset(data_full, (data_full$Date == "1/2/2007" | data_full$Date== "2/2/2007"))

# Changing the Date variable from character to Date type

sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")

# Combining the Date and Time variable and creating a new column in dataset named Datatime

sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))

# Creating the plot4

png("plot4.png", width = 480, height = 480)

par(mfcol=c(2,2))

plot(sub$DateTime, sub$Global_active_power, xlab="", ylab= "Global Active Power", type="l")

plot(sub$DateTime, sub$Sub_metering_1, xlab="", ylab= "Energy sub metering", type="l")

lines(sub$DateTime, sub$Sub_metering_2,  col="red", type="l" )

lines(sub$DateTime, sub$Sub_metering_3,  col="blue", type="l" )

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(sub$DateTime,sub$Voltage, xlab="datetime", ylab="Voltage", type="l")

plot(sub$DateTime,sub$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()