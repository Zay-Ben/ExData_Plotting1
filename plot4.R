# import the data
hpc <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# concatenate the column Date and the column Time into a column datetime
hpc$datetime <- paste(hpc$Date, hpc$Time)

# cast the column datetime from character to POSIXlt
hpc$datetime <- strptime(hpc$datetime, format = "%d/%m/%Y %H:%M:%S")

# subset the data
hpc_eda <- subset(hpc, format(hpc$datetime, format = "%Y-%m-%d") == "2007-02-01" | format(hpc$datetime, format = "%Y-%m-%d") == "2007-02-02")

# open graphing device
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

with(hpc_eda,
     plot(x = datetime,
          y = Global_active_power,
          type = "l",
          xlab = "",
          ylab = "Global Active Power"))

with(hpc_eda,
     plot(x = datetime,
          y = Voltage,
          type = "l"))

with(hpc_eda,
     plot(x = datetime,
          y = Sub_metering_1,
          type = "l",
          xlab = "",
          ylab = "Energy sub metering"))

with(hpc_eda, lines(x = datetime, y = Sub_metering_2, col = "red"))

with(hpc_eda, lines(x = datetime, y = Sub_metering_3, col = "blue"))

legend(x = "topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1),
       box.lty = 0)

with(hpc_eda,
     plot(x = datetime,
          y = Global_reactive_power,
          type = "l"))

# close graphing device
dev.off()

