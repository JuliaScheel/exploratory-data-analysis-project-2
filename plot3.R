## Exploratory Data Analysis 
## Project 2 Plot 3
# Loading data (copy Plot1)
setwd("E:/Documents and Settings/Y5187122S/Mis documentos/Downloads/exdata-data-NEI_data") #set wd to the folder my data is in (already unzipped) 
data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data1 <- with(data, aggregate(Emissions, by = list(year), sum))

# Question 3: Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 

library(ggplot2)
png(filename="E:/Documents and Settings/Y5187122S/Mis documentos/Downloads/exdata-data-NEI_data/plot3.png")
sub_data1 <- subset(data, fips == "24510")
balt.sources <- aggregate(sub_data1[c("Emissions")], list(type = sub_data1$type, year = sub_data1$year), sum)
qplot(year, Emissions, data = balt.sources, color = type, geom= "line")+ ggtitle("Total PM2.5 Emissions in Baltimore County by source ") + xlab("Year") + ylab("PM2.5 Emissions")

dev.off()