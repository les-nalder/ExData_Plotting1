#create plot 2
plot2<-function(){
    dat<-read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactor=FALSE) #read in csv, account for ? as missing value and ; as separation character
    dat$Date<-as.Date(dat$Date,"%d/%m/%Y") #convert date string
    dat<-subset(dat,Date=="2007-02-01" | Date=="2007-02-02") # subset to include only two datys data
    dat$datetime<-strptime(paste(dat$Date,dat$Time),"%Y-%m-%d %H:%M:%S") #create date time variable for plotting
    
    png("plot2.png",width=480,height=480)
    with(dat,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
    dev.off()
}