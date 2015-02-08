setwd("C:\\Users\\daniel\\Documents\\R")
householdPowerConsumption <- read.table("household_power_consumption.txt", sep=";")
isFirst<-householdPowerConsumption[,1]=="1/2/2007"
isSecond<-householdPowerConsumption[,1]=="2/2/2007"
isFirstOrSecond<-isFirst|isSecond
householdPowerConsumptionSubset<-householdPowerConsumption[isFirstOrSecond,]
colnames(householdPowerConsumptionSubset)<-as.matrix(householdPowerConsumption[1,])
householdPowerConsumptionSubset[,1]<-as.Date(householdPowerConsumptionSubset[,1],format="%d/%m/%Y")
png(filename="plot1.png", width=480,height=480)
hist(as.numeric(as.matrix(householdPowerConsumptionSubset[,3])), breaks=15,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()