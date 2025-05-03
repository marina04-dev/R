# Exercise 2

# i) make a new data frame binding the 2 files by column
c1=read.table("C:/Users/pc/Dropbox/DA eLearning College 
Link/datasets/cars1.txt", header=T, dec=",") 
c2=read.table("C:/Users/pc/Dropbox/DA eLearning College 
Link/datasets/cars2.txt", header=T, dec=",") 
cars=cbind(c1,c2) 
View(cars) 

# ii) find the NAs rate by column 
apply(is.na(cars), 2, sum) / nrow(cars) 

# iii)  delete the variables (if exist) that have rate of missing values bigger than 50%
del=which(apply(is.na(cars), 2, sum) / nrow(cars)>0.5) 
cars=cars[,-del] 

# iv)  convert variable damage into a factor and find the table of relative frequencies,
# either containing the NAs, either not.
attach(cars) 
cars$damage=factor(cars$damage, levels=0:1, labels=c("No", "Yes")) 
table(damage, useNA = "ifany") / nrow(cars) 
round(table(damage) / sum(!is.na(damage)),3) 

# v) find the mean price of cars that have filled value for km and for those who do not 
mean(price[which(!is.na(km))]) 
mean(price[which(is.na(km))]) 

# vi)  present the correlation table for brand and damage, with the NAs. Additionally,
# find the percentage of the cars that have damage based on the brand
t=table(brand, damage, useNA = "ifany")  
t[1,2]/sum(t[1,]) 
t[2,2]/sum(t[2,]) 
t[3,2]/sum(t[3,]) 

# vii)  using the cut command, create 3 ordered categorical variables for columns 
# price (Low, Moderate, High) and for years column (Few, Many) and km (Few, Many) 
# and name them with the relative column and the prefix cat.
 
catprice=ordered(cut(price, 3), labels=c("Low", "Moderate", "High")) 
catyears=ordered(cut(years, 2), labels=c("Few", "Many")) 
catkm=ordered(cut(km, 2), labels=c("Few", "Many")) 
 
table(catprice, catkm, catyears) 


# viii)  make an assesment of the NAs for km column using the columns catprice, catyears
# brand and damage. Replace eack NA with the mean value of km of the subset which has 
# the same values (levels) for the rest columns.
 
meanskm=aggregate(km~brand+damage+catprice+catyears, data=cars, mean) 
 
kmNA=which(is.na(cars$km)) 
 
 
 
for ( i in kmNA) { 
   
  mkm=which(meanskm$brand==cars[i,]$brand & 
meanskm$damage==cars[i,]$damage &  
                 meanskm$catprice==catprice[i] & 
meanskm$catyears==catyears[i]) 
   
  cars[i,]$km=round(meanskm[mkm,]$km,2) 
   
} 
 
# ix)  make an assesment of the NAs for column damage, using the columns catprice, catyears
# catkm and brand. For each NA find the percentage of cars that have damage for the subset 
# of the data that have the same values (levels) for the rest columns. 
# After replace "Yes" if the rate is greater than 50% and "No" if it is smaller.
 
countsdamage=aggregate(as.numeric(damage)
1~brand+catkm+catprice+catyears, data=cars, sum) 
totalcounts=as.data.frame(table(brand,catkm,catprice,catyears)) 
 
 
totalcounts$catprice=ordered(totalcounts$catprice, labels=c("Low", 
"Moderate", "High")) 
totalcounts$catyears=ordered(totalcounts$catyears, labels=c("Few", 
"Many")) 
totalcounts$catkm=ordered(totalcounts$catkm, labels=c("Few", "Many")) 
 
 
damageNA=which(is.na(cars$damage)) 
 
 
for ( i in damageNA) { 
   
  cdamage=which(countsdamage$brand==cars[i,]$brand &  
                     countsdamage$catkm==catkm[i] &  
                     countsdamage$catprice==catprice[i] &  
                     countsdamage$catyears==catyears[i]) 
   
  tdamage=which(totalcounts$brand==cars[i,]$brand &  
                  totalcounts$catkm==catkm[i] &  
                  totalcounts$catprice==catprice[i] &  
                  totalcounts$catyears==catyears[i]) 
   
   
cars[i,]$damage=ifelse(countsdamage[cdamage,5]/totalcounts[tdamage,5]>0.5,"Yes", "No")
print(list(i, totalcounts[tdamage, 1:4], round(countsdamage[cdamage,5]/totalcounts[tdamage,5],3))) }
