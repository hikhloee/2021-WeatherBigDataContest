#new var 1-6
library(dplyr)

na_filled<-read.csv("C:/Users/JDH/Desktop/new_var/na_filled.csv",header=T)
names(na_filled)
head(na_filled)

table(na_filled$mode_SCSTX)

table(na_filled$mode_SLTP)


storage_capacity=NULL
for(i in 1:length(na_filled$mode_SCSTX)){
  
  na_filled$storage_capacity[i]<-if(na_filled$mode_SCSTX[i]==1){
    
    storage_capacity=0.25}else if(na_filled$mode_SCSTX[i]==2){
      
      storage_capacity=0.19}else if(na_filled$mode_SCSTX[i]==3){
        
        storage_capacity=0.17}else{
          
          storage_capacity=0.31 
          
        }
  
}   #유효저류능


min_infiltration=NULL
for(i in 1:length(na_filled$mode_SCSTX)){
  
  na_filled$min_infiltration[i]<-if(na_filled$mode_SCSTX[i]==1){
    
    min_infiltration=1.02}else if(na_filled$mode_SCSTX[i]==2){
      
      min_infiltration=0.52}else if(na_filled$mode_SCSTX[i]==3){
        
        min_infiltration=0.27}else{
          
          min_infiltration=2.41 
          
        }
  
}     #최소 침투율 


infiltration=NULL
for(i in 1:length(na_filled$mode_SCSTX)){
  
  na_filled$infiltration[i]<-if(na_filled$mode_SCSTX[i]==1){
    
    infiltration=(3.81+7.62)/2}else if(na_filled$mode_SCSTX[i]==2){
      
      infiltration=(3.81+7.62)/2}else if(na_filled$mode_SCSTX[i]==3){
        
        infiltration=(1.27+3.81)/2}else{
          
          infiltration=(7.62+11.43)/2 
          
        }
  
}     #침투율


porosity=NULL
for(i in 1:length(na_filled$mode_SCSTX)){
  
  na_filled$porosity[i]<-if(na_filled$mode_SCSTX[i]==1){
    
    porosity=0.412}else if(na_filled$mode_SCSTX[i]==2){
      
      porosity=0.434}else if(na_filled$mode_SCSTX[i]==3){
        
        porosity=0.486}else{
          
          porosity=0.401 
          
        }
  
}     #유효 공극률 


NRCS=NULL 
for(i in 1:length(na_filled$mode_SCSTX)){
  
  na_filled$porosity[i]<-if(na_filled$mode_SCSTX[i]==1){
    
    NRCS="B"}else if(na_filled$mode_SCSTX[i]==2){
      
      NRCS="B"}else if(na_filled$mode_SCSTX[i]==3){
        
        NRCS="C"}else{
          
          NRCS="A" 
          
        }
  
}     #NRCS 분류

soil_group = NULL
for(i in 1:length(na_filled$mode_SLTP)){
  na_filled$soil_group[i]<-if(na_filled$mode_SLTP[i]<=6){
    soil_group="B"}else if(na_filled$mode_SLTP[i]>6 & na_filled$mode_SLTP[i]<=9){
      soil_group="R_Y"}else if(na_filled$mode_SLTP[i]>9 & na_filled$mode_SLTP[i]<=14){
        soil_group="DR"}else if(na_filled$mode_SLTP[i]>14 & na_filled$mode_SLTP[i]<=16){
          soil_group="GrB"}else if(na_filled$mode_SLTP[i]>16 & na_filled$mode_SLTP[i]<=23){
            soil_group="Va"}else if(na_filled$mode_SLTP[i]>23 & na_filled$mode_SLTP[i]<=26){
              soil_group="Er"}else if(na_filled$mode_SLTP[i]==27){
                soil_group="Im"}else{
                  soil_group="etc"}
} #8개의 토양군 

write.csv(na_filled,"C:/Users/JDH/Desktop/new_var/na_filled_aftprocessing.csv")