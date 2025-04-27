# Exercise 3
# i) import dataset 
Data2=read.table("C:/Users/pc/Dropbox/DA eLearning College 
Link/datasets/chol2.txt", header = T) 

# ii)  find the mean, var, min, max of columns `Cholesterol` and `Glucose`
attach(Data2) 
mean(Cholesterol) ; var(Cholesterol) ; min(Cholesterol) ; 
max(Cholesterol) 
mean(Glucose) ; var(Glucose) ; min(Glucose) ; max(Glucose) 

# iii)  find the measures of ii) grouped by Drug
tapply(Cholesterol, Drug, mean) 
tapply(Cholesterol, Drug, var) 
tapply(Cholesterol, Drug, min) 
tapply(Cholesterol, Drug, max) 
tapply(Glucose, Drug, mean) 
tapply(Glucose, Drug, var) 
tapply(Glucose, Drug, min) 
tapply(Glucose, Drug, max) 

# iv)  find the measures of ii) grouped by Gender
tapply(Cholesterol, Gender, mean) 
tapply(Cholesterol, Gender, var) 
tapply(Cholesterol, Gender, min) 
tapply(Cholesterol, Gender, max) 
tapply(Glucose, Gender, mean) 
tapply(Glucose, Gender, var) 
tapply(Glucose, Gender, min) 
tapply(Glucose, Gender, max) 

# v)  find the measures of ii) grouped by Drug and Gender 
aggregate(Cholesterol~Drug+Gender, data=Data2, mean) 
aggregate(Cholesterol~Drug+Gender, data=Data2, var) 
aggregate(Cholesterol~Drug+Gender, data=Data2, min) 
aggregate(Cholesterol~Drug+Gender, data=Data2, max) 
aggregate(Glucose~Drug+Gender, data=Data2, mean) 
aggregate(Glucose~Drug+Gender, data=Data2, var) 
aggregate(Glucose~Drug+Gender, data=Data2, min) 
aggregate(Glucose~Drug+Gender, data=Data2, max) 
 
 
# vi)  construct a function which will take as parameters a dataset, one numeric variable, one categorical and one measure
# the function should calculate the values of the measure on the numeric variable for the different levels of 
# the categorical variable. It will then return an array with the values ordered and the names above them.
 
 
compf1=function(DATA, numeric, factor, fun) { 
   
  d=aggregate(numeric~factor, data=DATA, fun) 
  colnames(d)=c(substitute(factor), substitute(numeric)) 
  o=order(d[,dim(d)[2]], decreasing = T) 
   
  d[o,] 
   
  } 
 
compf1(Data2, Cholesterol, Drug, mean) 
 
 
# vii)  construct a function similar to vi) but it will also have the ability to take as arguments more than one 
# categorical variables and it will calculate the measure of the numeric variable for the different combinations of the 
# the categorical variables.
 
 
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
