
  rankall<-function(outcome,num="best"){
    dataset<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
    datre<-as.data.frame(cbind(dataset[,2],      #hospital
                               dataset[,7],      #state
                               dataset[,11],     #heart attack
                               dataset[,17],     #heart failure
                               dataset[,23]),    #pneumonia
                         stringsAsFactors = FALSE)    
    
    colnames(datre)<-c('hospital','state','heart attack','heart failure','pneumonia')
    if(!(c(outcome)%in%c("heart attack","heart failure","pneumonia")))
      stop("invalid outcome")
    else
    { datm<-datre[0,1:2]
      unistat<-unique(datre$state)
      unistat<-unistat[order(unistat)]
      for(state in unistat)
      {
        test<-datre[datre$state==c(state),]
        test[,outcome]<-as.numeric(test[,outcome])
        test<-test[order(test[,outcome],test$hospital),]
        test$rank<-1:nrow(test)
        
        if(is.numeric(num))
        {
          test1<-test[test$rank==num,]
          if(nrow(test1)==0)
          { 
           datm[nrow(datm)+1,]<-c(NA,state)
          }
          else
          {
            test1<-test1[,1:2]
            datm<-rbind(datm,test1)
            
            
          }
            
        }
        else
        {
          if(num=="best")
          {
            
            if(is.na(test[1,outcome]))
              datm[nrow(datm)+1,]<-c(NA,state)
            else{
              test1<-test[1,1:2]
              datm<-rbind(datm,test1) 
              }
          }
          else
          {  test<-test[!(is.na(test[,outcome])),]
             if(nrow(test)==0)
              datm[nrow(datm)+1,]<-c(NA,state)
            else{
              test1<-test[length(test$hospital),1:2]
              datm<-rbind(datm,test1) 
            }
          }
        }
      }
    }
    return(datm)
  }
        