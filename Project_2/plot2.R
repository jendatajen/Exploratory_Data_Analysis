#Reading data into R

NEI <- readRDS("../exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata_data_NEI_data/Source_Classification_Code.rds")

# NEI data for Baltimore City

NEI_Baltimore <- NEI[NEI$fips == "24510",]

#Aggregating Emission by year

Emission_Baltimore <- aggregate(formula = Emissions ~ year, data = NEI_Baltimore, FUN = sum)

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

#Creating the plot2

png("plot2.png", width = 660, height = 660)

barplot(height = Emission_Baltimore$Emissions/1000, names.arg = Emission_Baltimore$year, 
        
        main = expression('Total Emission of PM'[2.5]* ' Emission in Baltimore City, MD'), col ='blue',
        
        xlab ='Year', ylab = expression('total PM'[2.5]*' Emission in kilotons'),ylim = c(0,4))

dev.off()