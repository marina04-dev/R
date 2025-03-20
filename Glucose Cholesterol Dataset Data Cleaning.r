data <- read.table("C:\\Users\\marin\\Downloads\\Data Analytics Academy\\Datasets\\chol2.txt", header=T)
View(data)

mean(data$Cholesterol)
mean(data$Glucose)
var(data$Cholesterol)
var(data$Glucose)
min(data$Cholesterol)
min(data$Glucose)
max(data$Glucose)
max(data$Cholesterol)

attach(data)

tapply(Cholesterol, Drug, mean)
tapply(Cholesterol, Drug, var)
tapply(Cholesterol, Drug, min)
tapply(Cholesterol, Drug, max)

tapply(Glucose, Drug, mean)
tapply(Glucose, Drug, var)
tapply(Glucose, Drug, min)
tapply(Glucose, Drug, max)


tapply(Cholesterol, Gender, mean)
tapply(Cholesterol, Gender, var)
tapply(Cholesterol, Gender, min)
tapply(Cholesterol, Gender, max)

tapply(Glucose, Gender, mean)
tapply(Glucose, Gender, var)
tapply(Glucose, Gender, min)
tapply(Glucose, Gender, max)



aggregate(Cholesterol~Drug+Gender, data=data, mean)
aggregate(Cholesterol~Drug+Gender,data=data, var)
aggregate(Cholesterol~Drug+Gender,data=data, min)
aggregate(Cholesterol~Drug+Gender,data=data, max)

aggregate(Glucose~Drug+Gender,data=data, mean)
aggregate(Glucose~Drug+Gender,data=data, var)
aggregate(Glucose~Drug+Gender,data=data, min)
aggregate(Glucose~Drug+Gender,data=data, max)


compf1=function(DATA, numeric, factor, fun) {
  
  d=aggregate(numeric~factor, data=DATA, fun)
  colnames(d)=c(substitute(factor), substitute(numeric))
  o=order(d[,dim(d)[2]], decreasing = T)
  
  d[o,]
  
}
compf1(data, Cholesterol, Drug, mean)



compf2=function(DATA, numeric, factors, fun) {
  #factors
  if (length(substitute(factors))>1) {
    form=paste(substitute(factors)[-1], collapse = '+')
    final=formula(paste(substitute(numeric), "~", form))
    d=aggregate(final, data=DATA, fun)
    colnames(d)=c(paste(substitute(factors)[-1]), substitute(numeric))
    
    o=order(d[,dim(d)[2]], decreasing = T)
    
    return(d[o,])
    
  } else {
    
    d=aggregate(numeric~factors, data=DATA, fun)
    colnames(d)=c(substitute(factors), substitute(numeric))
    o=order(d[,dim(d)[2]], decreasing = T)
    
    return(d[o,])
    
  }
  
  
}
compf2(Data2, Cholesterol, factors=c(Drug,Gender), fun=mean)
compf2(Data2, Cholesterol, factors=c(Gender), fun=mean)
compf2(Data2, Cholesterol, factors=Gender, fun=mean)

