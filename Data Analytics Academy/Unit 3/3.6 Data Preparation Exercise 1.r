# Exercise 1
# i) import the dataset in r studio and find the variables data type and inner represantation
Data3=read.table("C:/Users/pc/Dropbox/DA eLearning College 
Link/datasets/chol3.txt", header = T) 
mode(Data3) 
str(Data3) 
View(Data3) 

# ii) convert `Cholesterol` and `Glucose` to numeric 
Data4=matrix(NA, 100, 4) 
for ( i in 1:100 ) {  
Data4[i,] = strsplit(as.character(Data3[i,]), " ")[[1]] # extract the values of each column 
} 
View(Data4) 

Data5=as.data.frame(Data4) 
View(Data5) 
names(Data5)=c("Cholesterol", "Drug", "Gender", "Glucose") 
as.numeric(Data5$Cholesterol) 
Data5$Cholesterol=as.numeric(as.character(Data5$Cholesterol)) 
Data5$Glucose=as.numeric(as.character(Data5$Glucose)) 

# iii) provide summary statistics and visualize them for each numeric variable  
attach(Data5) 
summary(Cholesterol) 
hist(Cholesterol) 
summary(Glucose) 
hist(Glucose)
