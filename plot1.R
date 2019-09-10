# Plot 1 file:
data1 <- read.csv("proj.data.csv")

png(filename = "plot1.png", width = 480, height = 480)
hist(dat$Global_active_power, breaks = seq(from = 0, to = 8, by = 0.5), col = "red",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", 
     main = "",
     axes = FALSE)
axis(side = 1, at = c(0, 2, 4, 6), labels = c(0, 2, 4, 6))
axis(side = 2, at = seq(0, 1200, by = 200), labels = seq(0, 1200, by = 200))
title(font = 2, main = "Global Active Power")

dev.off()
