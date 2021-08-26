#태풍변수
library(dplyr)
list<-read.csv("C:/Users/kkh4y/Desktop/태풍 변수/list_storm.csv",header=T)
data_diff<-read.csv("C:/Users/kkh4y/Desktop/태풍 변수/data_diff.csv",header=T)
val_diff<-read.csv("C:/Users/kkh4y/Desktop/태풍 변수/valdiff.csv",header=T)

list$difftime <- difftime(list$finish,list$start,units='days')
head(list)
list[116,8]<-7 #타파
list[117,8]<-7 #미탁 
names(list)[6]<-c("date")
place<-which(list[1:121,]$difftime>=7)
list2<-list[place,] #2011-2019년만 

list2<-list2[,c(3,6,7,8)]

data_diff<-left_join(data_diff,list2,by="date")
data_diff$stormfday<-ifelse(data_diff$difftime!="NA",1,0)
data_diff$stormfday[is.na(data_diff$stormfday)] <- 0

head(data_diff)

for(i in 2:583358){
  if(data_diff[i,82] == 1)
    data_diff[i-1,83] = 1
}

for(i in 3:583358){
  if(data_diff[i,82] == 1)
    data_diff[i-2,84] = 1
}

names(data_diff)[83]<-c("stormday1")
names(data_diff)[84]<-c("stormday2")
data_diff$stormday1[is.na(data_diff$stormday1)] <- 0
data_diff$stormday2[is.na(data_diff$stormday2)] <- 0

write.csv(data_diff,"C:/Users/kkh4y/Desktop/태풍 변수/datadiff.csv")

val_diff<-left_join(val_diff,list,by="date")
val_diff$stormfday<-ifelse(val_diff$difftime!="NA",1,0)
val_diff$stormfday[is.na(val_diff$stormfday)] <- 0

for(i in 2:3410){
  if(val_diff[i,87] == 1)
    val_diff[i-1,88] = 1
}

for(i in 3:3410){
  if(val_diff[i,87] == 1)
    val_diff[i-2,89] = 1
}

names(val_diff)[88]<-c("stormday1")
names(val_diff)[89]<-c("stormday2")
val_diff$stormday1[is.na(val_diff$stormday1)] <- 0
val_diff$stormday2[is.na(val_diff$stormday2)] <- 0

write.csv(val_diff,"C:/Users/kkh4y/Desktop/태풍 변수/valdiff.csv")
# head(data_diff)