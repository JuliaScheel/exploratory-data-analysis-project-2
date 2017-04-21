## Exploratory Data Analysis 
## Project 2 Plot 2
# Loading data (copy Plot1)
setwd("E:/Documents and Settings/Y5187122S/Mis documentos/Downloads/exdata-data-NEI_data") #set wd to the folder my data is in (already unzipped) 
data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data1 <- with(data, aggregate(Emissions, by = list(year), sum))

# Question 2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?

library(ggplot2)
png(filename="E:/Documents and Settings/Y5187122S/Mis documentos/Downloads/exdata-data-NEI_data/plot2.png")
sub_data <- subset(data, fips == "24510")
balt <- tapply(sub_data$Emissions, sub_data$year, sum)
plot(balt, type = "o", main = "Total PM2.5 Emissions in Baltimore County 1999.2008", xlab = "Year", ylab = "PM2.5 Emissions", pch = 18, col = "darkblue", lty = 7)
dev.off()