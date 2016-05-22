## Question 2)
###Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
###Use the base plotting system to make a plot answering this question.

##Read each file and save it to two data frames
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Calculate the emissions per year on Baltimore City, Maryland
pm<-subset(NEI, fips=="24510")
pm_year<-aggregate(Emissions~year,pm,sum)

##Plot and send it to a png
plot(pm_year$year,pm_year$Emissions,pch=19, main="Total PM2.5 emission per year on Baltimore City, Maryland", xlab="Year",ylab="PM2.5 emission", col="red", type="b")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

##Conclusion: As we can see on the plot, the total emision from PM2.5 decreased in Baltimore City, Maryland from 1999 to 2008.
##However, on 2005, it increased a little bit. But, at the end, 2008 is lower that 1999.