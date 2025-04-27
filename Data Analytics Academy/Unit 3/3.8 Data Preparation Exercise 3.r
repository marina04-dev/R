# Exercise 3 
# i) insert the 2 files of the excel dataset
library(readxl) 
d1 = read_excel("C:/Users/pc/Dropbox/DA eLearning College 
Link/datasets/cars.xlsx", col_names=FALSE, sheet = "cars1") 
View(d1) 
d2 = read_excel("C:/Users/pc/Dropbox/DA eLearning College 
Link/datasets/cars.xlsx", col_names=FALSE, sheet = "cars2") 
View(d2) 

# ii) convert the `price`, `years` and `km` columns to numeric
price=as.numeric(unlist(d1[(min(which(d1[,3]!="NA"))+1):max(which(d1[,3]!
 ="NA")),3])) 
years=lapply(d1[(min(which(d1[,4]!="NA"))+1):max(which(d1[,4]!="NA")),4], 
as.numeric)[[1]] 
km=as.numeric(unlist(d1[(min(which(d1[,5]!="NA"))+1):max(which(d1[,5]!="N
 A")),5])) 

# iii) convert the `brand`, `damage` and `accident` columns to categorical-factors
brand=as.factor(unname(unlist(d1[(min(which(d1[,6]!="NA"))+1):max(which(d
 1[,6]!="NA")),6]))) 
damage=factor(as.numeric(unlist(d2[(min(which(d2[,3]!="NA"))+1):max(which
 (d2[,3]!="NA")),3])),  
levels=c(0,1), labels=c("No", "Yes")) 
accident=factor(as.numeric(unlist(d2[(min(which(d2[,4]!="NA"))+1):max(whi
 ch(d2[,4]!="NA")),4])),  
levels=c(0,1), labels=c("No", "Yes"))
