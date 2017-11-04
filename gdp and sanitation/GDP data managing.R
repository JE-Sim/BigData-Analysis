GDP <- read.csv("gdp1.csv",header=TRUE)
sanitation <- read.csv("sanitation1.csv", header=TRUE)

GDP.2014 <- GDP[which(!is.na(GDP$X2014)),]
GDP.2015 <- GDP.2014[which(!is.na(GDP.2014$X2015)),]
GDP.2016 <- GDP.2015[which(!is.na(GDP.2015$X2016)),]

rownames(GDP.2016) <- 1:225

write.csv(GDP.2016, "GDP managed.csv")

san.2014 <- sanitation[!is.na(sanitation$X2014),]
san.2015 <- san.2014[!is.na(san.2014$X2015),]

rownames(san.2015) <- 1:238
write.csv(san.2015, "Sanitation managed.csv")
