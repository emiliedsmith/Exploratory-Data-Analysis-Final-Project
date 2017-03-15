##Plot 3

library(ggplot2)


## Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Subset NEI per Baltimore City 
Balt <- subset(NEI, fips== "24510")

##Save the plot as a png file
png("plot3.png")

##Plot the sum of emissions per type per year
ggplot(Balt,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM2.5 Emission (Tons)")) + 
  labs(title=expression("Total PM2.5 Emissions in Baltimore City from 1999 to 2008 by Source Type"))

#Shut down the graphic device
dev.off()
