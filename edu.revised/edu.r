setwd("C:/Users/Á¤Àº/Desktop/data/edu.revised")
pre <- read.csv("pre-primary_1.csv", header = T)
pri <- read.csv("primary_1.csv", header = T)
sec <- read.csv("secondary_1.csv", header = T)
ter <- read.csv("tertiary_1.csv", header = T)
str(pre)

recentYear <- function(data) {
  data1 <- data[,c(1,2)]
  data <- data[,-c(1,2)]
  for(i in 1:nrow(data)){
    index <- !is.na(data[i,])
    index.1 <- order(index)[length(index)]
    data1$referenceYear[i] <- colnames(data)[index.1]
    data1$Total[i] <- data[i, index.1]
  }
  return(data1)
}
pre1 <- recentYear(pre)
pri1 <- recentYear(pri)
sec1 <- recentYear(sec)
ter1 <- recentYear(ter)

pre2 <- pre[,c(1,2,5)]; pre2 <- na.omit(pre2)
pri2 <- pri[,c(1,2,5)]; pri2 <- na.omit(pri2)
sec2 <- sec[,c(1,2,5)]; sec2 <- na.omit(sec2)
ter2 <- ter[,c(1,2,5)]; ter2 <- na.omit(ter2)

edu1 <- merge(pre1, pri1)
edu2 <- merge(pre2, pri2)

common <- function(data1, data2) {
  if(class(data1) == "data.frame") id.1 <- as.character(data1[,2])
    else id.1 <- data1
  if(class(data2) == "data.frame") id.2 <- as.character(data2[,2])
    else id.2 <- data2
  n.1 <- length(id.1)
  n.2 <- length(id.2)
  common <- rep(NULL, min(n.1, n.2))
  head.1 <- 1
  head.2 <- 1
  i <- 1
  while(head.1 <= n.1 & head.2 <= n.2) { # 1)
    if(id.1[head.1] <= id.2[head.2]) {
      if(id.1[head.1] == id.2[head.2]) {
        common[i] <- id.1[head.1]
        i <- i+1
        head.1 <- head.1 + 1
        head.2 <- head.2 + 1
      }
      else head.1 <- head.1 + 1 # 2.1)
    }
    else head.2 <- head.2 + 1 # 2.2)
  }
  return(common)
}

edu.code <- common(pre1, pri1)
edu.code1 <- common(sec1, ter1)
edu.index <- as.factor(common(edu.code, edu.code1))

pre0 <- pre1[edu.index, -3]
pri0 <- pri1[edu.index, 4]
sec0 <- sec1[edu.index, 4]
ter0 <- ter1[edu.index, 4]
edu1 <- cbind(pre0, pri0, sec0, ter0)
colnames(edu1)[3:6] <- c("pre-primary", "primary", "secondary", "tertiary")


edu.code <- common(pre2, pri2)
edu.code1 <- common(sec2, ter2)
edu.index <- as.factor(common(edu.code, edu.code1))

pre0 <- pre1[edu.index, -3]
pri0 <- pri1[edu.index, 4]
sec0 <- sec1[edu.index, 4]
ter0 <- ter1[edu.index, 4]
edu2 <- cbind(pre0, pri0, sec0, ter0)
colnames(edu2)[3:6] <- c("pre-primary", "primary", "secondary", "tertiary")

write.csv(edu1, "edu.recent.csv", row.names = F)
write.csv(edu2, "edu.2015.csv", row.names = F)
