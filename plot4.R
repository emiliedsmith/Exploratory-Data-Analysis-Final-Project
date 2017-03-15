##Plot4
library(ggplot2)

## Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset SCC by Coal combustion
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <-SCC[coalCombustion,]$SCC

##Subset NEI according to combustionSCC
subcoalcomb <- subset(NEI, SCC %in% combustionSCC)

##Plot
png("plot4.png")
ggplot(subcoalcomb, aes(factor(year),Emissions)) +
  geom_bar(stat="identity") +
  guides(fill=FALSE)+
  labs(x="year", y=expression("Total PM2.5 Emission (Tons)")) + 
  labs(title=expression("Coal Combustion Emissions in the USA from 1999 to 2008"))

#Shut down the graphic device
dev.off()
     