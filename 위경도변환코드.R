#install.packages("readxl")
#install.packages("dplyr")

library(dplyr)
library(readxl)
setwd("C:/Users/LG/Desktop/황령산호랑이/토양도/")
toyang=read_excel("토양도_48_경상남도.xlsx")
head(toyang)
str(toyang)
toyang$ARA_XCRD <- as.numeric(toyang$ARA_XCRD)
toyang$ARA_YCRD <- as.numeric(toyang$ARA_YCRD)
X <- select(toyang, ARA_XCRD)
Y <- select(toyang, ARA_YCRD)

convertCoordSystem <- function(long, lat, from.crs, to.crs){
  xy <- data.frame(long=long, lat=lat)
  coordinates(xy) <- ~long+lat
  
  from.crs <- CRS(from.crs)
  from.coordinates <- SpatialPoints(xy, proj4string=from.crs)
  
  to.crs <- CRS(to.crs)
  changed <- as.data.frame(SpatialPoints(spTransform(from.coordinates, to.crs)))
  names(changed) <- c("long", "lat")
  
  return(changed)
}

coord <- data.frame(utmk.long=X, utmk.lat=Y)
colnames(coord) <- c('utmk.long','utmk.lat')
head(coord)
typeof(coord$utmk.long)

#from.crs 분명하지 않음
from.crs = "+proj=tmerc +lat_0=38 +lon_0=127.0028902777778 +k=1 +x_0=200000 +y_0=500000 +ellps=bessel +units=m +no_defs +towgs84=-115.80,474.99,674.11,1.16,-2.31,-1.63,6.43"

to.crs = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"
coord <- cbind(convertCoordSystem(coord$utmk.long, coord$utmk.lat, from.crs, to.crs),coord)

#install.packages("openxlsx")
#library("openxlsx")
write.csv(coord, file="5174.csv", row.names=FALSE)