# COVID-19 Data Preparation 
# import the dataset (the data is until 30/09/2020) 
URL="https://www.ecdc.europa.eu/sites/default/files/documents/COVID-19
geographic-disbtribution-worldwide-2020-09-30.xlsx" 

library(httr) 
GET(URL, write_disk(tf <- tempfile(fileext = ".xlsx"))) # save the data in a temporary file 

library(readxl) 
Data=as.data.frame(read_excel(tf)) # read the data as dataframe 

View(Data) 

# i) find the total number of na values by column 
apply(is.na(Data), 2, sum) 

# ii) find the total number of `deaths` and `cases` 
sum(Data$cases) ; sum(Data$deaths)

# iii)  create an array which will contain only information about Greece and find the total `deaths` and `cases`
GRData=Data[which(Data$countriesAndTerritories=="Greece"),] 
View(GRData) 
GRcases=rev(GRData$cases) 
GRdeaths=rev(GRData$deaths) 
sum(GRcases) ; sum(GRdeaths) 

# iv) make a plot for the number of deaths for each day and one for the Greece's number of deaths for each day
plot(GRcases, type="h") 
plot(GRdeaths, type="h") 
plot(cumsum(GRcases), type="l") 
plot(cumsum(GRdeaths), type="l") 

# v) make a plot for the cumulative cases of the last 14 days on every 100000 citizens of Greece 
plot(rev(GRData$`Cumulative_number_for_14_days_of_COVID
19_cases_per_100000`), type="l") 

# vi)  find the number of deaths for each month for Greece and make a plot 
aggregate(deaths~month, data=GRData[-dim(GRData)[1],], sum) 
plot(aggregate(deaths~month, data=GRData[-dim(GRData)[1],], sum), 
type="b") 

# vii) make a new tabble which will contain `Date` , `Country or Territory`, `Total Cases` and `Total Deaths`
Countries=as.factor(Data$countriesAndTerritories) 
CData=data.frame(matrix(NA, nrow(Data), 4)) 
colnames(CData)=c("Date", "Country or Territory", "Total Cases", "Total 
Deaths") 
CData$Date=Data$dateRep 
CData$"Country or Territory"=Data$countriesAndTerritories 
for ( i in levels(Countries)) { 
c=Data[which(Data$countriesAndTerritories==i), 5] 
d=Data[which(Data$countriesAndTerritories==i), 6] 
CData[which(Data$countriesAndTerritories==i),3]=rev(cumsum(rev(c))) 
CData[which(Data$countriesAndTerritories==i),4]=rev(cumsum(rev(d))) 
} 
View(CData) 

# viii) save the data in a txt file
write.table(CData, "C:/Users/pc/Dropbox/DA eLearning College 
Link/datasets/Cumulative-Data-Covid-19.txt", row.names = FALSE)
