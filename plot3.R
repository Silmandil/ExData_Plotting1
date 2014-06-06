
dt = read.table("household_power_consumption.txt", header = TRUE, sep = ";",
na.strings = "?", 
stringsAsFactors = FALSE
)
dt$SDate <- as.Date(dt$Date, format="%d/%m/%Y")

st <- dt[dt$SDate == as.Date("2007-02-01")|dt$SDate == as.Date("2007-02-02"),]

st$PTime <- strptime(paste(st$Date, st$Time, sep=';'), format="%d/%m/%Y;%H:%M:%S")

png(filename = "plot3.png", width=480, height=480)

with(st, plot(PTime, Sub_metering_1, type="l",
              xlab="", ylab="Energy sub metering"))
with(st, lines(PTime, Sub_metering_2, type="l",
              col="red"))
with(st, lines(PTime, Sub_metering_3, type="l",
               col="blue"))

with(st, legend("topright", legend=c("Sub_metering_1", "Sub_metering_2",
                                     "Sub_metering_3"),
                col = c("black", "red", "blue"),
                lty=1
                ))


dev.off()

