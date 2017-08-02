NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI<-NEI[NEI$fips=="24510",]

library(ggplot2)
NEI$year<-factor(NEI$year,levels=c('1999','2002','2005','2008'))
png('plot3.png')
ggplot(data=NEI,aes(x=year,y=log(Emissions)))+facet_grid(.~type)+ggtitle('Emissions per Type in Baltimore City, Maryland from 1999-2008')+xlab('Year')+ylab('Emissions of log PM2.5')+geom_boxplot(aes(fill=type))+stat_boxplot(geom='errorbar')
dev.off()