## Exploratory Data Analysis 
## Project 2 Plot 5
# Loading data (copy Plot1)
setwd("E:/Documents and Settings/Y5187122S/Mis documentos/Downloads/exdata-data-NEI_data") #set wd to the folder my data is in (already unzipped) 
data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data1 <- with(data, aggregate(Emissions, by = list(year), sum))

# Question 5: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
library(ggplot2)
png(filename="E:/Documents and Settings/Y5187122S/Mis documentos/Downloads/exdata-data-NEI_data/plot5.png")

data_sub4 <- subset(data, fips == "24510" & type=="ON-ROAD")
baltmot.sources <- aggregate(data_sub4[c("Emissions")], list(type = data_sub4$type, year = data_sub4$year, zip = data_sub4$fips), sum)
qplot(year, Emissions, data = baltmot.sources, geom= "line") + theme_gray() + ggtitle("Motor Vehicle-Related Emissions in Baltimore county") + xlab("Year") + ylab("Emission Levels")
dev.off()