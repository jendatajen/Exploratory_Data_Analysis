rm(data_full)

#reading data into R

data_full<-read.table('G:/MyCoursera/4_ExploratoryDataAnalysis/exdata_data_household_power_consumption/household_power_consumption.txt',
                 sep=";",nrows= 2075260, header=TRUE, strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?", quote= "")

# Subsetting the full data

sub<- subset(data_full, (data_full$Date == "1/2/2007" | data_full$Date== "2/2/2007"))

# Changing the Date variable from character to Date type

sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")

# Creating the plot1

png("plot1.png", width = 480, height = 480)

hist(sub$Global_active_power, main="Global Active Power",col='red', xlab="Global Active Power(kilowatts)", ylab= "Frequency", type="l")

dev.off()