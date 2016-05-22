## Question 4)
### Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

library(ggplot2)

##Read each file and save it to two data frames
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NS<-merge(NEI,SCC,by="SCC")
rows<-grep("coal",NS$Short.Name,ignore.case=TRUE)
coal_year<-NS[rows,]

##Calculate the emissions per year for col combustion-related sources
cy<-aggregate(Emissions~year,coal_year,sum)

##Plot and send it to a png
g <- ggplot(cy, aes(year, Emissions))
g<-g+geom_line()+xlab("Year")+ylab("PM2.5 emission")+ggtitle("Total emission from coal combustion-related spurces")
print(g)
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
            
##Conclusion: As we can see on the plot, the total emision from PM2.5 decreased from 1999 to 2002, then it increased
##a little bit from 2002 to 2005, and finally, it decreased from 2005 to 2008