power<-read.table("household_power_consumption.txt",sep=";",
                    header=TRUE,na.strings="?")

##Subsets table for the two dates in question
dates<-c("1/2/2007","2/2/2007")
pwr<-power[power$Date %in% dates,]

##Creates histogram of Global Active Power
hist(pwr$Global_active_power, col="Red", 
     xlab="Global Active Power (kilowatts)", 
     main = "Global Active Power")

##Creates PNG file
dev.copy(png, file="plot1.png")
dev.off()