test2020<-read.csv("C:/Users/GRADUATE/Desktop/val1__2020.csv",header=T)
names(test2020)

test1<-test2020[,11:26]
test2<-test2020[,45:60]
test3<-test2020[33:3410,45:60]
colnames(test2)<-c("aws_sum_rn",     "aws_sum_rn_dur", "aws_hr1_max_rn", "aws_avg_tca",   
                   "aws_avg_ps", "aws_max_ps",     "aws_min_ps",     "aws_avg_rhm",   
                   "aws_min_rhm",    "aws_avg_ws"  ,   "aws_max_ws",     "aws_max_ins_ws",
                   "asos_sum_rn",    "asos_avg_rhm",   "asos_avg_td",    "asos_avg_ws" )
colnames(test3)<-c("aws_sum_rn",     "aws_sum_rn_dur", "aws_hr1_max_rn", "aws_avg_tca",   
                   "aws_avg_ps", "aws_max_ps",     "aws_min_ps",     "aws_avg_rhm",   
                   "aws_min_rhm",    "aws_avg_ws"  ,   "aws_max_ws",     "aws_max_ins_ws",
                   "asos_sum_rn",    "asos_avg_rhm",   "asos_avg_td",    "asos_avg_ws" )

new<-NULL
for(i in seq(1,30,3)){
  new<-rbind(new,test1[i:(i+2),],test2[(i+1):(i+2),])}
####6월

for(i in seq(30,3410,4)){
  new<-rbind(new,test1[i:(i+3),],test2[(i+3):(i+4),])}
####7-9월

write.csv(new,"C:/Users/GRADUATE/Desktop/new_2020.csv")


library(dplyr)
library(tibble)

test<-read.csv("C:/Users/GRADUATE/Desktop/val1__.csv",header=T)
aws<-read.csv("C:/Users/GRADUATE/Desktop/aws_final_2020.csv",header=T)
asos<-read.csv("C:/Users/GRADUATE/Desktop/asos_final_2020.csv",header=T)
aws_match<-read.csv("C:/Users/GRADUATE/Desktop/AWS_Num.csv",header=T)
asos_match<-read.csv("C:/Users/GRADUATE/Desktop/asosmatching.csv",header=T)

names(aws_match)[1]<-c("sgg")
names(aws_match)[3]<-c("stn_id")
#aws_match<-aws_match[,-c(2)]

date1<-c("2020-6-13","2020-07-14","2020-07-25","2020-08-10","2020-09-07")
date2<-c("2020-6-14","2020-07-15","2020-07-26","2020-08-11","2020-09-08")


##################  AWS   ######################
aws_6_13<-which(aws$tma== "2020-06-13")
aws_7_14<-which(aws$tma == "2020-07-14")
aws_7_25<-which(aws$tma == "2020-07-25")
aws_08_10<-which(aws$tma == "2020-08-10")
aws_09_07<-which(aws$tma == "2020-09-07")

aws_6_14<-which(aws$tma== "2020-06-14")
aws_7_15<-which(aws$tma == "2020-07-15")
aws_7_26<-which(aws$tma == "2020-07-26")
aws_08_11<-which(aws$tma == "2020-08-11")
aws_09_08<-which(aws$tma == "2020-09-08")

select_aws<-c(aws_6_13,aws_6_14,aws_7_14,aws_7_15,aws_7_25,aws_7_26,aws_08_10,aws_08_11,aws_09_07,aws_09_08)
select_aws
aws_last<-aws[select_aws,]

# aws_match<-unique(aws_match)
merge_aws_last<-left_join(aws_last,aws_match,by="stn_id")


################ ASOS ##################

asos_6_13<-which(asos$tma== "2020-06-13")
asos_7_14<-which(asos$tma == "2020-07-14")
asos_7_25<-which(asos$tma == "2020-07-25")
asos_08_10<-which(asos$tma == "2020-08-10")
asos_09_07<-which(asos$tma == "2020-09-07")

asos_6_14<-which(asos$tma== "2020-06-14")
asos_7_15<-which(asos$tma == "2020-07-15")
asos_7_26<-which(asos$tma == "2020-07-26")
asos_08_11<-which(asos$tma == "2020-08-11")
asos_09_08<-which(asos$tma == "2020-09-08")

select_asos<-c(asos_6_13,asos_6_14,asos_7_14,asos_7_15,asos_7_25,asos_7_26,asos_08_10,asos_08_11,asos_09_07,asos_09_08)
select_asos
asos_last<-asos[select_asos,]

asos_match<-unique(asos_match[,-c(1,2)])
names(asos_match)[1]=c("stn_id")
names(asos_match)[2]=c("sgg")
merge_asos_last<-left_join(asos_last,asos_match,by="stn_id")

names(merge_asos_last)[3:6]<-c("asos_sum_rn","asos_sum_rhm","asos_avg_td","asos_avg_ws")

write.csv(merge_aws_last,"C:/Users/GRADUATE/Desktop/aws_matching_needed.csv")
write.csv(merge_asos_last,"C:/Users/GRADUATE/Desktop/asos_matching_needed.csv")

########### SET 정리 ############
head(test)

df[nrow(df)+1,] <- NA
for(i in seq(1,3410,)){
  test[i+3,]<-NA
}
name0612<-test[which(test$date=="2020-06-12"),3] #6/12의 sgg이름 
aws0612<-merge_aws_last[1:46,]
asos0612<-merge_asos_last[1:36,]
merge_aws_last[]
for(i in 1:length(name0612)){
  print(which(aws0612$sgg==name0612[i]))
}

for(i in 1:length(name0612)){
  print(which(asos0612$sgg==name0612[i]))
}

head(tes)

test2020<-read.csv("C:/Users/GRADUATE/Desktop/val1__2020.csv",header=T)
names(test2020)

test1<-test2020[,c(1,11:26)]
test2<-test2020[,c(1,45:60)]
test3<-test2020[33:3410,45:60]
colnames(test1)<-c("date","aws_sum_rn",     "aws_sum_rn_dur", "aws_hr1_max_rn", "aws_avg_tca",   
                   "aws_avg_ps", "aws_max_ps",     "aws_min_ps",     "aws_avg_rhm",   
                   "aws_min_rhm",    "aws_avg_ws"  ,   "aws_max_ws",     "aws_max_ins_ws",
                   "asos_sum_rn",    "asos_avg_rhm",   "asos_avg_td",    "asos_avg_ws" )
colnames(test2)<-c("date","aws_sum_rn",     "aws_sum_rn_dur", "aws_hr1_max_rn", "aws_avg_tca",   
                   "aws_avg_ps", "aws_max_ps",     "aws_min_ps",     "aws_avg_rhm",   
                   "aws_min_rhm",    "aws_avg_ws"  ,   "aws_max_ws",     "aws_max_ins_ws",
                   "asos_sum_rn",    "asos_avg_rhm",   "asos_avg_td",    "asos_avg_ws" )
colnames(test3)<-c("aws_sum_rn",     "aws_sum_rn_dur", "aws_hr1_max_rn", "aws_avg_tca",   
                   "aws_avg_ps", "aws_max_ps",     "aws_min_ps",     "aws_avg_rhm",   
                   "aws_min_rhm",    "aws_avg_ws"  ,   "aws_max_ws",     "aws_max_ins_ws",
                   "asos_sum_rn",    "asos_avg_rhm",   "asos_avg_td",    "asos_avg_ws" )

new<-NULL
for(i in seq(1,30,3)){
  new<-rbind(new,test1[i:(i+2),],test2[(i+1):(i+2),])}
####6월

for(i in seq(30,3410,4)){
  new<-rbind(new,test1[i:(i+3),],test2[(i+3):(i+4),])}
####7-9월

write.csv(new,"C:/Users/GRADUATE/Desktop/new_2020.csv")

# new<-as.numeric(unlist(new))

test_new1<-new[1:50,]
test_new2<-new[51:5126,]
write.csv(test_new1,"C:/Users/GRADUATE/Desktop/test_new1.csv")
write.csv(test_new2,"C:/Users/GRADUATE/Desktop/test_new2.csv")

test_new2<-test_new2[1:5071,]

attach(test_new1)
aws_sum_rn<-as.numeric(test_new1$aws_sum_rn)
aws_sum_rn_dur<-as.numeric(test_new1$aws_sum_rn_dur)
aws_hr1_max_rn<-as.numeric(test_new1$aws_hr1_max_rn)
aws_avg_tca<-as.numeric(test_new1$aws_avg_tca)
aws_avg_ps<-as.numeric(test_new1$aws_avg_ps)
aws_max_ps<-as.numeric(test_new1$aws_max_ps)
aws_min_ps<-as.numeric(test_new1$aws_min_ps)
aws_avg_rhm<-as.numeric(test_new1$aws_avg_rhm)
aws_min_rhm<-as.numeric(test_new1$aws_min_rhm)
aws_avg_ws<-as.numeric(test_new1$aws_avg_ws)
aws_max_ws<-as.numeric(test_new1$aws_max_ws)
aws_max_ins_ws<-as.numeric(test_new1$aws_max_ins_ws)
asos_sum_rn<-as.numeric(test_new1$asos_sum_rn)
asos_avg_rhm<-as.numeric(test_new1$asos_avg_rhm)
asos_avg_td<-as.numeric(test_new1$asos_avg_td)
asos_avg_ws<-as.numeric(test_new1$asos_avg_ws)


attach(test_new2)

aws_sum_rn<-as.numeric(test_new2$aws_sum_rn)
aws_sum_rn_dur<-as.numeric(test_new2$aws_sum_rn_dur)
aws_hr1_max_rn<-as.numeric(test_new2$aws_hr1_max_rn)
aws_avg_tca<-as.numeric(test_new2$aws_avg_tca)
aws_avg_ps<-as.numeric(test_new2$aws_avg_ps)
aws_max_ps<-as.numeric(test_new2$aws_max_ps)
aws_min_ps<-as.numeric(test_new2$aws_min_ps)
aws_avg_rhm<-as.numeric(test_new2$aws_avg_rhm)
aws_min_rhm<-as.numeric(test_new2$aws_min_rhm)
aws_avg_ws<-as.numeric(test_new2$aws_avg_ws)
aws_max_ws<-as.numeric(test_new2$aws_max_ws)
aws_max_ins_ws<-as.numeric(test_new2$aws_max_ins_ws)
asos_sum_rn<-as.numeric(test_new2$asos_sum_rn)
asos_avg_rhm<-as.numeric(test_new2$asos_avg_rhm)
asos_avg_td<-as.numeric(test_new2$asos_avg_td)
asos_avg_ws<-as.numeric(test_new2$asos_avg_ws)


diff1<-diff(aws_min_ps,3)
diff2<-diff(aws_sum_rn,3)
diff3<-diff(aws_sum_rn_dur,3)
diff4<-diff(aws_hr1_max_rn,3)
diff5<-diff(aws_avg_tca,3)
diff6<-diff(aws_avg_ps,3)
diff7<-diff(aws_max_ps,3)
diff8<-diff(aws_max_ins_ws,3)
diff9<-diff(aws_avg_rhm,3)
diff10<-diff(aws_min_rhm,3)
diff11<-diff(aws_avg_ws,3)
diff12<-diff(aws_max_ws,3)
diff13<-diff(aws_max_ins_ws,3)
diff14<-diff(asos_sum_rn,3)
diff15<-diff(asos_avg_rhm,3)
diff16<-diff(asos_avg_td,3)
diff17<-diff(asos_avg_ws,3)

diff21<-diff(aws_min_ps,4)
diff22<-diff(aws_sum_rn,4)
diff23<-diff(aws_sum_rn_dur,4)
diff24<-diff(aws_hr1_max_rn,4)
diff25<-diff(aws_avg_tca,4)
diff26<-diff(aws_avg_ps,4)
diff27<-diff(aws_max_ps,4)
diff28<-diff(aws_max_ins_ws,4)
diff29<-diff(aws_avg_rhm,4)
diff210<-diff(aws_min_rhm,4)
diff211<-diff(aws_avg_ws,4)
diff212<-diff(aws_max_ws,4)
diff213<-diff(aws_max_ins_ws,4)
diff214<-diff(asos_sum_rn,4)
diff215<-diff(asos_avg_rhm,4)
diff216<-diff(asos_avg_td,4)
diff217<-diff(asos_avg_ws,4)

diffset<-cbind(diff1,diff2,diff3,diff4,diff5,diff6,diff7,diff8,diff9,diff10,diff11,diff12,diff13,diff14,diff15,diff16,diff17)
head(diffset)
# 584085-637+1
584085+637
length(diff1)
sumset1<-diffset[45:47,]

diffset1_final<-rbind(diffset,sumset1)


diffset2<-cbind(diff21,diff22,diff23,diff24,diff25,diff26,diff27,diff28,diff29,diff210,diff211,diff212,diff213,diff214,diff215,diff216,diff217)
length(diff217)

sumset2<-diffset2[43:46,]
diffset2_final<-rbind(diffset2,sumset2)


rb1<-rbind(diffset1_final,diffset1_final_pt2)
rb2<-rbind(diffset2_final,diffset2_final_pt2)
cb1<-cbind(rb1,rb2)
write.csv()

finaldata<-cbind(dataasos,diffset1_final,diffset2_final,datasoil)
names(finaldata)
dataasos<-data[,1:25]
datasoil<-data[,26:40]


write.csv(cb1,"C:/Users/GRADUATE/Desktop/data_cb1.csv")


diff1<-diff(aws_min_ps,4)
diff2<-diff(aws_sum_rn,4)
diff3<-diff(aws_sum_rn_dur,4)
diff4<-diff(aws_hr1_max_rn,4)
diff5<-diff(aws_avg_tca,4)
diff6<-diff(aws_avg_ps,4)
diff7<-diff(aws_max_ps,4)
diff8<-diff(aws_max_ins_ws,4)
diff9<-diff(aws_avg_rhm,4)
diff10<-diff(aws_min_rhm,4)
diff11<-diff(aws_avg_ws,4)
diff12<-diff(aws_max_ws,4)
diff13<-diff(aws_max_ins_ws,4)
diff14<-diff(asos_sum_rn,4)
diff15<-diff(asos_avg_rhm,4)
diff16<-diff(asos_avg_td,4)
diff17<-diff(asos_avg_ws,4)

diff21<-diff(aws_min_ps,5)
diff22<-diff(aws_sum_rn,5)
diff23<-diff(aws_sum_rn_dur,5)
diff24<-diff(aws_hr1_max_rn,5)
diff25<-diff(aws_avg_tca,5)
diff26<-diff(aws_avg_ps,5)
diff27<-diff(aws_max_ps,5)
diff28<-diff(aws_max_ins_ws,5)
diff29<-diff(aws_avg_rhm,5)
diff210<-diff(aws_min_rhm,5)
diff211<-diff(aws_avg_ws,5)
diff212<-diff(aws_max_ws,5)
diff213<-diff(aws_max_ins_ws,5)
diff214<-diff(asos_sum_rn,5)
diff215<-diff(asos_avg_rhm,5)
diff216<-diff(asos_avg_td,5)
diff217<-diff(asos_avg_ws,5)


diffset_pt2<-cbind(diff1,diff2,diff3,diff4,diff5,diff6,diff7,diff8,diff9,diff10,diff11,diff12,diff13,diff14,diff15,diff16,diff17)
head(diffset)
# 584085-637+1
584085+637
length(diff1)
sumset1_pt2<-diffset_pt2[5064:5067,]

diffset1_final_pt2<-rbind(diffset_pt2,sumset1_pt2)


diffset2_pt2<-cbind(diff21,diff22,diff23,diff24,diff25,diff26,diff27,diff28,diff29,diff210,diff211,diff212,diff213,diff214,diff215,diff216,diff217)
length(diff217)

sumset2_pt2<-diffset_pt2[5062:5066,]

diffset2_final_pt2<-rbind(diffset2_pt2,sumset2_pt2)



finalnew<-cbind(diffset2_final,diffset2_final_pt2)
