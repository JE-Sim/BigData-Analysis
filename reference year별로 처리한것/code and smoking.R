setwd("C:/Users/양수형/Documents/GitHub/BigData-Analysis/country code and continent")

continent <- read.csv("all.csv")

colnames(continent) <- c("Country.Name", "Region.Code", "Country.Code", "Continent", "Countinent.Region")
oce <- grep("Oceania", continent$Continent)
continent$Continent[oce] <- "Asia"
continent

write.csv(continent, "All.asia.csv", row.names = FALSE)

#smoking
setwd("C:/Users/양수형/Documents/GitHub/BigData-Analysis/reference year별로 처리한것")
smoking <- read.csv("Smoking.revised.revised.csv", header=T)
smoking <- smoking[order(smoking$Country.Name),]

code <- read.csv("국가코드 완성.csv", header=T)
c.name <- as.character(code$Country.Name)
o.name <- as.character(smoking$Country.Name)
common <- intersect(c.name, o.name)
code <- code[order(code$Country.Name),]

o.name1 <- code[code$Country.Name %in% common,]
smoking0 <- smoking[smoking$Country.Name %in% common,]
smoking1 <- cbind(o.name1, smoking0[,-1])
smoking1 <- na.omit(smoking1)


write.csv(smoking1, "smokingwithcode.csv", row.names=F)
