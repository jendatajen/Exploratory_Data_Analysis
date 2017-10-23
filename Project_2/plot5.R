library(ggplot2)

#Reading data into R

NEI <- readRDS("../exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata_data_NEI_data/Source_Classification_Code.rds")

#NEI data for Baltimore City
NEI_Baltimore_Mot <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]

#Aggregating Emission Baltimore City

Emission_Baltimore_Mot <- aggregate(formula = Emissions ~ year, data = NEI_Baltimore_Mot, FUN = sum)

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

#Creating the plot5

png("plot5.png", width = 700, height = 660)

ggplot(Emission_Baltimore_Mot, aes(x=factor(year), y=Emissions,fill=year, label = round(Emissions/1000,2))) +
  geom_bar(stat="identity") + xlab("year") + ylab(expression("total PM"[2.5]*" Emissions ")) +
  geom_label(aes(fill = year),col = "white", fontface = "bold") +
  ggtitle("Motor Vehicle Source Emissions in Baltimore from 1999-2008")

dev.off()