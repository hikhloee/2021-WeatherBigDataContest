# test2020<-read.csv("C:/Users/GRADUATE/Desktop/val1__2020.csv",header=T)
test2020<-read.csv("C:/Users/kkh4y/Desktop/anomaly_detection/val1__mkset.csv",header=T)
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
  new<-rbind(new,test1[(i+1):(i+4),],test2[(i+3):(i+4),])}
####7-9월

write.csv(new,"C:/Users/kkh4y/Desktop/anomaly_detection/new_2020.csv")

# new<-as.numeric(unlist(new))

test_new1<-new[1:50,]
test_new2<-new[51:5126,]
write.csv(test_new1,"C:/Users/kkh4y/Desktop/anomaly_detection/test_new1.csv")
write.csv(test_new2,"C:/Users/kkh4y/Desktop/anomaly_detection/test_new2.csv")
test_new1<-read.csv("C:/Users/kkh4y/Desktop/anomaly_detection/test_new1.csv")
test_new2<-read.csv("C:/Users/kkh4y/Desktop/anomaly_detection/test_new2.csv")

test_new1<-test_new1[,2:18]
test_new2<-test_new2[,2:18]


# attach(test_new1)
# aws_sum_rn<-as.numeric(test_new1$aws_sum_rn)
# aws_sum_rn_dur<-as.numeric(test_new1$aws_sum_rn_dur)
# aws_hr1_max_rn<-as.numeric(test_new1$aws_hr1_max_rn)
# aws_avg_tca<-as.numeric(test_new1$aws_avg_tca)
# aws_avg_ps<-as.numeric(test_new1$aws_avg_ps)
# aws_max_ps<-as.numeric(test_new1$aws_max_ps)
# aws_min_ps<-as.numeric(test_new1$aws_min_ps)
# aws_avg_rhm<-as.numeric(test_new1$aws_avg_rhm)
# aws_min_rhm<-as.numeric(test_new1$aws_min_rhm)
# aws_avg_ws<-as.numeric(test_new1$aws_avg_ws)
# aws_max_ws<-as.numeric(test_new1$aws_max_ws)
# aws_max_ins_ws<-as.numeric(test_new1$aws_max_ins_ws)
# asos_sum_rn<-as.numeric(test_new1$asos_sum_rn)
# asos_avg_rhm<-as.numeric(test_new1$asos_avg_rhm)
# asos_avg_td<-as.numeric(test_new1$asos_avg_td)
# asos_avg_ws<-as.numeric(test_new1$asos_avg_ws)


attach(test_new2)
# 
# aws_sum_rn<-as.numeric(test_new2$aws_sum_rn)
# aws_sum_rn_dur<-as.numeric(test_new2$aws_sum_rn_dur)
# aws_hr1_max_rn<-as.numeric(test_new2$aws_hr1_max_rn)
# aws_avg_tca<-as.numeric(test_new2$aws_avg_tca)
# aws_avg_ps<-as.numeric(test_new2$aws_avg_ps)
# aws_max_ps<-as.numeric(test_new2$aws_max_ps)
# aws_min_ps<-as.numeric(test_new2$aws_min_ps)
# aws_avg_rhm<-as.numeric(test_new2$aws_avg_rhm)
# aws_min_rhm<-as.numeric(test_new2$aws_min_rhm)
# aws_avg_ws<-as.numeric(test_new2$aws_avg_ws)
# aws_max_ws<-as.numeric(test_new2$aws_max_ws)
# aws_max_ins_ws<-as.numeric(test_new2$aws_max_ins_ws)
# asos_sum_rn<-as.numeric(test_new2$asos_sum_rn)
# asos_avg_rhm<-as.numeric(test_new2$asos_avg_rhm)
# asos_avg_td<-as.numeric(test_new2$asos_avg_td)
# asos_avg_ws<-as.numeric(test_new2$asos_avg_ws)

row<-NA
test_new1dif<-rbind(row,test_new1)
test_new1dif<-test_new1dif[1:50,]
test_new1dif$aws_avg_ps-test_new1$aws_avg_ps

attach(test_new1)
diff1<-diff(aws_min_ps,1)
diff2<-diff(aws_sum_rn,1)
diff3<-diff(aws_sum_rn_dur,1)
diff4<-diff(aws_hr1_max_rn,1)
diff5<-diff(aws_avg_tca,1)
diff6<-diff(aws_avg_ps,1)
diff7<-diff(aws_max_ps,1)
diff8<-diff(aws_max_ins_ws,1)
diff9<-diff(aws_avg_rhm,1)
diff10<-diff(aws_min_rhm,1)
diff11<-diff(aws_avg_ws,1)
diff12<-diff(aws_max_ws,1)
diff13<-diff(aws_max_ins_ws,1)
diff14<-diff(asos_sum_rn,1)
diff15<-diff(asos_avg_rhm,1)
diff16<-diff(asos_avg_td,1)
diff17<-diff(asos_avg_ws,1)

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

#diff1 은 세개 지나고 두개씩 떼기
#diff2 도 세개 지나고 개씩 떼기 
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