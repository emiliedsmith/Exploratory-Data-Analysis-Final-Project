##Plot 3

library(ggplot2)
library(plyr)

## Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Subset NEI per Baltimore City and per year
Balt <- subset(NEI, fips== "24510")

##Calculate the sum of Emissions per type for each year
totalBaltsub <- ddply(Balt, .(year, type), function(x) sum(x$Emissions))

## Rename the V1 colum
colnames(totalBaltsub)[3] <- "Emissions"

##Save the plot as a png file
png("plot3.png")

##Plot the sum of emissions per type per year
ggplot(totalBaltsub,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM2.5 Emission (Tons)")) + 
  labs(title=expression("Total PM2.5 Emissions in Baltimore City from 1999 to 2008 by Source Type"))

#Shut down the graphic device
dev.off()
