r1=read.csv("C:/Users/pc/Dropbox/DA eLearning College 
Link/datasets/rooms1.csv", header = T, sep=",") 
View(r1) 
mode(r1) 
str(r1) # shows the inner represantation of the datasets variables 

######################### 
attach(r1) 
summary(Price) # it shows a quick summary of the descriptive statistics of the variable  

# Cleaning Step 
hist(Price) 
table(City)  
barplot(table(City)) 

library(forcats) 
City=fct_collapse(City, Athens=c("Athens", "Athina"), 
Thessaloniki=c("Thessaloniki", "Salonika"))  # collapse the same levels of the categorical variable that have a different name 

sort(table(City), decreasing = T)  
barplot(sort(table(City), decreasing = T)) 
summary(Rooms)  
barplot(table(Rooms)) 

summary(Baths)  
barplot(table(Baths)) 
Baths[which(Baths==10)]=1 # find the wrong value and correct it (one room can't have 10 bathrooms)

######################### 
r2=read.csv("C:/Users/pc/Dropbox/DA eLearning College 
Link/datasets/rooms2.csv", header = T) 
View(r2) 
mode(r2) 
str(r2) 
attach(r2) 

# name the different levels of a categorical variable 
Breakfast=factor(Breakfast, levels = c(0,1), labels = c("No", "Yes")) 
table(Breakfast) 
barplot(table(Breakfast)) 
