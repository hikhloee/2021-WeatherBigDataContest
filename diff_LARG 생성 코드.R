#rm(list=ls())
#NewVariable 토양도 
################# Library ##################
library(dplyr)
library(dlookr)
library(ggplot2)
library(googleVis)
library(ggmap)
library(ggplot2)
library(raster)
library(rgeos)
library(maptools)
library(rgdal)
library(patchwork)
library(viridis)

theme_set(theme_bw())

################ function ##################
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

group_mk<- function(data,group_loc,id){
  data %>%
    group_by(group_loc) %>%
    summarise(parameter = getmode(id),
              cumcount = mean(data[3,]))
}

################  base  ###################
data<-read.csv("C:/Users/kkh4y/Desktop/EDA/토양도.csv");names(data)[4]<-c("sgg")
record<-read.csv("C:/Users/kkh4y/Desktop/EDA/산사태 발생이력.csv")

# Merged dataset 1 
record_umd<- record %>%
  group_by(umd) %>%
  summarise(
    Province = getmode(sd),
    cumcount = sum(sum_cnt))

data_umd<- data %>%
  group_by(읍면동명칭) %>%
  summarise(code_city = getmode(시군구코드),
            city_name = getmode(sgg),
            PRACK_LARG = getmode(mode_PRRCK_LARG),
            PRACK_MDDL = getmode(mode_PRRCK_MDDL),
            ALTT = mean(mean_ALTT),
            GRDN = mean(mean_GRDN),
            EIGHT = mean(mean_EIGHT),
            TRGRP = getmode(mode_TRGRP),
            PRDN = getmode(mode_PRDN),
            SLANT = getmode(mode_SLANT),
            MAPLABEL = getmode(mode_MAPLABEL))

names(data_umd)[1]<-c("umd")

mergedata<-merge(record_umd,data_umd,by="umd") #시별 관찰

############### new Variable ###############
#install.packages("geosphere")
library(geosphere)
longlat<-read.csv("C:/Users/kkh4y/Desktop/EDA/토양도.csv",header=T)
summary(longlat)
AWSS<-read.csv("C:/Users/kkh4y/Desktop/EDA/AWS_위경도포함.csv",header=T)
merged<-merge(longlat,AWSS,by=c("시군구명칭","읍면동명칭"))
names(merged)[18]<-c("lat")
names(merged)[19]<-c("long")

#merged$dist
a<-NULL
for(i in 1:637){
  a[i]<-distGeo(c(merged$long[i],merged$lat[i]),c(merged$long[i+1],merged$lat[i+1]))
  #distGeo :meter 단위
  #0값인건 장유1동, 장유2동 이런거임 
}
a[637]<-0
merged$dist<-a

merged[,"dist_btw"] = distGeo(merged[,c("long","lat")])

b<-NULL
for(i in 2:637){
  b[i]<-max(abs(merged$mode_PRRCK_LARG[i]-merged$mode_PRRCK_LARG[i+1]),
            abs(merged$mode_PRRCK_LARG[i-1]-merged$mode_PRRCK_LARG[i]))
}
b[1]=0;b[637]=0;b

merged$newvariable<-b
for(i in 1:637){if(merged$dist[i]>10000){merged$newvariable[i]=0}}

write.csv(merged,"C:/Users/kkh4y/Desktop/EDA/new.csv")

#https://mrkevinna.github.io/R-%EC%8B%9C%EA%B0%81%ED%99%94-3/

###########
devtools::install_github('dkahle/ggmap')
library(ggmap)

#register_google(key='AIzaSyANFZIeAWcH5GUy4sb-d2O-qPPfzkY2j1I')
#mykey = "AIzaSyANFZIeAWcH5GUy4sb-d2O-qPPfzkY2j1I"

# cent = centroid(merged[,c("long","lat")])
# cent

# map_soil = get_googlemap(center = as.numeric(cent),
#                          maptype="roadmap",
#                          zoom =12,
#                          scale = 2) #차후에 할 것 