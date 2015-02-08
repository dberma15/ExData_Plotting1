setwd("C:\\Users\\daniel\\Documents\\R")
householdPowerConsumption <- read.table("household_power_consumption.txt", sep=";")
isFirst<-householdPowerConsumption[,1]=="1/2/2007"
isSecond<-householdPowerConsumption[,1]=="2/2/2007"
isFirstOrSecond<-isFirst|isSecond
householdPowerConsumptionSubset<-householdPowerConsumption[isFirstOrSecond,]
colnames(householdPowerConsumptionSubset)<-as.matrix(householdPowerConsumption[1,])
householdPowerConsumptionSubset[,1]<-as.Date(householdPowerConsumptionSubset[,1],format="%d/%m/%Y")

timeStamp<-strptime(paste(householdPowerConsumptionSubset[,1], householdPowerConsumptionSubset[,2]), "%Y-%m-%d %H:%M:%S")

Sub_metering_1<-householdPowerConsumptionSubset[,7]
Sub_metering_2<-householdPowerConsumptionSubset[,8]
Sub_metering_3<-householdPowerConsumptionSubset[,9]

png(filename="plot3.png", width=480, height=480)
plot(timeStamp,as.numeric(as.matrix(Sub_metering_1)), type='l', xlab='', ylab="Energy sub metering")
points(timeStamp,as.numeric(as.matrix(Sub_metering_2)),type='l',col='red')
points(timeStamp,as.numeric(as.matrix(Sub_metering_3)),type='l',col='blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), lty="solid")
dev.off()
