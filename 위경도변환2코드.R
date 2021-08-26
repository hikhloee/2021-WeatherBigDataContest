########Convert (x,y) to (lat, long) by R #########

#install.packages("rgdal")
#install.packages("sp")

#library(rgdal)
#library(sp)

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
coord <- data.frame(utmk.long=c(323465.95), utmk.lat=c(248437.1))
from.crs = "+proj=tmerc +lat_0=38 +lon_0=127.3 +k=0.9996 +x_1000000 +y_0=2000000 +ellps=GRS80 +datum=WGS84 +units=m +no_defs"
#utmk.long, utmk.lat 변경하면 됨

to.crs = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"
coord <- cbind(coord, convertCoordSystem(coord$utmk.long, coord$utmk.lat, from.crs, to.crs))

for(i in 1:nrow(coord)){
  p <- coord[i,]
  str <- paste("(", p$utmk.long, ",", p$utmk.lat, ") -> (", p$long, ",", p$lat, ")", sep="")
  print(str, quote=FALSE)
}

#long: 경도, lat:위도, x:경도, y:위도 (확실하진 않음)