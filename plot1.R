## Load data
tb <- read.csv("household_power_consumption.txt",header = TRUE,skip = 66636,nrows = 2880,sep = ";",na.strings="?")
tb_names <- read.csv("household_power_consumption.txt",header = TRUE,nrows = 1,sep = ";")
names(tb) <- names(tb_names)

## plot 1
png(filename='plot1.png', width=480, height=480, units='px')
hist(tb$Global_active_power,xlab = "Global Active Power (kilowatta)",main = "Global Active Power", col = "red")
dev.off()