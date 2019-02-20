### MDViz ELTeC
mdtest<-read.table("metadata.txt",header = T, sep = ",", fileEncoding = "UTF-8")
head(mdtest)
table(mdtest$year.cat,mdtest$gender.cat)
plot(mdtest)
str(mdtest)
## composition plots
library(ggplot2)

### plot between fem/male per year, y length
ggplot(mdtest, aes(x=year, y=length, color=gender.cat, shape=gender.cat))+
  geom_vline(xintercept = c(1860,1880,1900), color="darkgray")+
  geom_point(size=3, alpha=0.8)+
  facet_grid(~gender.cat)+
  theme_minimal()

### plot between fem/male per year, y length, shape canon cat
ggplot(mdtest, aes(x=year, y=length, color=gender.cat, shape=canon.cat))+
  geom_vline(xintercept = c(1860,1880,1900), color="darkgray")+
  geom_point(size=3, alpha=0.8)+
  facet_grid(~gender.cat)+
  theme_minimal()+
  ggtitle("composition depending on gender, year, length, and reprint")
ggsave("com.png")

### mosaic plot
install.packages(vcd)
library(vcd)
mosaic(~ length.cat + year.cat + gender.cat, data=mdtest,
       highlighting = "gender.cat", highlighting_fill=c("lightblue", "pink"),
       direction=c("v","h","h"),
       labeling = labeling_values,)


### pie chart
sum<-table(mdfra$counter)
sum
sumyear<-table(mdfra$year.cat)
sumyear

sumgen<-table(mdfra$gender.cat)
sumgen
table(mdfra)
round(table(mdfra) / length(gender.cat) *100 ,2)


install.packages(MASS)
fold<- table(sum$sumyear)
fold
pie(fold)

### ??
ggplot(mdfra, aes(x=year, y=length, color=gender.cat, shape=gender.cat))+
  geom_vline(xintercept = c(1860,1880,1900), color="darkgray")+
  geom_point(size=3, alpha=0.8)+
  facet_wrap(~gender.cat~year.cat)+
  theme_minimal()

### plot between fem/male per time slot, y length
ggplot(mdfra, aes(x=year, y=length, color=gender.cat, shape=gender.cat))+
  geom_vline(xintercept = c(1860,1880,1900), color="darkgray")+
  geom_point(size=3, alpha=0.8)+
  facet_wrap(~gender.cat~year.cat)+
  theme_minimal()

### plot per topic
ggplot(mdfra, aes(x=year, y=length, color=gender.cat, shape=gender.cat))+
  geom_vline(xintercept = c(1860,1880,1900), color="darkgray")+
  geom_point(size=3, alpha=0.8)+
  facet_wrap(~gender.cat~year.cat~subgenre)+
  theme_minimal()

### balloon graphics

library(ggpubr)
ggballoonplot(mdfra, x="year.cat", y="length.cat", facet.by="gender.cat", size="length")

ggplot(mdfra, aes(x=year.cat,y=canon.cat, size=length(gender.cat),color=length))+
  geom_point()+
  facet_grid(~gender.cat)
