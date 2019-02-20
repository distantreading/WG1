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


### plot between fem/male per time slot, y length
ggplot(mdtest, aes(x=year, y=length, color=gender.cat, shape=gender.cat))+
  geom_vline(xintercept = c(1860,1880,1900), color="darkgray")+
  geom_point(size=3, alpha=0.8)+
  facet_wrap(~gender.cat~year.cat)+
  theme_minimal()

