NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
subSCC<-SCC[grep("coal",SCC$EI.Sector,ignore.case = TRUE),]
mergescc<-merge(NEI,subSCC,by="SCC")
sumemiss<-aggregate(mergescc$Emissions,by=list(as.numeric(mergescc$year)),sum)
colnames(sumemiss)<-c('year','emission')
png('plot4.png')
library(ggplot2)
ggplot(data=sumemiss,aes(x=year,y=emission/1000))+ggtitle('Coal combustion emissions from 1999-2008')+geom_line(aes(group=1, col=emission))+geom_point(aes(size=2, col=emission))+ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + 
  geom_text(aes(label=round(emission/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) + 
  theme(legend.position='none') + scale_colour_gradient(low='black', high='red')
dev.off()




  