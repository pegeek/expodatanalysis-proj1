mydata = read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors=FALSE)
mydat$Date<-as.Date(mydat$Date,format="%d/%m/%Y")
mydat0<-subset(mydat,Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

par(mfcol=c(1,1))

hist(na.omit(as.double(mydat0[,3])),col="red",breaks=20,xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,file="plot1.png", width=480, height=480)

dev.off()
