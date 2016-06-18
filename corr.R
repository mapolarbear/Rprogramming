corr <- function(directory, threshold=0) {
  
  obs_cnt <- numeric(0)
  cnt <- 0
  corr_out <- numeric(0)
  
  for (i in 1:322) {
    temp_ds <- na.omit(read.csv(paste(directory,"/",sprintf("%03d",as.numeric(i)),".csv",sep="")
                                ,header=T,sep=","))
    
    obs_cnt <- nrow(temp_ds)
    
    if(obs_cnt > threshold) {
      cor_data  <- cor(temp_ds["sulfate"], temp_ds["nitrate"]) 
      if (cnt==0){ 
        corr_out <- cor_data
      } else {
        corr_out <- append(corr_out, cor_data)
      }
      cnt <- cnt+1
    }
    
  }
  
  return(corr_out)
}