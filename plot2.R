data <- read.table('./household_power_consumption.txt',
                   header=TRUE, sep=';', na.strings='?')

sub <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'), ]

sub$Date <- as.Date(sub$Date, format='%d/%m/%Y')
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))

png('plot2.png', width=480, height=480)

plot(sub$DateTime, sub$Global_active_power,
     type='l',
     lwd=1,
     xlab='',
     ylab='Global Active Power (kilowatts)')

dev.off()
