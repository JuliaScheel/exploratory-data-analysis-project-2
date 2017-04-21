## Exploratory Data Analysis 
## Project 2 Plot 6
# Loading data (copy Plot1)
setwd("E:/Documents and Settings/Y5187122S/Mis documentos/Downloads/exdata-data-NEI_data") #set wd to the folder my data is in (already unzipped) 
data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 6: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
library(ggplot2)
library(dplyr)

maryland <- summarise(group_by(filter(data, fips == "24510"& type == 'ON-ROAD'), year), sum_Emissions=sum(Emissions))
california <- summarise(group_by(filter(data, fips == "06037"& type == 'ON-ROAD'), year), sum_Emissions=sum(Emissions))

maryland$County <- "Baltimore City"
california$County <- "Los Angeles"
both.emissions <- rbind(maryland, california)

png(filename="E:/Documents and Settings/Y5187122S/Mis documentos/Downloads/exdata-data-NEI_data/plot6.png")
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7") # set colors for plot

plot6 <- ggplot(both.emissions, aes(x = year, y = sum_Emissions, fill = County, label = round(sum_Emissions, 2))) +
                geom_bar(stat = "identity") +
                facet_grid(. ~ County) +
                ylab(expression('PM'[2.5])) + 
                xlab('Year') + 
                scale_y_continuous(limits = c(0, 4800)) +
                theme(legend.position='none') +
                scale_fill_manual(values=cbbPalette) +
                ggtitle('Total Emissions of motor vehicle sources\nLos Angeles County vs. Baltimore City') +
                geom_text(aes(label=round(sum_Emissions,0), size=1, hjust=0.5, vjust=-1))


print(plot6)
dev.off()