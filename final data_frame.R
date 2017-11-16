setwd("C:/Users/Á¤Àº/Desktop")
life <- read.csv("life.expectancy.revised.csv")
life <- life[,c(2, 3, 5)]
conti <- read.csv("All.asia.csv")
gdp <- read.csv("GDP.revised.csv")
sani <- read.csv("Sanitation.revised.csv")
edu <- read.csv("edu.recent.csv")
smo <- read.csv("Smoking.final.csv")
ob <- read.csv("Obesity.2016.csv")
colnames(ob)[3] <- "obesity"
al <- read.csv("Alchol.revised2.csv")
co2 <- read.csv("CO.2.revised.csv")
colnames(co2)[3] <- "CO2"
hiv <- read.csv("HIV.revised.csv")

cont <- conti[,c(1, 3, 4)]
levels(cont[ ,3])
code <- as.numeric(cont[,3])
code.matrix <- matrix(0, 248, 4)
code.matrix[1:248 + 248*(code-1)] <- 1
colnames(code.matrix) <- c("af", "am", "aa", "eu")
dummy <- cbind(cont[,-3], code.matrix[,c(3, 1, 2, 4)])

X <- merge(dummy, gdp, key = Country.Code)
X <- merge(X, sani, key = Country.Code) 
X <- merge(X, edu, key = Country.Code)
X <- merge(X, smo, key = Country.Code)
X <- merge(X, ob, key = Country.Code)
X <- merge(X, al, key = Country.Code)
X <- merge(X, co2, key = Country.Code)
X <- merge(X, hiv, key = Country.Code)
Total <- merge(life, X, key = Country.Code)
colnames(Total) <- c("Country.Name","Country.Code","life", "aa", "am", 
                     "af", "eu", "gdp", "sani", "pre", "pri", "sec", 
                     "ter", "smo", "ob", "al", "co2", "hiv")
write.csv(Total, "data.final.csv")
