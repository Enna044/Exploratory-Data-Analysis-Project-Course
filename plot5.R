## Question 5)
### How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

library(ggplot2)

##Read each file and save it to two data frames
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
mot_bal<-NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

##Calculate the emissions per year for col combustion-related sources
my<-aggregate(Emissions~year,mot_bal,sum)

##Plot and send it to a png
g <- ggplot(my, aes(year, Emissions))
g<-g+geom_line()+xlab("Year")+ylab("PM2.5 emission")+ggtitle("Total emission from coal combustion-related spurces")
print(g)
dev.copy(png, file="plot5.png", height=480, width=480)
dev.off()

##Conclusion: As we can see on the plot, the total emision from PM2.5 decreased strictly from 1999 to 2008