setwd("C:/Users/����/Desktop/data")
co2 <- read.csv("CO2.csv")
colnames(co2) <- c("country", 2013:2015)
write.csv(co2, "co2.revised.csv", row.names = F)