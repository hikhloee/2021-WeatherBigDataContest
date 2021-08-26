data<-read.csv("C:/Users/GRADUATE/Desktop/data22.csv",header=T)

names(data)
#1일뒤, 2일뒤 diff변수들 생성 코드
diff(which(data$code == 3701111))

names(data)
data2<-data

attach(data)
diff1<-diff(aws_min_ps,637)
diff2<-diff(aws_sum_rn,637)
diff3<-diff(aws_sum_rn_dur,637)
diff4<-diff(aws_hr1_max_rn,637)
diff5<-diff(aws_avg_tca,637)
diff6<-diff(aws_avg_ps,637)
diff7<-diff(aws_max_ps,637)
diff8<-diff(aws_max_ins_ws,637)
diff9<-diff(aws_avg_rhm,637)
diff10<-diff(aws_min_rhm,637)
diff11<-diff(aws_avg_ws,637)
diff12<-diff(aws_max_ws,637)
diff13<-diff(aws_max_ins_ws,637)
diff14<-diff(asos_sum_rn,637)
diff15<-diff(asos_avg_rhm,637)
diff16<-diff(asos_avg_td,637)
diff17<-diff(asos_avg_ws,637)

diffset<-cbind(diff1,diff2,diff3,diff4,diff5,diff6,diff7,diff8,diff9,diff10,diff11,diff12,diff13,diff14,diff15,diff16,diff17)
head(diffset)
# 584085-637+1
584085+637
length(diff1)
sumset1<-diffset[583449:584085,]

diffset1_final<-rbind(diffset,sumset1)

attach(data)
diff21<-diff(aws_min_ps,1274)
diff22<-diff(aws_sum_rn,1274)
diff23<-diff(aws_sum_rn_dur,1274)
diff24<-diff(aws_hr1_max_rn,1274)
diff25<-diff(aws_avg_tca,1274)
diff26<-diff(aws_avg_ps,1274)
diff27<-diff(aws_max_ps,1274)
diff28<-diff(aws_max_ins_ws,1274)
diff29<-diff(aws_avg_rhm,1274)
diff210<-diff(aws_min_rhm,1274)
diff211<-diff(aws_avg_ws,1274)
diff212<-diff(aws_max_ws,1274)
diff213<-diff(aws_max_ins_ws,1274)
diff214<-diff(asos_sum_rn,1274)
diff215<-diff(asos_avg_rhm,1274)
diff216<-diff(asos_avg_td,1274)
diff217<-diff(asos_avg_ws,1274)

diffset2<-cbind(diff21,diff22,diff23,diff24,diff25,diff26,diff27,diff28,diff29,diff210,diff211,diff212,diff213,diff214,diff215,diff216,diff217)
length(diff217)-1274+1

sumset2<-diffset2[582175:583448,]
diffset2_final<-rbind(diffset2,sumset2)

finaldata<-cbind(dataasos,diffset1_final,diffset2_final,datasoil)
names(finaldata)
dataasos<-data[,1:25]
datasoil<-data[,26:40]


write.csv(finaldata,"C:/Users/GRADUATE/Desktop/data_with_diff.csv")
range(date)