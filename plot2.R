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

##Plots Combined Date/Time vs Global Active Power as a line graph 
plot(pwr$Combined, pwr$Global_active_power, type="l",xlab="",
     ylab="Global Active Power (kilowatts)")

##Creates PNG file
dev.copy(png, file="plot2.png")
dev.off()