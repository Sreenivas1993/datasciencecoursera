data<-"household_power_consumption.txt"
dataval<-read.table(data,header = TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
datasub<-dataval[dataval$Date %in% c("1/2/2007","2/2/2007"),]
datetime<-strptime(paste(datasub$Date,datasub$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
globactpow<-as.numeric(datasub$Global_active_power)
png("plot2.png",width = 480,height=480)
plot(datetime,globactpow,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
