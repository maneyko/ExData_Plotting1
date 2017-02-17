data <- read.table('./household_power_consumption.txt',
                   header=TRUE, sep=';', na.strings='?')

sub <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'), ]

sub$Date <- as.Date(sub$Date, format='%d/%m/%Y')
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))

png('plot4.png', width=480, height=480)

par(mfcol=c(2, 2))

# Top left
plot(sub$DateTime, sub$Global_active_power,
     type='l',
     lwd=1,
     xlab='',
     ylab='Global Active Power (kilowatts)')

# Bottom left
plot(sub$DateTime, sub$Sub_metering_1,
     type='l',
     xlab='',
     ylab='Energy sub metering')
lines(sub$DateTime, sub$Sub_metering_2,
      type='l',
      col='red')
lines(sub$DateTime, sub$Sub_metering_3,
      type='l',
      col='blue')
legend('topright',
       c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lty=1,
       bty='n',
       col=c('black', 'red', 'blue'))

# Top right
plot(sub$DateTime, sub$Voltage,
     type='l',
     xlab='datetime',
     ylab='Voltage')

# Bottom right
plot(sub$DateTime, sub$Global_reactive_power,
     type='l',
     xlab='datetime',
     ylab='Global_reactive_power')

dev.off()
