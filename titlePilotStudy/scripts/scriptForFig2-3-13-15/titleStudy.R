### Study: ELTeC explorative title study
### COST Action 16204 Distant Reading https://www.distant-reading.net/
### Data from ELTeC-deu, -eng, -fra, -ita, -pol, -por, -rom, -slv, -spa, -srp, -ukr
### Authors: Roxana Patra, Carolin Odebrecht, Rosario Arias, Ioana Galleron, Berenike Herrmann,
### Cvetana Krstev, Katja Mihurko, Dmitry Yesypenko


library(ggplot2)
library(gtools)
library(readxl)
library(tidyr)
library(dplyr)
library(purrr)
library(vcd)
library(compare)
library(egg) 
library(patchwork)

#############
# Titles in ELTeC#
#############

##################################################
### creating df for titles of language collections
##################################################

dfDeu<-readxl::read_xlsx(paste0("./data/deu.xlsx"))
dfDeu$Lang<-"Deu"
dfEng<-readxl::read_xlsx(paste0("./data/eng.xlsx"))
dfEng$Lang<-"Eng"
dfFra<-readxl::read_xlsx(paste0("./data/fra.xlsx"))
dfFra$Lang<-"Fra"
dfIta<-readxl::read_xlsx(paste0("./data/ita.xlsx"))
dfIta$Lang<-"Ita"
dfPol<-readxl::read_xlsx(paste0("./data/pol.xlsx"))
dfPol$Lang<-"Pol"
dfRom<-readxl::read_xlsx(paste0("./data/rom.xlsx"))
dfRom$Lang<-"Rom"
dfSlv<-readxl::read_xlsx(paste0("./data/slv.xlsx"))
dfSlv$Lang<-"Slv"
dfSrp<-readxl::read_xlsx(paste0("./data/srp.xlsx"))
dfSrp$Lang<-"Srp"
dfSpa<-readxl::read_xlsx(paste0("./data/spa.xlsx"))
dfSpa$Lang<-"Spa"
dfUkr<-readxl::read_xlsx(paste0("./data/ukr.xlsx"))
dfUkr$Lang<-"Ukr"


# combine df of each language collection to a combined df
library(data.table)
dfComb<-list(dfDeu, dfEng, dfFra, dfIta, dfRom, dfPol, dfSlv, dfSpa, dfSrp, dfUkr) %>%
  rbindlist(., fill = TRUE)
# create a dataframe from list
dfComb<-as.data.frame(dfComb)


##################################################
### data cleaning and preprocessing
##################################################

# replace NA with "no" according to our guidelines
dfComb[is.na(dfComb)] <- "no"
# replace values "more" and "one" with "yes" 
#in other-columns to be consistent with other columns
dfComb$other[dfComb$other=="more"]<-"yes"
dfComb$other[dfComb$other=="one"]<-"yes"
dfComb$otherII[dfComb$otherII=="one"]<-"yes"
dfComb$otherII[dfComb$otherII=="more"]<-"yes"
dfComb$otherIII[dfComb$otherIII=="one"]<-"yes"
dfComb$otherIII[dfComb$otherIII=="more"]<-"yes"

# replace values "no" and "unspecified" wiht "no" 
# in column Reprints to be consistent with other columns
dfComb$Reprints[dfComb$Reprints=="unspecified"]<-"no"

#View(dfComb)
#library("writexl")
#write_xlsx(dfComb,"all.xlsx")

###overview

ggplot(dfComb, aes(x=Lang, fill=Slot))+
  geom_bar()+
  theme_minimal()+
  ggsave("fig2.png")


##################################################
### Counts of persons, places and other entities
##################################################
#head(dfComb)
#add column for frequencies of all entities
dfComb$freqEntities <- dfComb  %>% select(place,placeII, person, personII, personIII, other, otherII, otherIII) %>%
  mutate(freqEntities = rowSums(. != "no")) %>%
  select(freqEntities)

#add column for frequencies of persons
dfComb$freqPerson <- dfComb  %>% select(person, personII, personIII) %>%
  mutate(freqPerson = rowSums(. != "no")) %>%
  select(freqPerson)

#add column for frequencies of places
dfComb$freqPlace <- dfComb  %>% select(place, placeII) %>%
  mutate(freqPlace = rowSums(. != "no")) %>%
  select(freqPlace)

#add column for frequencies of other
dfComb$freqOther <- dfComb  %>% select(other, otherII, otherIII) %>%
  mutate(freqOther = rowSums(. != "no")) %>%
  select(freqOther)

#add column for frequencies of all semantic roles
dfComb$freqRoles <- dfComb  %>% select(placeRole, placeIIRole, 
                                       otherEntityRole, otherEntityIIRole, otherEntityIIIRole, 
                                       personRole, personIIRole, personIIIRole) %>%
  mutate(freqRoles = rowSums(. != "no")) %>%
  select(freqRoles)

#View(dfComb)

####
# plot for mean frequencies and standard error 
####

#dfComb %>% group_by(Slot) %>%
#  summarise(mean.ent = mean(data.matrix(freqEntities), na.rm = TRUE),
#            sd.ent = sd(data.matrix(freqEntities), na.rm = TRUE),
#            n.ent = n()) %>%
#  mutate(se.ent = sd.ent / sqrt(n.ent),
#         lower.ci = mean.ent - qt(1 - (0.05 / 2), n.ent - 1) * se.ent,
#         upper.ci = mean.ent + qt(1 - (0.05 / 2), n.ent - 1) * se.ent) %>% 
#  ggplot(aes(x=Slot, y=mean.ent))+
#  geom_point()+
#  geom_pointrange(aes(ymin=mean.ent-lower.ci, ymax=mean.ent+upper.ci))+
#  ggsave("meanFreqwithESPerSlot.png")

##################################################
### What is a title?
##################################################

####  
# II a Overview 
####

### entity types and frequencies merged

#allPerSlot<-aggregate(dfComb$freqEntities, by=list(Category=dfComb$Slot), FUN=sum)
#allPerSlot<-aggregate(dfComb$freqPerson, by=list(Category=dfComb$Slot), FUN=sum)


### plot aggregate frequencies of entities
EntitesPerSlot<-aggregate(dfComb$freqEntities, by=list(Category=dfComb$Slot), FUN=sum)
A<-ggplot(EntitesPerSlot, aes(x=Category, y=freqEntities))+
  geom_point()+
  labs(y= "Frequency of all entities", x = "Slot")

### plot aggregate frequencies of persons
personPerSlot<-aggregate(dfComb$freqPerson, by=list(Category=dfComb$Slot), FUN=sum)
B<-ggplot(personPerSlot, aes(x=Category, y=freqPerson))+
  geom_point()+
  labs(y= "Frequency of person references", x = "Slot")

### plot aggregate frequencies of places
placePerSlot<-aggregate(dfComb$freqPlace, by=list(Category=dfComb$Slot), FUN=sum)
C<-ggplot(placePerSlot, aes(x=Category, y=freqPlace))+
  geom_point()+
  labs(y= "Frequency of place references", x = "Slot")

### plot aggregate frequencies of other
otherPerSlot<-aggregate(dfComb$freqOther, by=list(Category=dfComb$Slot), FUN=sum)
D<-ggplot(otherPerSlot, aes(x=Category, y=freqOther))+
  geom_point()+
  labs(y= "Frequency of other entities", x = "Slot")

########
# plot combined all major types of  entities
########

#fig 3
ggarrange(A,B,C,D)


#### III. Titles as charades 
# III a factor plots 

dfComb$freqEntities.factor <-as.factor(data.matrix(dfComb$freqEntities))
ggplot(dfComb, aes(x=Slot, fill=freqEntities.factor))+
  geom_bar(position=position_dodge())+
  ggsave("fig13.png")


################################
# III b structure of titles
################################

#fig 15
mosaic(~ twoContentElement + Lang, data=dfComb,
       highlighting = "twoContentElement", highlighting_fill=c("lightblue", "orange"),
       direction=c("v","h"),
       labeling = labeling_values)