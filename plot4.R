
dt = read.table("household_power_consumption.txt", header = TRUE, sep = ";",
na.strings = "?", 
#nrows = 10000,
stringsAsFactors = FALSE
)
dt$SDate <- as.Date(dt$Date, format="%d/%m/%Y")

st <- dt[dt$SDate == as.Date("2007-02-01")|dt$SDate == as.Date("2007-02-02"),]

st$PTime <- strptime(paste(st$Date, st$Time, sep=';'), format="%d/%m/%Y;%H:%M:%S")

png(filename = "plot4.png", width=480, height=480)

par(mfrow = c(2, 2))
with(st, 
      {
          #First
          plot(PTime, Global_active_power, type="l",
               xlab="", ylab="Global Active Power")
          
          #Second
          plot(PTime, Voltage, type="l",
               xlab="datetime", ylab="Voltage")
          
          #Third
    plot(PTime, Sub_metering_1, type="l",
              xlab="", ylab="Energy sub metering")
    lines(PTime, Sub_metering_2, type="l", col="red")
    lines(PTime, Sub_metering_3, type="l", col="blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                col = c("black", "red", "blue"), lty=1 )
          #Fourth
          plot(PTime, Global_reactive_power, type="l",
               xlab="datetime", ylab="Global_reactive_power")
})



dev.off()

