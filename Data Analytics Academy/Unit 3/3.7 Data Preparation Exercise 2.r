# Exercise 2
# i) import the dataset 
cars1=read.table("C:/Users/pc/Dropbox/DA eLearning College 
Link/datasets/cars1.txt", header=T, dec=",") 
View(cars1) 
cars2=read.table("C:/Users/pc/Dropbox/DA eLearning College 
Link/datasets/cars2.txt", header=T) 
View(cars2) 

# ii) convert the values of column `price` to euros and `km` to kilometers and also round the `years`
# and also bind the datasets by column 
cars1$price=cars1$price*1000 
cars1$km=cars1$km*1000 
cars1$years=round(cars1$years) 
cars=cbind(cars1,cars2) 

# iii) provide summary statistics and plot of each numeric variable of the dataset 
attach(cars1) 
attach(cars2) 
summary(price) 
hist(price) 
summary(km) 
hist(km) 
summary(years) 
barplot(table(years), col="black") 

# iv) repeat iii) for categorical variables after you have convert them to factors
table(brand) 
barplot(table(brand)) 
damage=factor(damage, levels=c(0,1), labels=c("No","Yes")) 
table(damage) 
barplot(table(damage), col=c("green", "red")) 
accident=factor(accident, levels=c(0,1), labels=c("No","Yes")) 
table(accident) 
barplot(table(accident), col=c("green", "red")) 

# v) provide a scatterplot for variable `km` and `price`
plot(km, price) 

# vi) find the mean value of price for each levels of `brand` and make a boxplot of the 2 variables 
tapply(price, brand, mean) 
boxplot(price~brand) 

# vii) find the mean `price` of a car depended of whether it has a damage or not (`damage` column) 
tapply(price, damage, mean)
