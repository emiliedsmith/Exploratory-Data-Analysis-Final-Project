##Plot 2
## Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Subset NEI per Baltimore City 
Balt <- subset(NEI, fips== "24510")


##Calculate the total emission of PM2.5 per year for Baltimore City
totalBalt <- tapply(Balt$Emissions, Balt$year, sum)

##Save the plot as a png file
png("plot2.png")
plot(names(totalBalt), totalBalt, 
     xlab = "year", 
     ylab = "total PM2.5 emissions (tons) in Baltimore City", 
     type = "l", 
     col = "red")
title(main = "Total PM2.5 Emissions (tons) in Baltimore City from 1999 to 2008")

#Shut down the graphic device
dev.off()
