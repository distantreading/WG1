### MDViz ELTeC
# R script to produce mosaic plot from data in file "metadata.csv"
  md<-read.table("metadata.csv",header = T, sep = ",", fileEncoding = "UTF-8")
  head(md)
  table(md$year.cat,md$gender.cat)

#  plot(md)
  str(md)
  
# if package vcd not installed, uncomment following line and run as root
#install.packages("vcd")

library(vcd)

#args = commandArgs(trailingOnly=TRUE)
#print(args)
#oFile=paste(args[2], "/mosaic.png", sep="")
#print(oFile)
#jpeg(oFile)
mosaic(~ length.cat + year.cat + gender.cat, data=md,
       highlighting = "gender.cat", 
       highlighting_fill=c("pink","lightblue"),
       direction=c("v","h","h"),
       labeling = labeling_values,
       main="Title counts for each balance criterion")

