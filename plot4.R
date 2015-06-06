#create plot 4
plot4<-function(){
    dat<-read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactor=FALSE) #read in csv, account for ? as missing value and ; as separation character
    dat$Date<-as.Date(dat$Date,"%d/%m/%Y") #convert date string
    dat<-subset(dat,Date=="2007-02-01" | Date=="2007-02-02") # subset to include only two datys data
    dat$datetime<-strptime(paste(dat$Date,dat$Time),"%Y-%m-%d %H:%M:%S") #create date time variable for plotting
    
    png("plot4.png",width=480,height=480)
    par(mfrow=c(2,2))
    with(dat,{
        plot(datetime,Global_active_power,type="l",ylab="Global Active Power",xlab="",)
        plot(datetime,Voltage,type="l")
        plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
        lines(datetime,Sub_metering_2,col="red")
        lines(datetime,Sub_metering_3,col="blue")
        legend('topright',lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),bty="n")
        plot(datetime,Global_reactive_power,type="l")
    })
    #reset par
    par=(mfrow=c(1,1))
    dev.off()
}