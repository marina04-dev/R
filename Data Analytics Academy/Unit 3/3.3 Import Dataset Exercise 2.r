# Exercise 2
#i) view data after inserting them
Data=read.csv("C:/Users/pc/Dropbox/DA eLearning College 
Link/datasets/world.csv", header = T) 
View(Data) 

#ii)  find the number of variables and the number of observations of the table
dim(Data) 

#iii)  find the mean of `populatn` column 
mean(Data$populatn) 

#iv)  multiply all values of `populatn` column by 1000 and change the name to `population`
Data$populatn=Data$populatn*1000 
names(Data)[which(names(Data)=="populatn")]="population" 

#v) extract the file with name `world2.csv`
write.csv(Data, "C:/Users/pc/Dropbox/DA eLearning College 
Link/datasets/world2.csv", row.names = FALSE) 
