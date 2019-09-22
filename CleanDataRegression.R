
#Setting the path
setwd("/Users/harshitasrivastava/Desktop/SDM/TeamLeada/MightyHive")

ABD <- read.csv("Abandoned_Data_Seed.csv", header = TRUE, stringsAsFactors = F)
View(ABD)
#For question number 2
ABD_test <- read.csv("Abandoned_Data_TestAs1.csv", header = TRUE, stringsAsFactors = F)
library(MASS)
data(ABD_test)
summary(ABD_test)
q95.gaussian <- qnorm(0.95,mean=mean(ABD_test$Test_control),sd=sd(ABD_test$Test_control))
1.327759
q5.gaussian <- qnorm(0.05,mean=mean(ABD_test$Test_control),sd=sd(ABD_test$Test_control))
-0.3170983
quantile(ABD_test$Test_control,.95)
quantile(ABD_test$Test_control,.05)
#Loading Clean data 
CleanData <- read.csv("Clean_data.csv", header = TRUE, stringsAsFactors = F)
View(CleanData)
summary(CleanData$Test.Variable)
qqplot(CleanData$Outcome,CleanData$Test.Variable)


fit1 <- lm(formula = CleanData$Outcome ~ CleanData$Test.Variable)
summary(fit1)
plot(CleanData$Outcome ~ CleanData$Test.Variable)
abline(f1,col="red")
fit2 <- lm(formula = CleanData$Outcome ~ CleanData$Test.Variable+ CleanData$Email_ID + CleanData$Incoming_Phone )
summary(fit2)

a_obs = na.omit(CleanData$Outcome)
b_obs = na.omit(CleanData$Test.Variable)
a_proportion = sum(a_obs)/length(a_obs)
b_proportion = sum(b_obs)/length(b_obs)

#For question number 3
CleanData <- read.csv("Clean_data.csv", header = TRUE, stringsAsFactors = F)
CleanData_State <- CleanData[CleanData$State == 1,]
View(CleanData)
nrow(CleanData)
summary(CleanData_State$Test.Variable)

#Question 10
Clean_data_5states <- read.csv("Clean_data_5states.csv", header = TRUE, stringsAsFactors = F)
View(Clean_data_5states)
nrow(Clean_data_5states)

#QUESTION 14
Data_response_time <- read.csv("Result Using  Excel.csv", header = TRUE, stringsAsFactors = F)
View(Data_response_time)
f2 <- lm(formula = Data_response_time$Y ~ Data_response_time$X + Data_response_time$Days_in_Between + Data_response_time$Days_in_Between + Data_response_time$D_State + Data_response_time$D_Email + Data_response_time$INT_T_STATE +Data_response_time$INT_T_EMAIL)
summary(f2)


#Question 15
Clean_data_INT <- read.csv("Clean_data_INT.csv", header = TRUE, stringsAsFactors = F)
View(Clean_data_INT)


ABD_Complete <- complete.cases(Clean_data_INT)
is.na(ABD_Complete)

#The na.omit function resulting logical can be used to remove incomplete records from the data.frame. 
ABD_Complete1 <- na.omit(ABD_Complete)
#The row.names of the removed records are stored in an attribute called na.action.
na.action(ABD_Complete1)
e <- as.numeric(Clean_data_INT$D_Email_ID)
f1 <- lm(formula = Clean_data_INT$Outcome ~ Clean_data_INT$Test.Variable + e + Clean_data_INT$Incoming_Phone +Clean_data_INT$D_State+Clean_data_INT$INT_STATE+Clean_data_INT$INT_EMAIL_ID )
str(Clean_data_INT)
summary(f1)

 now <- Sys.time()
 then <- Sys.time()
 then - now