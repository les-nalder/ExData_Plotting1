#create plot 1
plot1<-function(){
    dat<-read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactor=FALSE) #read in csv, account for ? as missing value and ; as separation character
    dat$Date<-as.Date(dat$Date,"%d/%m/%Y") #convert date string
    dat<-subset(dat,Date=="2007-02-01" | Date=="2007-02-02") # subset to include only two datys data
    dat$datetime<-strptime(paste(dat$Date,dat$Time),"%Y-%m-%d %H:%M:%S") #create date time variable for plotting
    
    png("plot1.png",width=480,height=480)
    with(dat,hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power"))
    dev.off()
}