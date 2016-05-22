## Question 1)
###Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
###make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

##Read each file and save it to two data frames
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##Calculate the emissions per year
pm_year<-aggregate(Emissions~year,NEI,sum)

##Plot and send it to a png
plot(pm_year$year,pm_year$Emissions,pch=19, main="Total PM2.5 emission per year", xlab="Year",ylab="PM2.5 emission", col="blue", type="b")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

##Conclusion: As we can see on the plot, the total emision from PM2.5 decreased in the United States from 1999 to 2008.
##As we advance on the plot, each dot has a lower emission