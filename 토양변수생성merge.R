library(dplyr)
data0720<-read.csv("C:/Users/JDH/Desktop/new_var/data_diff_storm.csv",header=T)
val0720<-read.csv("C:/Users/JDH/Desktop/new_var/valdiff_storm.csv",header=T)

#토양도 변수 생성한것 merge
filled<-read.csv("C:/Users/JDH/Desktop/new_var/na_filled_aftprocessing.csv",header=T)

fill1<-filled[,c(6,24:37)]
head(fill1)
data0720_1<-left_join(data0720,fill1,by="code")
#head(data0720_1)

#하경변수 1: rnrndur
#하경변수 2: soil_moisture
data0720_1<-data0720_1 %>% mutate(rn_rn_dur = aws_sum_rn*aws_sum_rn_dur, soil_moisture = aws_sum_rn*mode_SLDPT_TPCD/mean_GRDN)
names(data0720_1)

write.csv(data0720_1,"C:/Users/JDH/Desktop/new_var/data0720.csv")

head(val0720)

val0720<-val0720 %>% mutate(rn_rn_dur = aws_sum_rn*aws_sum_rn_dur, soil_moisture = aws_sum_rn*mode_SLDPT_TPCD/mean_GRDN)
names(val0720)
write.csv(val0720,"C:/Users/JDH/Desktop/new_var/val0720.csv")