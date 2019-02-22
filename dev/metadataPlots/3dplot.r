### MDViz ELTeC
mdfra<-read.table("ELTeC-fra.txt",header = T, sep = ",", fileEncoding = "UTF-8")
head(mdfra)
table(mdfra$year.cat,mdfra$gender.cat)
plot(mdfra)
str(mdfra)

### 3D plot
library(rgl)
plot3d(mdfra$gender.cat, mdfra$length.cat, mdfra$year.cat, xlab="gender",
       ylab = "length", zlab = "year",
       type="s", lit=FALSE)
snapshot3d("test")
