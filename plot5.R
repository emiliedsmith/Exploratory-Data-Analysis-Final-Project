##Plot5
library(ggplot2)

## Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset SCC by Motor Vehicles 
MV <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCCMV <- SCC[MV,]$SCC

## Subset NEI according to SCCMV and Baltimore
BaltMV <- subset(NEI, SCC %in% SCCMV & fips== "24510")

##Plot
##Save the plot as a png file
png("plot5.png")
ggplot(BaltMV, aes(factor(year),Emissions)) +
  geom_bar(stat="identity") +
  guides(fill=FALSE)+
  labs(x="year", y=expression("Total PM2.5 Emission (Tons)")) + 
  labs(title=expression("Motor Vehicles Emissions in Baltimore City from 1999 to 2008"))


#Shut down the graphic device
dev.off()
     