# Plot 4 file:
data4 <- read.csv("proj.data.csv")
library(dplyr)
data4 <- tbl_df(data4)
data4 <- mutate(data4, Date = as.character(Date), Time = as.character(Time), date_time = paste0(Date, "-", Time))
data4 <- mutate(data4, date_time = as.POSIXct(date_time, format = "%Y-%m-%d-%H:%M:%S"))

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

# plot 1:
with(data4, plot(x = date_time, y = Global_active_power, pch = NA,
                 xlab = "", ylab = "Global Active Power (kilowatts)"))
with(data4, lines(x = date_time, y = Global_active_power))

# plot 2:
with(data4, plot(x = date_time, y = Voltage, pch = NA,
                 xlab = "datetime", ylab = "Voltage"))
with(data4, lines(x = date_time, y = Voltage))

# plot 3:
with(data4, plot(x = date_time, y = Sub_metering_1, pch = NA,
                 xlab = "", ylab = "Energy sub metering"))
with(data4, lines(x = date_time, y = Sub_metering_1, col = "black"))
with(data4, lines(x = date_time, y = Sub_metering_2, col = "red"))
with(data4, lines(x = date_time, y = Sub_metering_3, col = "blue"))

# plot 4:
with(data4, plot(x = date_time, y = Global_reactive_power, pch = NA,
                 xlab = "datetime", ylab = "Global_reactive_power"))
with(data4, lines(x = date_time, y = Global_reactive_power))

par(mfrow = c(1, 1))
dev.off()

