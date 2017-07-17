data<-"household_power_consumption.txt"
dataval<-read.table(data,header = TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
datasub<-dataval[dataval$Date %in% c("1/2/2007","2/2/2007"),]
gactivepow<-as.numeric(datasub$Global_active_power)
png("plot1.png",width=480,height=480)
hist(gactivepow,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency")
dev.off()
