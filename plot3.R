## Question 3)
### Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four 
### sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions 
### from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

##Call ggplot2 library
library(ggplot2)

##Read each file and save it to two data frames
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Calculate the emissions per year on Baltimore City, Maryland
pm<-subset(NEI, fips=="24510")
pm_year<-aggregate(Emissions~year+type,pm,sum)

##Plot and send it to a png
g <- ggplot(pm_year, aes(year, Emissions, color = type))
g<-g+geom_line()+xlab("Year")+ylab("PM2.5 emission")+ggtitle("Total emission in Baltimore City, Maryland by year")
print(g)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

##Conclusion: Apart from the type Point, all types have decreases. The type "point" increases with time. 
##Even though the last period it decreases, at the end it is higher on 2008 than on 1999