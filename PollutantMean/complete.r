complete<-function(directory,id = 1:332){
  
  fileNames<-paste0(directory,'/',formatC(id,width=3,flag="0"),".csv")
  lt<-lapply(fileNames,data.table::fread)
  df<-rbindlist(lt)
  return(df[complete.cases(df),.(nobs=.N),by=ID])
}

