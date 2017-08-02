NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
subNEI<-NEI[NEI$fips=="24510",]
sum_emission<-aggregate(subNEI$Emissions,list(as.numeric(subNEI$year)),sum)
colnames(sum_emission)<-c("year","emission")
png('plot2.png')
barplot(sum_emission$emission,names.arg=sum_emission$year,xlab="Year",ylab="Total Emission",main="Analysis of PM 2.5 emission IN Maryland 1999-2008",ylim = c(0,4000))
dev.off()