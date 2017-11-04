setwd("C:/Users/Á¤Àº/Desktop/data")
life.expectancy <- read.csv("life expectancy.csv", header = T)
colnames(life.expectancy) <- replace(colnames(life.expectancy), c(-1, -2, -3), 1960:2016)

life.expec.recent <- life.expectancy[-c(1, 2, 3)]
life.expec.1 <- life.expectancy[c(1, 2, 3)]

for(i in 1:nrow(life.expec.recent)){
  index <- !is.na(life.expec.recent[i,])
  index.1 <- order(index)[length(index)]
  life.expec.1$referenceYear[i] <- colnames(life.expec.recent)[index.1]
  life.expec.1$Total[i] <- life.expec.recent[i, index.1]
}


life.expec.2 <- na.omit(life.expec.1)
life.expec.2 <- life.expec.2[-3]
write.csv(life.expec.2, "life.expectancy.revised.CSV")
