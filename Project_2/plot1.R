
#Reading data into R

NEI <- readRDS("../exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata_data_NEI_data/Source_Classification_Code.rds")

#Aggregating Emission by year

Emission <- aggregate(formula = Emissions ~ year, data = NEI, FUN = sum)

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#Creating the plot1

png("plot1.png", width = 660, height = 660)

barplot(height = Emission$Emissions/1000, names.arg = Emission$year, 
        
        main = expression('Total Emission of PM'[2.5]* ' Emission of year 1999, 2002, 2005, and 2008'), col ='blue',
        
        xlab ='Year', ylab = expression('total PM'[2.5]*' Emission in kilotons'),ylim = c(0,8000))

dev.off()