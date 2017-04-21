## Exploratory Data Analysis 
## Project 2 Plot 4
# Loading data (copy Plot1)
setwd("E:/Documents and Settings/Y5187122S/Mis documentos/Downloads/exdata-data-NEI_data") #set wd to the folder my data is in (already unzipped) 
data <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data1 <- with(data, aggregate(Emissions, by = list(year), sum))

# Question 4: Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7") # set colors for plot

png(filename="E:/Documents and Settings/Y5187122S/Mis documentos/Downloads/exdata-data-NEI_data/plot4.png")
library(ggplot2)
SCC_sub <- SCC[grepl("Coal" , SCC$Short.Name), ]
data_sub3 <- data[data$SCC %in% SCC_sub$SCC, ]
ggplot(data_sub3, aes(x = factor(year), y = Emissions, fill =type)) + geom_bar(stat= "identity", width = .7) + xlab("year") +ylab("Coal-Related PM2.5 Emissions") + ggtitle("Total Coal-Related PM2.5 emissions")+ scale_fill_manual(values=cbbPalette)


dev.off()