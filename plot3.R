# script to generate plot 3

consumptionData<- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")

consumptionData$DateTime = paste(consumptionData$Date, consumptionData$Time)
consumptionData$DateTime = as.POSIXlt(consumptionData$DateTime,format="%d/%m/%Y %H:%M:%S")
consumptionData$Date = NULL
consumptionData$Time = NULL

consumptionSubset <- subset(consumptionData,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

png("plot3.png")
plot(x=(consumptionSubset$DateTime),y=consumptionSubset$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(consumptionSubset$DateTime),y=consumptionSubset$Sub_metering_2,col="red")
lines(x=(consumptionSubset$DateTime),y=consumptionSubset$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)
dev.off()