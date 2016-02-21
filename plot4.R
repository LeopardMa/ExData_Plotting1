# load data
library(dplyr)
tb <- read.csv("household_power_consumption.txt",header = TRUE,skip = 66636,nrows = 2880,sep = ";",na.strings="?")
tb_names <- read.csv("household_power_consumption.txt",header = TRUE,nrows = 1,sep = ";")
names(tb) <- names(tb_names)
tb <- mutate(tb,datetime = paste(tb$Date,tb$Time))
tb$datetime <- strptime(tb$datetime,"%d/%m/%Y %H:%M:%S")

##plot4
png(filename='plot4.png', width=480, height=480, units='px')
par(mfrow = c(2, 2))
## [1,1]
with(tb,plot(datetime,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power"))
## [1,2]
with(tb,plot(datetime,Voltage,type = "l",xlab = "datetime",ylab = "Voltage"))
## [2,1]
with(tb,plot(datetime,Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering"))
with(tb,lines(datetime,Sub_metering_1,type = "l",col="black"))
with(tb,lines(datetime,Sub_metering_2,type = "l",col="red"))
with(tb,lines(datetime,Sub_metering_3,type = "l",col="blue"))
legend("topright", lty=1, col = c("black","red", "blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
## [2,2]
with(tb,plot(datetime,Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power"))
dev.off()