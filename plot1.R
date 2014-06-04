
dt = read.table("household_power_consumption.txt", header = TRUE, sep = ";",
na.strings = "?", 
stringsAsFactors = FALSE
)
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")

st <- dt[dt$Date == as.Date("2007-02-01")|dt$Date == as.Date("2007-02-02"),]

png(filename = "plot1.png", width=480, height=480)

hist(st$Global_active_power, main="Global Active Power",
     xlab = "Global Active Power (kilowatts)", col="red")

dev.off()

