#경북47_1 case 

library(dplyr)

data<-read.csv("C:/Users/kkh4y/Downloads/경북47_1.csv",header=T)
#head(data)
#names(data)

Select_variables<-c(6,7,12:25)

subdata<-data[Select_variables] #필요한 변수 추린 subset 데이터
#head(subdata)

uniq<-unique(subdata[,1])
length(uniq) #unique 읍,면,동 갯수

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

#names(subdata)

final_Summary<-(subdata %>%
                  group_by(EMD_ENG_NM)%>%
                  summarize(count=n(),
                            mode_PRRCK_LARG=getmode(PRRCK_LARG),
                            mode_PRRCK_MDDL=getmode(PRRCK_MDDL),
                            mean_ALTT=mean(LOCTN_ALTT),
                            mean_GRDN=mean(LOCTN_GRDN),
                            mean_EIGHT=mean(EIGHT_AGL),
                            mode_CLZN=getmode(CLZN_CD),
                            mode_TRGRP=getmode(TPGRP_TPCD),
                            mode_PRDN=getmode(PRDN_FOM_C),
                            mode_SLANT=getmode(SLANT_TYP),
                            mode_MAPLABEL=getmode(MAP_LABEL)
                  ))

#### 
# 모암대코드, 모암중코드, 기후대코드, 지형구분코드, 사면형태코드, 경사형코드, 맵라벨코드: mode로 대체
# 입지표고, 8방위각도, 입지경사도 : mean로 대체
# 지형구분(TRGRP_TPCD), 사면형태(PRDN_FOM_CD), 경사형(SLANT_TYP_CD)는 NA 좀 있음
# 나중에 처리할것 
####

head(final_Summary)

write.csv(final_Summary,"C:/Users/kkh4y/Downloads/summary_gb1.csv")