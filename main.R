#this program is coded by Nam and Peter
#all right reserved

#load dependent R packages
library(RColorBrewer)
library(randomcoloR)


#read the data

data <- read.csv(file="pumpdata.csv", header=TRUE, sep=",")
data=data.frame(data)

#parameter
gamma<-9.81
pumps <- length(data[,1])

#colors <- distinctColorPalette(pumps)
colors=c("red","violet","chartreuse3","chocolate1","darkgoldenrod1","darkmagenta","darkslategray")

#Step 1
# define the functions

#----------Water Power
waterpower<- function(h,q){
  gamma*h*q
}
#print(waterpower(2,3))
#---------
#---------Electrical power
epower<- function(p,e){
  p*e
}
#print(epower(2,3))
#-----calculate the efficiency
eta<-matrix(double(1),nrow=1,ncol=pumps)

for (i in 1:pumps){

  h<-data[i,2]
  q<-data[i,3]
  p<-data[i,4]
  e<-data[i,5]
  eta[i]<-waterpower(h,q)/epower(p,e)
}

print(eta)
#-------Sensitivity analysis

source("sa_h.R")

source("sa_q.R")

source("sa_p.R")

source("sa_e.R")


