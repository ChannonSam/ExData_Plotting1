# Plot 2 file:
data2 <- read.csv("proj.data.csv")
library(dplyr)
data2 <- tbl_df(data2)
data2 <- mutate(data2, Date = as.character(Date), Time = as.character(Time), date_time = paste0(Date, "-", Time))
data2 <- mutate(data2, date_time = as.POSIXct(date_time, format = "%Y-%m-%d-%H:%M:%S"))

png(filename = "plot2.png", width = 480, height = 480)
with(data2, plot(x = date_time, y = Global_active_power, pch = NA,
                 xlab = "", ylab = "Global Active Power (kilowatts)"))
with(data2, lines(x = date_time, y = Global_active_power))
dev.off()
