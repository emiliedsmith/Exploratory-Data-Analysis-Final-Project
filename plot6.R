##Plot6
library(ggplot2)

## Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset SCC by Motor Vehicles 
MV <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCCMV <- SCC[MV,]$SCC

## Subset NEI according to SCCMV and the city code
BaltMV <- subset(NEI, SCC %in% SCCMV & fips== "24510")
LAMV <- subset(NEI, SCC %in% SCCMV & fips== "06037")

##Add city name
BaltMV$City <- "Baltimore City"
LAMV$City <- "Los Angeles"

## Combine the 2 dataframes
combine <- rbind(BaltMV, LAMV)

##Plot
##Save the plot as a png file
png("plot6.png")
ggplot(combine, aes(factor(year),Emissions)) +
  geom_bar(stat="identity") +
  guides(fill=FALSE)+
  facet_grid(.~City,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM2.5 Emission (Tons)")) + 
  labs(title=expression("Motor Vehicles Emissions in Baltimore City and LA from 1999 to 2008"))


#Shut down the graphic device
dev.off()
