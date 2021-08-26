
#2020 true value mkset 

data<-read.csv("C:/Users/kkh4y/Desktop/황령산호랑이/통합 문서2.csv",header=T)
data<-data[1:3410,]
sum(data$X1day_yn)
sum(data$X2day_yn)
datamk<-data
datex10807<-which(datamk$X1day=="2020-08-07")
datex10808<-which(datamk$X1day=="2020-08-08")
datex20807<-which(datamk$X2day=="2020-08-07")
datex20808<-which(datamk$X2day=="2020-08-08")
datamk$X1day_yn[datex10807,]<-0

datamk[datex10807,]$X1day_yn<-0
datamk[datex10808,]$X1day_yn<-0
datamk[datex20807,]$X2day_yn<-0
datamk[datex20808,]$X2day_yn<-0

sum(datamk$X1day=="2020-08-07")
datamk[datex10807,]
write.csv(datamk,"C:/Users/kkh4y/Desktop/황령산호랑이/datamk.csv")