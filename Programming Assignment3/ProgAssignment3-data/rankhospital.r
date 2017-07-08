
  rankhospital<-function(state,outcome,num="best"){
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
      test<-datre[datre$state==c(state),]
      test[,outcome]<-as.numeric(test[,outcome])
      test<-test[order(test[,outcome],test$hospital,na.last = NA),]
      test$rank<-rank(test[,outcome],test$hospital,ties.method = "first")
      if(is.numeric(num))
      {
        if(length(test$hospital)<num)
          return(NA)
        else
        return(test$hospital[test$rank==num])
      }
      else
      {
        if(num=="best")
          return(test$hospital[[1]])
        else
          return(test$hospital[[length(test$hospital)]])
      }
    }
  }