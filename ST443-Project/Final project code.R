library("RSQLite")

#Connect to data 
db <- dbConnect(SQLite(),"C:/Users/cgott/Documents/ST449/Datasets/database.sqlite")
## list all tables
tables <- dbListTables(db)
#Creating DF for each table
Country <- dbGetQuery(db,"Select * from Country") 
League <- dbGetQuery(db,"Select * from League")
Match <- dbGetQuery(db,"Select * from Match")
Player <- dbGetQuery(db,"Select * from Player")
Player_Attributes <- dbGetQuery(db,"Select * from Player_Attributes")
Team <- dbGetQuery(db,"Select * from Team")
Team_Attributes <- dbGetQuery(db,"Select * from Team_Attributes")

#Data Cleaning
yearSplit=Match[Match$season=="2015/2016",] #Extracting just the data for the 2015/2016 season 
print(yearSplit[1:10,])

#Reading in school data
setwd("C:/Users/cgott/Documents/ST449/Datasets")
d2<- read.csv("2016_School_Explorer.csv")
schoolDF<- data.frame(d2, stringsAsFactors = FALSE)
