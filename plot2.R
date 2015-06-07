# script to generate plot 2

consumptionData<- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")

consumptionData$DateTime = paste(consumptionData$Date, consumptionData$Time)
consumptionData$DateTime = as.POSIXlt(consumptionData$DateTime,format="%d/%m/%Y %H:%M:%S")
consumptionData$Date = NULL
consumptionData$Time = NULL

consumptionSubset <- subset(consumptionData,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

png("plot2.png")
plot(x=(consumptionSubset$DateTime),y=consumptionSubset$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()