setwd("C:/Users/dlgpw/Documents/data")
HIV <- read.csv("Prevalence of HIV.csv", header = T)
HIV.1 <- HIV[complete.cases(HIV),]
colnames(HIV.1) <- c("Country.Name", "Country.Code", 2014:2016)
write.csv(HIV.1, file = "Prevalence of HIV selected.csv", row.names = F)

CO2 <- read.csv("Territorial emissions in MtCO2.csv", header = T)
CO2.1 <- CO2[complete.cases(CO2),]
colnames(HIV.1) <- c("Country.Name", 2013:2015)
write.csv(CO2.1, file = "CO2 emission in MTCO2.csv", row.names = F)


