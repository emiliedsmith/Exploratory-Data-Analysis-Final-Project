##Plot 1
## Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Calculate the total emission of PM2.5 per year
total <- tapply(NEI$Emissions, NEI$year, sum)

##Save the plot as a png file
png("plot1.png")
plot(names(total), total, 
     xlab = "year", 
     ylab = "total PM2.5 emissions (tons)in the USA", 
     type = "l", 
     col = "blue")
title(main = "Total PM2.5 Emissions (tons) in the USA from 1999 to 2008")

#Shut down the graphic device
dev.off()
