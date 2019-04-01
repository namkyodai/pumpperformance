minvalue=50 #NEED TO BE DEFINED
maxvalue=100 #NEED TO BE DEFINED
stepchange=10

step=seq(minvalue,maxvalue, by =1)


print(step)


etasa<-matrix(double(1),nrow=length(step),ncol=pumps)
h<-matrix(double(1),nrow=length(step))


for (j in 1: length(step)){
  for (i in 1:pumps){
    q<-data[i,3]  #NEED TO BE DEFINED
    p<-data[i,4]  #NEED TO BE DEFINED
    e<-data[i,5]  #NEED TO BE DEFINED
    
    h[j]<-step[j] #NEED TO BE DEFINED
    
    etasa[j,i]<-waterpower(h[j],q)/epower(p,e) #NEED TO BE DEFINED
  }
  
}

hello<-h #NEED TO BE DEFINED



#####################modify up and not down ########################
#start to Plot




print(etasa)

###################GRAPHT BEGIN
plot.new()
par(mar=c(5, 6, 4, 6) + 0.1)
for (i in 1: pumps){
  par(new=TRUE)
  plot(hello,etasa[,i], pch=1, axes=FALSE, ylim=c(0,100), xlab="", ylab="", type="l",col=colors[i], lwd=1)
  
  
  #axis(1,c(seq(0,T, by=500)))
  
  points(data[i,2],eta[i],pch=23,bg="red",lwd=1)
  
}

axis(2, ylim=c(step[1],step[length(step)]),col="black",las=1)  ## las=1 makes horzontal labels

axis(1,pretty(range(hello),stepchange))

mtext(expression(paste("Efficiency  (",, "%)")),side=2,col="black",line=2)
mtext(expression(paste("Parameter ", "H")),side=1,col="black",line=2.5) 

box()

###################GRAPHT END

grid(10, 10, col = "lightgray", lty = "dotted",lwd = par("lwd"), equilogs = TRUE)

legend("bottomright",inset=.08,legend=c(seq(1:pumps)), text.col=c("black"),lty=c(1,1,1,1,1,1,1), col=colors,horiz=F,cex=1,box.col = "black", title="Pumps")
