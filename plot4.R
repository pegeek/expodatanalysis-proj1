mydata = read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors=FALSE)
mydat$Date<-as.Date(mydat$Date,format="%d/%m/%Y")
mydat0<-subset(mydat,Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))


par(mfcol=c(2,2))
x=strptime(paste(as.character(mydat0[,2]), mydat0[,1]), format=" %H:%M:%S %Y-%m-%d")

plot(x, y=na.omit(as.double(mydat0[,3])), type="n",ylab="Global Active Power (kilowatts)",xlab="") 
lines(x, y=na.omit(as.double(mydat0[,3])))

plot(x, y=na.omit(as.double(mydat0$Sub_metering_1)), type="n",ylab="Energy sub metering",xlab="") 
lines(x, y=na.omit(as.double(mydat0$Sub_metering_1)))
lines(x, y=na.omit(as.double(mydat0$Sub_metering_2)),col="red")
lines(x, y=na.omit(as.double(mydat0$Sub_metering_3)),col="blue")
legend('topright','groups',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col=c('black','red','blue'),ncol=1,bty ="n")


plot(x, y=na.omit(as.double(mydat0$Voltage)), type="n",ylab="Energy sub metering",xlab="datetime") 
lines(x, y=na.omit(as.double(mydat0$Voltage)))

plot(x, y=na.omit(as.double(mydat0$Global_reactive_power)), type="n",ylab="Energy sub metering",xlab="datetime") 
lines(x, y=na.omit(as.double(mydat0$Global_reactive_power)))

dev.copy(png,file="plot4.png", width=480, height=480)
dev.off()

