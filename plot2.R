
dt = read.table("household_power_consumption.txt", header = TRUE, sep = ";",
na.strings = "?", 
stringsAsFactors = FALSE
)
dt$SDate <- as.Date(dt$Date, format="%d/%m/%Y")

st <- dt[dt$SDate == as.Date("2007-02-01")|dt$SDate == as.Date("2007-02-02"),]

st$PTime <- strptime(paste(st$Date, st$Time, sep=';'), format="%d/%m/%Y;%H:%M:%S")

png(filename = "plot2.png", width=480, height=480)

with(st, plot(PTime, Global_active_power, type="l",
              xlab="", ylab="Global Active Power (kilowatts)"))


dev.off()

