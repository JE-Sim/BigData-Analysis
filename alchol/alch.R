alchol <- read.csv("anchol.csv",header=TRUE)

alchol.2015 <- alchol[!is.na(alchol$X2015),]
rownames(alchol.2015) <- 1:231
colnames(alchol.2015) <- c("Country.Name","Country.Code","2015")
write.csv(alchol.2015,"Alchol.csv")
