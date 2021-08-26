#토양도, 임상도 변수
library(ggplot2)
train_data<-read.csv("C:/Users/kkh4y/Desktop/황령산호랑이/data_diff_new_var.csv",header=T)
test_data<-read.csv("C:/Users/kkh4y/Desktop/황령산호랑이/valdiff.csv",header=T)

table(train_data$mode_PRRCK_LARG)
table(train_data$mode_PRRCK_MDDL)
summary(train_data$mean_ALTT)
summary(train_data$mean_GRDN)
table(train_data$mode_CLZN)
table(train_data$mode_TRGRP)
table(train_data$mode_SLDPT_TPCD) 
#토심구분코드 mode대신에 numeric으로 봐라 
table(train_data$mode_FRTP_CD)
table(train_data$mode_KOFTR_GROU)
table(train_data$mode_LDMARK_STN)
table(train_data$mode_MAPLABEL)
table(train_data$mode_MAP_LABEL)
# train_data<-train_data[,-c(81,82)]
train_data$rn_rndur<-train_data$aws_sum_rn * train_data$aws_sum_rn_dur

new<-read.csv("C:/Users/kkh4y/Desktop/황령산호랑이/new3.csv",header=T)
# total<-read.csv("C:/Users/kkh4y/Desktop/황령산호랑이/토양임상통합.csv",header=T)
new<-new[,-c(1:5,7)]

new$paste<-paste(new$시군구명칭,new$읍면동명칭)
train_data$paste<-paste(train_data$sgg,train_data$umd)

train_data$diff_MDDL<-merge(train_data,new,by="paste")
summary(train_data$diff_MDDL)

write.csv(train_data,"C:/Users/kkh4y/Desktop/황령산호랑이/train_data_with_newvar.csv")

head(train_data)
hae