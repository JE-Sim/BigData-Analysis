setwd("C:/Users/정은/Desktop")
life <- read.csv("life.expectancy.revised.csv")
life <- life[,c(2, 3, 5)]
conti <- read.csv("All.asia.csv")
gdp <- read.csv("GDP.revised.csv")
sani <- read.csv("Sanitation.revised.csv")
edu <- read.csv("edu.recent.csv")
smo <- read.csv("Smoking.final.csv")
smo <- smo[,-3]
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
write.csv(Total, "data.final.csv", row.names = F)

df <- read.csv("data.final.csv")


life <- df$life; aa <- df$aa; am <- df$am; af <- df$af; eu <- df$eu
gdp <- df$gdp; sani <- df$sani; pre <- df$pre; pri <- df$pri
sec <- df$sec; ter <- df$ter; smo <- df$smo; ob <- df$ob
al <- df$al; co2 <- df$co2; hiv <- df$hiv

reg <- lm(life ~ gdp+sani+pre+pri+sec+ter+smo+ob+al+co2+hiv)
names(reg)
reg$fitted.values
plot(life-reg$fitted.values)
cor(life, reg$fitted.values)
plot(reg$residuals)
anova.reg <- anova(reg)
names(df)

df1 <- df[,-c(1, 2, 3, 4, 5, 6, 7)]

par(mfrow = c(3, 4))
for (j in c(1:12)){
  plot(df1[,j], life, color=c("white","gray"), xlab=colnames(df1)[j], main=paste("x", j))
}

# gdp 로그변환, sani, pre, smo, ob(two group), al, co2 로그 변환, hiv 로그 변환

df2 <- cbind(log(gdp, 10), sani, pre, smo, al, log(co2, 2), log(hiv, 2))
colnames(df2) <- c("log.gdp", "sani", "pre", "smo", "al", "log.co2", "log.hiv")
par(mfrow = c(3, 3))
for (j in c(1:7)){
  plot(df2[,j], life, color=c("white","gray"), xlab=colnames(df2)[j], main=paste("x", j))
}

answer <- NULL
for (j in c(1:7)){
  answer <- c(answer, cor(life, df2[,j]))
}
answer
plot(smo ~ ob)
plot(log(gdp, 10) ~ ob)
plot(al ~ ob)

