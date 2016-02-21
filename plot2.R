# load data
library(dplyr)
tb <- read.csv("household_power_consumption.txt",header = TRUE,skip = 66636,nrows = 2880,sep = ";",na.strings="?")
tb_names <- read.csv("household_power_consumption.txt",header = TRUE,nrows = 1,sep = ";")
names(tb) <- names(tb_names)
tb <- mutate(tb,datetime = paste(tb$Date,tb$Time))
tb$datetime <- strptime(tb$datetime,"%d/%m/%Y %H:%M:%S")

## plot 2
png(filename='plot2.png', width=480, height=480, units='px')
plot(tb$datetime,tb$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatta)")
dev.off()