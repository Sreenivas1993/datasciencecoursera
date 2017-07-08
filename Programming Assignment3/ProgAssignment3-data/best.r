
best<-function(state,outcome){
 #check state and outcome are valid
  dataset<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
  datre<-as.data.frame(cbind(dataset[,2],      #hospital
                             dataset[,7],      #state
                             dataset[,11],     #heart attack
                             dataset[,17],     #heart failure
                             dataset[,23]),    #pneumonia
                             stringsAsFactors = FALSE)    
  
  colnames(datre)<-c('hospital','state','heart attack','heart failure','pneumonia')
  if(!(c(state)%in%datre$state))
    stop("invalid state")
  else if(!(c(outcome)%in%c("heart attack","heart failure","pneumonia")))
    stop("invalid outcome")
  else{
  #Return hospital name in state with lowest 30 day death
  #test<-datre[datre$state==c(state),]
    test<-datre[datre$state==c(state),]
    val<-as.numeric(test[,outcome])
    minval<-min(val,na.rm = TRUE)
    hosp<-test$hospital[as.numeric(test[,outcome])==minval]
    #hosp<-order(hosp)
    hosp<-hosp[order(hosp)]
    return(hosp[[1]])
    
     
  }
  
}
  
      
      
      
      
      
      
      
      
      
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
      
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  
  
  

