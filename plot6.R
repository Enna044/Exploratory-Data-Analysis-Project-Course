## Question 6)
### Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in 
### Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor 
### vehicle emissions?

library(ggplot2)

##Read each file and save it to two data frames
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
mot_bal<-NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
mot_cal<-NEI[NEI$fips=="06037" & NEI$type=="ON-ROAD",  ]
mot<-rbind(mot_bal,mot_cal)

##Calculate the emissions per year for col combustion-related sources
my<-aggregate(Emissions~year+fips,mot,sum)

##Plot and send it to a png
g <- ggplot(my, aes(year, Emissions,color=fips))
g<-g+geom_line()+xlab("Year")+ylab("PM2.5 emission")+ggtitle("Total emission from coal combustion-related spurces")
print(g)
dev.copy(png, file="plot6.png", height=480, width=480)
dev.off()

##Conclusion: The emissions on Baltimore City are clearly lower than those on Los Angeles