setwd("C:/Users/Á¤Àº/Desktop/data")
primary <- read.csv("Primary education.CSV")
low.2ndary <- read.csv("Lower Secondary education.CSV")
up.2ndary <- read.csv("Upper Secondary education.CSV")
primary <- primary[order(primary$ISO.code),]
low.2ndary <- low.2ndary[order(low.2ndary$ISO.code),]
up.2ndary <- up.2ndary[order(up.2ndary$ISO.code),]
education <- cbind(primary, low.2ndary$Total, up.2ndary$Total)
education1 <- education[complete.cases(education),]
education1
colnames(education1) <- c("ISO.code", "Country", "Reference.year", "Primary", "Lower.Secondary", "Upper.Secondary")
education1
write.csv(education1, file = "education enrollment", row.names = F)


pre.pri <- read.csv("pre-primary.csv")
str(pre.pri)
pre.pri[,3:4] <- NULL
colnames(pre.pri) <- c("Country", "ISO.CODE", 1960:2016)

pre.pri1 <- pre.pri
for(i in 1:nrow(pre.pri)){
  index <- !is.na(pre.pri[i,])
  index.1 <- order(index)[length(index)]
  pre.pri1$referenceYear[i] <- colnames(pre.pri)[index.1]
  pre.pri1$Total[i] <- pre.pri[i, index.1]
}
pre.pri1 <- pre.pri1[,c(1:2, 60:61)]
pre.pri1[which(pre.pri1$referenceYear == "ISO.CODE"),] <- NA
pre.pri1 <- pre.pri1[complete.cases(pre.pri1),]
pre.pri1

pre.pri$ISO.CODE[pre.pri$ISO.CODE %in% education1$ISO.code]
education1$ISO.Code
