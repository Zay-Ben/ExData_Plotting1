# import the data
hpc <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# concatenate the column Date and the column Time into a column datetime
hpc$datetime <- paste(hpc$Date, hpc$Time)

# cast the column datetime from character to POSIXlt
hpc$datetime <- strptime(hpc$datetime, format = "%d/%m/%Y %H:%M:%S")

# subset the data
hpc_eda <- subset(hpc, format(hpc$datetime, format = "%Y-%m-%d") == "2007-02-01" | format(hpc$datetime, format = "%Y-%m-%d") == "2007-02-02")

# open graphing device
png(filename = "plot1.png", width = 480, height = 480)

with(hpc_eda,
     hist(x = Global_active_power,
          col = "red",
          main = "Global Active Power",
          xlab = "Global Active Power (kilowatts)"))

# close graphing device
dev.off()