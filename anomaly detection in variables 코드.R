#anomaly_산사태

#library(PMCMRplus)
#library(dplyr)
#require(plyr)

attach(data)
data<-read.csv("C:/Users/kkh4y/Desktop/anomaly_detection/data3 (1).csv",header=T)
names(data)

an_aws_sum_rn<-as.vector(data[,11])
uan_aws_sum_rn<-unique(an_aws_sum_rn)
out1<-gesdTest(uan_aws_sum_rn,100)

an_aws_sum_rn_dur<-as.vector(data[,12])
uan_aws_sum_rn_dur<-unique(an_aws_sum_rn_dur)
out2<-gesdTest(uan_aws_sum_rn_dur,5)

an_hr1_max_rn<-as.vector(data[,13])
uan_aws_sum_rn_dur<-unique(an_hr1_max_rn)
out3<-gesdTest(uan_aws_sum_rn_dur,100)

an_aws_avg_tca<-as.vector(data[,14])
uan_aws_avg_tca<-unique(an_aws_avg_tca)
out4<-gesdTest(uan_aws_avg_tca,100)

an_aws_avg_ps<-as.vector(data[,15])
uan_aws_avg_ps<-unique(an_aws_avg_ps)
out5<-gesdTest(uan_aws_avg_ps,100)

an_aws_max_ps<-as.vector(data[,16])
uan_aws_max_ps<-unique(an_aws_max_ps)
out6<-gesdTest(uan_aws_max_ps,100)

an_aws_avg_rhm<-as.vector(data[,18])
uan_aws_avg_rhm<-unique(an_aws_avg_rhm)
out7<-gesdTest(uan_aws_avg_rhm,100)

an_aws_avg_ws<-as.vector(data[,20])
uan_aws_avg_ps<-unique(an_aws_avg_ps)
out8<-gesdTest(uan_aws_avg_ps,50)

an_aws_max_ws<-as.vector(data[,21])
uan_aws_max_ws<-unique(an_aws_max_ws)
out9<-gesdTest(uan_aws_max_ws,100)

an_asos_sum_rn<-as.vector(data[,23])
uan_asos_sum_rn<-unique(an_asos_sum_rn)
out10<-gesdTest(uan_asos_sum_rn,100)

an_asos_avg_rhm<-as.vector(data[,24])
uan_asos_avg_rhm<-unique(an_asos_avg_rhm)
out11<-gesdTest(uan_asos_avg_rhm,100)

an_asos_avg_td<-as.vector(data[,25])
uan_asos_avg_td<-unique(an_asos_avg_td)
out12<-gesdTest(uan_asos_avg_td,100)

an_asos_avg_ws<-as.vector(data[,26])
uan_asos_avg_ws<-unique(an_asos_avg_ws)
out13<-gesdTest(uan_asos_avg_ws,100)

uan1<-out1$ix
uan2<-out2$ix
uan3<-out3$ix
uan4<-out4$ix
uan5<-out5$ix
uan6<-out6$ix
uan7<-out7$ix
uan8<-out8$ix
uan9<-out9$ix
uan10<-out10$ix
uan11<-out11$ix
uan12<-out12$ix
uan13<-out13$ix

d1<-data[,11][uan1]
d2<-data[,12][uan2]
d3<-data[,13][uan3]
d4<-data[,14][uan4]
d5<-data[,15][uan5]
d6<-data[,16][uan6]
d7<-data[,18][uan7]
d8<-data[,20][uan8]
d9<-data[,21][uan9]
d10<-data[,23][uan10]
d11<-data[,24][uan11]
d12<-data[,25][uan12]
d13<-data[,26][uan13]

dataset3<-data

dataset3<-merge(dataset3,uan1,by="aws_sum_rn",all=T)
class(dataset3)

datasett<-join(dataset3,uan1,type="left")
datasett[is.na(datasett)] <- 0
write.csv(datasett,"C:/Users/kkh4y/Desktop/anomaly_detection/datasett.csv")
names(datasett)
summary(datasett$newvar1)

data_x <- data %>% filter(hr1_max_rn == '')
desired_data <- bind_rows(data,data_x)

uan1