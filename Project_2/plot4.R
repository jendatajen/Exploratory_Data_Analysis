library(ggplot2)

#Reading data into R

NEI <- readRDS("../exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata_data_NEI_data/Source_Classification_Code.rds")

# Coal combustion related sources
# Merge two data sets
SCC_coal = SCC[grepl(pattern = "coal", x = SCC$Short.Name, ignore.case = TRUE), ]
NEI_coal <- merge(x = NEI, y = SCC_coal, by = 'SCC')

#Aggregating Emission by year for coal related emission

Emission_coal <- aggregate(formula = Emissions ~ year, data = NEI_coal, FUN = sum)

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

#Creating the plot4

png("plot4.png", width = 660, height = 660)

ggplot(Emission_coal, aes(x=factor(year), y=Emissions/1000,fill=year, label = round(Emissions/1000,2))) +
  geom_bar(stat="identity") + xlab("year") +  ylab(expression("total PM"[2.5]*" Emissions ")) +
  geom_label(aes(fill = year),col = "white", fontface = "bold") +
  ggtitle("Coal Combustion Source Emissions Across US from 1999-2008")
  
dev.off()