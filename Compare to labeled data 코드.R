#Compare with 36%.csv


test1<-read.csv("C:/Users/kkh4y/Downloads/210124(10.79%).csv",header=T)
test2<-read.csv("C:/Users/kkh4y/Downloads/210124(36%)_final.csv",header=T)
test3<-read.csv("C:/Users/kkh4y/Downloads/210124(10.07%).csv",header=T)
test4<-read.csv("C:/Users/kkh4y/Downloads/210124(10.00%).csv",header=T)
testval<-read.csv("C:/Users/kkh4y/Downloads/valdiff (2).csv",header=T)
test5<-read.csv("C:/Users/kkh4y/Downloads/210124(8%).csv",header=T)

names(test1)

sum(test1$X1day_yn==1) #159
sum(test1$X2day_yn==1) #177
#340개 중 35개 맞춤 

sum(test2$X1day_yn==1) #426
sum(test2$X2day_yn==1) #426
#340개 중 310 개 맞춤

sum(test3$X1day_yn==1) #117
sum(test3$X2day_yn==1) #202
#340개 중 34개 맞춤 

sum(test4$X1day_yn==1) #165
sum(test4$X2day_yn==1) #353
#340개 중 34개 맞춤 

sum(test1$X1day_yn==test2$X1day_yn & test1$X1day_yn==1) #56
sum(test1$X2day_yn==test2$X2day_yn & test1$X2day_yn==1) #51

sum(test3$X1day_yn==test2$X1day_yn & test2$X1day_yn==1) #47
sum(test3$X2day_yn==test2$X2day_yn & test2$X2day_yn==1) #59

sum(test4$X1day_yn==test2$X1day_yn & test2$X1day_yn==1) #60
sum(test4$X2day_yn==test2$X2day_yn & test2$X2day_yn==1) #76

sum(test5$X1day_yn==test2$X1day_yn & test5$X1day_yn==1) #96
sum(test5$X2day_yn==test2$X2day_yn & test5$X2day_yn==1) #59

sum(test5$X1day_yn==1) #384
sum(test5$X2day_yn==1) #437

place<-which(testval$X1day_yn==1 | testval$X2day_yn==1)
test_final<-testval[place,]
names(test_final)
test_final$num<-1:510
write.csv(test_final,"C:/Users/kkh4y/Downloads/test_36%.csv")
table(test_final$sgg)
table(test_final$mode_PRRCK_LARG)
table(test_final$mode_PRRCK_MDDL)
plot(test_final$aws_sum_rn,type="l")
plot(test_final$aws_avg_rhm)
table(test_final$sd)
table(test_final[1:3,]$sd)
table(test_final[4:106,]$sd)
table(test_final[107:402,]$sd)
table(test_final[403:510,]$sd)
table(test_final$sd)
table(test_final$sgg)

#write.csv(test2,"C:/Users/kkh4y/Downloads/210124(36%)_final.csv")