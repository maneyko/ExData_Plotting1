data <- read.table('./household_power_consumption.txt',
                   header=TRUE, sep=';', na.strings='?')

sub <- data[(data$Date == '1/2/2007' | data$Date == '2/2/2007'), ]

sub$Date <- as.Date(sub$Date, format='%d/%m/%Y')
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))

png('plot3.png', width=480, height=480)

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
       col=c('black', 'red', 'blue'))

dev.off()
