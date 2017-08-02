NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year<-factor(NEI$year,levels=c('1999','2002','2005','2008'))
subNEI<-NEI[NEI$fips=="24510"|NEI$fips=="06037",]
subsum<-aggregate(subNEI$Emissions~subNEI$year+subNEI$fips,data=subNEI,sum)
colnames(subsum)<-c('year','flips','Emissions')
png("plot6.png")
ggplot(data=subsum,aes(x=year,y=Emissions))+geom_histogram(aes(fill=year),stat='identity')+facet_grid(.~flips)+ggtitle('Total Emissions of Motor Vehicle Sources\nLos Angeles County, California vs. Baltimore City, Maryland')
dev.off()