setwd("C:\\Users\\daniel\\Documents\\R")
householdPowerConsumption <- read.table("household_power_consumption.txt", sep=";")
isFirst<-householdPowerConsumption[,1]=="1/2/2007"
isSecond<-householdPowerConsumption[,1]=="2/2/2007"
isFirstOrSecond<-isFirst|isSecond
householdPowerConsumptionSubset<-householdPowerConsumption[isFirstOrSecond,]
colnames(householdPowerConsumptionSubset)<-as.matrix(householdPowerConsumption[1,])
householdPowerConsumptionSubset[,1]<-as.Date(householdPowerConsumptionSubset[,1],format="%d/%m/%Y")


timeStamp<-strptime(paste(householdPowerConsumptionSubset[,1], householdPowerConsumptionSubset[,2]), "%Y-%m-%d %H:%M:%S")

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(timeStamp,as.numeric(as.matrix(householdPowerConsumptionSubset[,3])), type='l', pch=20, lty="solid", xlab="", ylab="Global Active Power")
plot(timeStamp,as.numeric(as.matrix(householdPowerConsumptionSubset[,5])), type='l', pch=20, lty="solid", xlab="timedate", ylab="Voltage")
plot(timeStamp,as.numeric(as.matrix(Sub_metering_1)), type='l', xlab='', ylab="Energy sub metering")
points(timeStamp,as.numeric(as.matrix(Sub_metering_2)),type='l',col='red')
points(timeStamp,as.numeric(as.matrix(Sub_metering_3)),type='l',col='blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), lty="solid",bty="n")
plot(timeStamp,as.numeric(as.matrix(householdPowerConsumptionSubset[,4])), type='l', pch=21, lty="solid",lwd=.5, xlab="timedate", ylab="Global_reactive_power")

dev.off()