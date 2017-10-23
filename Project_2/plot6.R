library(ggplot2)

#Reading data into R

NEI <- readRDS("../exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata_data_NEI_data/Source_Classification_Code.rds")

#NEI on-road data for Baltimore City and LA county
NEI_Baltimore_Mot  <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]
NEI_LA_Mot  <- NEI[NEI$fips == "06037" & NEI$type == "ON-ROAD", ]

#Aggregating Emission for Baltimore City and LA county

Emission_Baltimore_Mot <- aggregate(formula = Emissions ~ year, data = NEI_Baltimore_Mot, FUN = sum)

Emission_LA_Mot <- aggregate(formula = Emissions ~ year, data = NEI_LA_Mot, FUN = sum)

Emission_Baltimore_LA_Mot <- rbind(Emission_Baltimore_Mot, Emission_LA_Mot)

Emission_Baltimore_LA_Mot <- cbind(Emission_Baltimore_LA_Mot, region = c(rep("Baltimore", 4), rep("Los Angeles", 4)))

attach(Emission_Baltimore_LA_Mot)

#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, 
#California (  fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

g <- ggplot(Emission_Baltimore_LA_Mot, aes(factor(year), Emissions))
g <- g + geom_bar(stat = "identity", aes(fill = factor(year))) +
    xlab("year") + ylab(expression('total PM'[2.5]*" Emission")) + 
    ggtitle("Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008") +
    theme(axis.text.x = element_text(colour = "grey20", size = 12), 
        axis.text.y = element_text(colour = "grey20", size = 14),
        axis.title.x = element_text(size = 18, hjust = .5),
        axis.title.y = element_text(size = 18, hjust = .5, vjust = 1),
        title = element_text(size = 20, hjust = .5)) +
  facet_grid(. ~ region) + theme(legend.position = 'none') +
  scale_y_continuous(breaks = c(seq(0, 500, 250), seq(500, 5000, 1000)))
print(g)

#Creating the plot6
dev.copy(png, file = "plot6.png", height = 750, width = 1000)

dev.off()