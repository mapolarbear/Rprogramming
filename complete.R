complete <- function(directory, id=1:322) {
  ## initialize obs_cnt to zero
  obs_cnt <- numeric(0)
  
  for (i in id) {
    temp_ds <- read.csv(paste(directory,"/",sprintf("%03d",as.numeric(i)),".csv",sep="")
                        ,header=T,sep=",")
    
    ## concatinate complete cases to obs_cnt
    obs_cnt <- c(obs_cnt, nrow(na.omit(temp_ds)))
  }
  
  ## create data frame
  complete_ds <- data.frame(id=id, nobs=obs_cnt)
  complete_ds
  
  ##return(complete_ds)
}