library(ggplot2)

#Reading data into R

NEI <- readRDS("../exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata_data_NEI_data/Source_Classification_Code.rds")

# NEI data for Baltimore City

NEI_Baltimore <- NEI[NEI$fips == "24510",]

#Aggregating Emission by year

Emission_Baltimore_year <- aggregate(formula = Emissions ~ year + type, data = NEI_Baltimore, FUN = sum)

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

#Creating the plot3

png("plot3.png", width = 700, height = 660)

ggplot(Emission_Baltimore_year, aes(x=factor(year), y=Emissions, fill=type,label = round(Emissions,2))) +
  geom_bar(stat="identity") +
  facet_grid(. ~ type) + xlab("year") + ylab(expression("total PM"[2.5]*" Emission ")) +
  geom_label(aes(fill = type), col = "white", fontface = "bold") +
  ggtitle(expression("PM"[2.5]*paste(" Total Emissions in Baltimore City 1999-2008 ", sep="")))
  
dev.off()

