recentYear <- function(data) {
  data1 <- data[,c(1,2)]
  data <- data[,-c(1,2)]
  for(i in 1:nrow(data)){
    index <- !is.na(data[i,])
    index.1 <- order(index)[length(index)]
    data1$referenceYear[i] <- colnames(data)[index.1]
    data1$total[i] <- data[i, index.1]
  }
  return(data1)
}


# CO2
setwd("C:/Users/dlgpw/Documents/row data")
CO.2 <- read.csv("CO2 raw data.csv", header = T)
CO.2.1 <- recentYear(CO.2)
CO.2.1 <- na.omit(CO.2.1)
CO.2.1 <- CO.2.1[,-3]
colnames(CO.2.1) <- c("Country.Name", "Country.Code", "CO.2")
write.csv(CO.2.1, "CO.2.revised.CSV", row.names = F)

# HIV
HIV <- read.csv("HIV raw data.csv", header = T)
HIV.1 <- recentYear(HIV)
HIV.1 <- na.omit(HIV.1)
HIv.1 <- HIV.1[,-3]
colnames(HIV.1) <- c("Country.Name", "Country.Code", "HIV")
write.csv(CO.2.1, "HIV.revised.CSV", row.names = F)

# Alchol
Alchol <- read.csv("Alchol raw data.csv", header = T)
Alchol.1 <- recentYear(Alchol)
Alchol.1 <- na.omit(Alchol.1)
Alchol.1 <- Alchol.1[,-3]
colnames(Alchol.1) <- c("Country.Name", "Country.Code", "Alchol")
write.csv(CO.2.1, "Alchol.revised.CSV", row.names = F)

# GDP
GDP <- read.csv("GDP raw data.csv", header = T)
GDP.1 <- recentYear(GDP)
GDP.1 <- na.omit(GDP.1)
GDP.1 <- GDP.1[,-3]
colnames(GDP.1) <- c("Country.Name", "Country.Code", "GDP")
write.csv(GDP.1, "GDP.revised.CSV", row.names = F)

# Sanitation
Sanitation <- read.csv("Sanitation raw data.csv", header = T)
Sanitation.1 <- recentYear(Sanitation)
Sanitation.1 <- na.omit(Sanitation.1)
Sanitation.1 <- Sanitation.1[,-3]
colnames(Sanitation.1) <- c("Country.Name", "Country.Code", "Sanitation")
write.csv(Sanitation.1, "Sanitation.revised.CSV", row.names = F)

# Smoking : Country.Code x
Smoking <- read.csv("Smoking raw data.csv", header = T)
Smoking$Current.smoking[Smoking$Current.smoking=="Not available"] <- NA
Smoking$Daily.smoking[Smoking$Daily.smoking=="Not available"] <- NA
Smoking.1 <- na.omit(Smoking)
write.csv(Smoking.1, "Smoking.revised.CSV", row.names = F)

# Country.code 없는 나라 recent.year 함수 다시 만들어야할ㄷ
recent.year <- function(data) {
  data1 <- data[,1]
  data <- data[,-1]
  for(i in 1:nrow(data)){
    index <- !is.na(data[i,])
    index.1 <- order(index)[length(index)]
    data1$referenceYear[i] <- colnames(data)[index.1]
    data1$total[i] <- data[i, index.1]
  }
  return(data1)
}

# Obesity : Country.Code x
Obesity <- read.csv("Obesity raw data.csv", header = T)
Obesity[,2] <- substr(Obesity[,2],1,4)
Obesity[,3] <- substr(Obesity[,3],1,4)
Obesity[,4] <- substr(Obesity[,4],1,4)
Obesity[,5] <- substr(Obesity[,5],1,4)
Obesity

Obesity.1 <- recent.year(Obesity)

Obesity.1 <- na.omit(Obesity.1)
write.csv(Obesity.1, "Obesity.revised.CSV", row.names = F)