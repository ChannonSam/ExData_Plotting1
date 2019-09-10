# Getting and Cleaning the data:

library(data.table)
library(dplyr)
library(tidyr)
dat <- fread(file = "../../household_power_consumption.txt")
dat <- tbl_df(dat)
dat <- mutate(dat, Date = as.Date(Date, format = "%d/%m/%Y"))
dat <- filter(dat, Date <= as.Date("02/02/2007", format = "%d/%m/%Y") & Date >= as.Date("01/02/2007", format = "%d/%m/%Y"))
getwd()
fwrite(dat, file = "proj.data.csv")
