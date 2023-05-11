data <- read.csv("pollutionData.csv")
data
# check for data types of the variables
str(data)

#check for null values
is.null(data)

#check the summary statistics of the dataset
summary(data)

#convert timestamp data type from chr to POSIXct
data$timestamp <- as.POSIXct(data$timestamp, format = "%d/%m/%Y %H:%M")
# check class of converted variable datatype
class(data$timestamp)

#dropping the longitude and latitude columns since they have same values
data <- data[, c('ozone', 'particullate_matter', 'carbon_monoxide', 'sulfure_dioxide', 'nitrogen_dioxide', 'timestamp')]

#univariate analysis of each variable

#Histplot
par(mfrow= c(3,2))
hist(data$ozone, breaks = 20, col = "skyblue", xlab = "ozone", ylab = "Frequency", main = "")
hist(data$particullate_matter, breaks = 20, col = "skyblue", xlab = "particullate_matter", ylab = "Frequency", main = "")
hist(data$carbon_monoxide, breaks = 20, col = "skyblue", xlab = "carbon_monoxide", ylab = "Frequency", main = "")
hist(data$sulfure_dioxide, breaks = 20, col = "skyblue", xlab = "sulfure_dioxide", ylab = "Frequency", main = "")
hist(data$nitrogen_dioxide, breaks = 20, col = "skyblue", xlab = "nitrogen_dioxide", ylab = "Frequency", main = "")

main_title <- "Histogram distribution of the variables"
mtext(main_title, side = -12, line = 33)

#Boxplot
par(mfrow= c(3,2))
boxplot(data$ozone, main='ozone', ylab = 'Values')
boxplot(data$particullate_matter, main='particullate matter', ylab = 'Values')
boxplot(data$carbon_monoxide, main='carbon monoxide', ylab = 'Values')
boxplot(data$sulfure_dioxide, main='sulfure dioxide', ylab = 'Values')
boxplot(data$nitrogen_dioxide, main='nitrogen dioxide', ylab = 'Values')

# Line plot of how the variables change over time
par(mfrow= c(3,2))
plot(data$timestamp, data$ozone, type = "l", xlab = "Time", ylab = "Ozone", main = "")
plot(data$timestamp, data$particullate_matter, type = "l", xlab = "Time", ylab = "PM", main = "")
plot(data$timestamp, data$carbon_monoxide, type = "l", xlab = "Time", ylab = "CM", main = "")
plot(data$timestamp, data$sulfure_dioxide, type = "l", xlab = "Time", ylab = "SM", main = "")
plot(data$timestamp, data$nitrogen_dioxide, type = "l", xlab = "Time", ylab = "ND", main = "")

# Scatter plot to show correlation between the variables
pairs(subset(data, select = -timestamp))