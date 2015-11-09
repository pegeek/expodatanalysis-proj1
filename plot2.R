mydata = read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors=FALSE)
mydat$Date<-as.Date(mydat$Date,format="%d/%m/%Y")
mydat0<-subset(mydat,Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

par(mfcol=c(1,1))
x=strptime(paste(as.character(mydat0[,2]), mydat0[,1]), format=" %H:%M:%S %Y-%m-%d")
plot(x, y=na.omit(as.double(mydat0[,3])), type="n",ylab="Global Active Power (kilowatts)",xlab="") 
lines(x, y=na.omit(as.double(mydat0[,3])))
dev.copy(png,file="plot2.png", width=480, height=480)

dev.off()
