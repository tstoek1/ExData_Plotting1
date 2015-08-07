power<-read.table("household_power_consumption.txt",sep=";",
                  header=TRUE,na.strings="?")

##Subsets table for the two dates in question
dates<-c("1/2/2007","2/2/2007")
pwr<-power[power$Date %in% dates,]

##Transforms Date and Time columns into one combined Date/Time
##Column as a Date Class
combinedDT<-paste(pwr$Date, pwr$Time, sep = " ", collapse=NULL)
pwr$Combined<-combinedDT
pwr$Combined<-strptime(pwr$Combined, format="%d/%m/%Y %H:%M:%S")

##Creates PNG file
png("plot3.png", width=480, height=480)

##Plots Combined Date/Time Column vs all three Sub Metering
##columns on the same graph using different colors
plot(pwr$Combined, pwr$Sub_metering_1, type="l",xlab="", 
     ylab="Energy sub metering", ylim=c(0,40))
par(new=T)
plot(pwr$Combined, pwr$Sub_metering_2, col="Red", type="l",xlab="",
     ylab="", axes=FALSE, ylim=c(0,40))
par(new=T)
plot(pwr$Combined, pwr$Sub_metering_3, col="Blue", type="l",
     xlab="", ylab="", axes=FALSE, ylim=c(0,40))

##Adds legend to graph
legend("topright", lty=c(1,1,1), col=c("Black", "Red", "Blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", 
                "Sub_metering_3"))
dev.off()