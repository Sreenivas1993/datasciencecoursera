

library(data.table)

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # Format number with fixed width and then append .csv to number
  fileNames <- paste0(directory, '/', formatC(id, width=3, flag="0"), ".csv" )
  
  # Reading in all files and making a large data.table
  lst <- lapply(fileNames, data.table::fread)
  dt <- rbindlist(lst)
  
  if (c(pollutant) %in% names(dt)){
    return(dt[, lapply(.SD, mean, na.rm = TRUE),.SDcols = pollutant])
  } 
}

#................................................................................................#


complete<-function(directory,id = 1:332){
  
  fileNames<-paste0(directory,'/',formatC(id,width=3,flag="0"),".csv")
  lt<-lapply(fileNames,data.table::fread)
  df<-rbindlist(lt)
  return(df[complete.cases(df),.(nobs=.N),by=ID])
}

#..................................................................................................#

corr <- function(directory, threshold = 0) {
  
  # Reading in all files and making a large data.table
  lst <- lapply(file.path(directory, list.files(path = directory, pattern="*.csv")), data.table::fread)
  dt <- rbindlist(lst)
  
  # Only keep completely observed cases
  dt <- dt[complete.cases(dt),]
  
  # Apply threshold
 
  dt<-dt[,list(nos=.N,corr=cor(x = sulfate, y = nitrate)),by=ID]
  dt<-dt[,corr][dt$nos>threshold]
  return(dt)
}
                                             
  
  
  
  

