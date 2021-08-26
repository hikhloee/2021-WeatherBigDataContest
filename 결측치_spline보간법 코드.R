setwd("C:/Users/LG/Desktop/황령산호랑이/")
data <- read.csv(file='C:/Users/LG/Desktop/황령산호랑이/data_final.csv', header = TRUE)
#install.packages('mice')
#mice::md.pattern
library(mice)
par("mar")
par(mar=c(2,2,2,2))
#md.pattern(data)

#install.packages('VIM')
library(VIM)
aggr(data)

#install.packages('imputeTS')
library(imputeTS)
data1<-na.interpolation(data, option = 'spline')

#library("openxlsx")
write.csv(data1, file="missingvalue.csv", row.names=FALSE)