# Plot 3 file:
data3 <- read.csv("proj.data.csv")
library(dplyr)
data3 <- tbl_df(data3)
data3 <- mutate(data3, Date = as.character(Date), Time = as.character(Time), date_time = paste0(Date, "-", Time))
data3 <- mutate(data3, date_time = as.POSIXct(date_time, format = "%Y-%m-%d-%H:%M:%S"))

png(filename = "plot3.png", width = 480, height = 480)
with(data3, plot(x = date_time, y = Sub_metering_1, pch = NA,
                 xlab = "", ylab = "Energy sub metering"))
with(data3, lines(x = date_time, y = Sub_metering_1, col = "black"))
with(data3, lines(x = date_time, y = Sub_metering_2, col = "red"))
with(data3, lines(x = date_time, y = Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
