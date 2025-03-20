r1 = read.csv("C:\\Users\\marin\\Downloads\\Data Analytics Academy\\Datasets\\rooms1.csv",header=T)
View(r1)

mode(r1) # shows the outter data type

str(r1)  # shows the inner datas types (inside the data frame)


attach(r1)
summary(Price)
table(City)

barplot(table(City)) # barplot plots the table of data 

# Needed library for fct_collapse function
library(forcats)
# Merge in one category Athens and Athina and also Thessaloniki with Salonika
City = fct_collapse(City, Athens=c("Athens","Athina"), Thessaloniki=c("Thessaloniki","Salonika"))
sort(table(City), decreasing = T)

barplot(sort(table(City), decreasing = T))

summary(Rooms)
barplot(table(Rooms))

summary(Baths)
barplot(table(Baths))

# Setting room with one room baths = 1 because of typo 10 in data 
Baths[which(Baths==10)]=1

r2=read.csv("C:\\Users\\marin\\Downloads\\Data Analytics Academy\\Datasets\\rooms2.csv")
View(r2)
attach(r2)

str(r2)

Breakfast=factor(Breakfast, levels=c(0,1), labels=c("No", "Yes"))
table(Breakfast)

barplot(table(Breakfast))
