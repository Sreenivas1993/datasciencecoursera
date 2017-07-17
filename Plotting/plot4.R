data<-"household_power_consumption.txt"
dataval<-read.table(data,header = TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
datasub<-dataval[dataval$Date %in% c("1/2/2007","2/2/2007"),]
datetime<-strptime(paste(datasub$Date,datasub$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
globactpow<-as.numeric(datasub$Global_active_power)
globalreactpow<-as.numeric(datasub$Global_reactive_power)
voltage<-as.numeric(datasub$Voltage)
submet1<-as.numeric(datasub$Sub_metering_1)
submet2<-as.numeric(datasub$Sub_metering_2)
submet3<-as.numeric(datasub$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime,globactpow,type="l",xlab="", ylab="Global Active Power",cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime,submet1,xlab=" ",ylab="Energy Submetering",type="l")
lines(datetime,submet2,col="red")
lines(datetime,submet3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(datetime,globalreactpow,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()