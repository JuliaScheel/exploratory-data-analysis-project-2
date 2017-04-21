## Exploratory Data Analysis 
## Project 2 Plot 1
# Loading data 
setwd("E:/Documents and Settings/Y5187122S/Mis documentos/Downloads/exdata-data-NEI_data") #set wd to the folder my data is in (already unzipped) 
data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data1 <- with(data, aggregate(Emissions, by = list(year), sum))

# Question 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

png(filename="E:/Documents and Settings/Y5187122S/Mis documentos/Downloads/exdata-data-NEI_data/plot1.png")
plot(data1/1000, type = "b", main = "Total PM2.5 Emissions", xlab = "year", ylab = "PM2.5 Emissions [kilotons]", ylim = c(0,8000), pch = 19 , col = "darkgreen" , lty = 7)
dev.off()