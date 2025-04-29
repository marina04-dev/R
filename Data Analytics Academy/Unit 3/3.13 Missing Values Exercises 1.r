# Exercise 1

d=read.table("C:/Users/pc/Dropbox/DA eLearning College 
Link/datasets/cholNA.txt", header=T) 
View(d) 
attach(d) 

# i) find how many na's are on each variable
apply(is.na(d), 2, sum)  

# ii)  find in how many rows there is at least one missing value
which(!complete.cases(d)) 

# iii)  find how many na's there are on each row
apply(is.na(d[which(!complete.cases(d)),]),1,sum) 

# iv)  create a new categorical variable called GenderNA that will include 
# as level NAs and Gender variable. Count the distribution of each category and make a barplot of them
GenderNA=addNA(d$Gender) 
levels(GenderNA)=c("Female","Male", "NA") 
barplot(table(GenderNA)) 
barplot(table(Gender, useNA = "ifany")) 

# v)  make an associative array for Drug and GenderNA column
table(Drug, GenderNA) 

# vi) delete from the file the rows that contain more than one NA
omit=which(apply(is.na(d),1,sum)>1) 
d=d[-omit,] 

# vii) replace missing values from Glucose column with the mean value of the column
d[which(is.na(d$Glucose)),]$Glucose=round(mean(d$Glucose, na.rm=T),1) 

# viii)  in Cholesterol's missing values replace the value with the mean value of the Gender 
# in the row 
means=aggregate(Cholesterol~Drug+Gender, data=d, mean) 
rNA=which(is.na(d$Cholesterol)) 
for ( i in rNA) { 
meanrow=which(means$Drug==d[i,]$Drug & means$Gender==d[i,]$Gender) 
d[i,]$Cholesterol=round(means[meanrow,]$Cholesterol,1) 
print(c(d[i,]$Drug, d[i,]$Gender, round(means[meanrow,]$Cholesterol, 
1))) 
}
