#Setting the path
setwd("/Users/harshitasrivastava/Desktop/SDM/TeamLeada/MightyHive")

#Loading data into Abandoned and Reserved data seed
ABD <- read.csv("Abandoned_Data_Seed.csv", header = TRUE, stringsAsFactors = F)
RES <- read.csv("Reservation_Data_Seed.csv", header = TRUE, stringsAsFactors = F)
View(RES)
#Checking the structure of the data frame
str(ABD)

#Total rows in the Abandon data set - 8442
nrow(ABD)
#Total rows in the Abandon data set - 20814
nrow(RES)

#Omitting the rows which are empty from the intial dataset.
#The complete.cases function detects rows in a data.frame that do not contain any missing value
#None of the row is empty in our data set
ABD_Complete <- complete.cases(ABD)
is.na(ABD_Complete)

#The na.omit function resulting logical can be used to remove incomplete records from the data.frame. 
ABD_Complete1 <- na.omit(ABD_Complete)
#The row.names of the removed records are stored in an attribute called na.action.
na.action(ABD_Complete1)

#Abandoned Data Seed
#Removing the duplicates

#If the Incoming Phone is duplicated in the data set
ABD_Control_Phn_Duplicates = duplicated(ABD$Incoming_Phone)
#Removing the phone duplicates in the ABD control data file
ABD_Control_Phn_Duplicates_Removed = ABD[!ABD_Control_Phn_Duplicates,]
#The number of rows in the data set now is reduced to 7166
nrow(ABD_Control_Phn_Duplicates_Removed)
View(ABD_Control_Phn_Duplicates_Removed)

#If the Contact Phone is duplicated in the data set
ABD_Contact_Phn_Duplicates = duplicated(ABD_Control_Phn_Duplicates_Removed$Contact_Phone)
#The number of rows in the data set is now 7114
ABD_Contact_Phn_Duplicates_Removed=ABD_Control_Phn_Duplicates_Removed[!ABD_Contact_Phn_Duplicates,]
View(ABD_Contact_Phn_Duplicates_Removed)

#Storing the abandoned data after removing the duplicates in CleanData data frame
CleanData = ABD_Contact_Phn_Duplicates_Removed
CleanData <- CleanData[, c(2,7,9,10,11,12)] 
#Matching whether the Incoming Phone from the Abandoned set  data matched the same field in the reservation data
CleanData$Y <- ABD_Contact_Phn_Duplicates_Removed$Incoming_Phone %in% RES$Incoming_Phone

nrow(CleanData)

#Exporting data for control group with option of Buy
write.csv(CleanData,file = "/Users/harshitasrivastava/Desktop/SDM/TeamLeada/MightyHive/Clean_data_Final.csv")


