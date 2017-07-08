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
