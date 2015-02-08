setwd("C:\\Users\\daniel\\Documents\\R")
householdPowerConsumption <- read.table("household_power_consumption.txt", sep=";")
isFirst<-householdPowerConsumption[,1]=="1/2/2007"
isSecond<-householdPowerConsumption[,1]=="2/2/2007"
isFirstOrSecond<-isFirst|isSecond
householdPowerConsumptionSubset<-householdPowerConsumption[isFirstOrSecond,]
colnames(householdPowerConsumptionSubset)<-as.matrix(householdPowerConsumption[1,])
householdPowerConsumptionSubset[,1]<-as.Date(householdPowerConsumptionSubset[,1],format="%d/%m/%Y")

timeStamp<-strptime(paste(householdPowerConsumptionSubset[,1], householdPowerConsumptionSubset[,2]), "%Y-%m-%d %H:%M:%S")
png(filename="plot2.png", width=480, height=480)
plot(timeStamp,as.numeric(as.matrix(householdPowerConsumptionSubset[,3])), type='l', pch=20, lty="solid", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
