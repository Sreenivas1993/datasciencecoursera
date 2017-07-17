data<-"household_power_consumption.txt"
dataval<-read.table(data,header = TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
datasub<-dataval[dataval$Date %in% c("1/2/2007","2/2/2007"),]
datetime<-strptime(paste(datasub$Date,datasub$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
submet1<-as.numeric(datasub$Sub_metering_1)
submet2<-as.numeric(datasub$Sub_metering_2)
submet3<-as.numeric(datasub$Sub_metering_3)
png("plot3.png",width=480,height=480)
plot(datetime,submet1,xlab=" ",ylab="Energy Submetering",type="l")
lines(datetime,submet2,col="red")
lines(datetime,submet3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()