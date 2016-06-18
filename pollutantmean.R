pollutantmean <- function(directory, pollutant, id = 1:322){
  
  ## combine files in a loop supplied with ID parameter
  lp_cnt <- 0  
  for (i in id) {
    temp_ds <- read.csv(paste(directory,"/",sprintf("%03d",as.numeric(i)),".csv",sep=""))
    
    ## select obs with non-missing values in POLLUTANT
    ext_ds  <- temp_ds[which(!is.na(temp_ds[[pollutant]]) & temp_ds$ID == i),]                        
    
    ## concatinate files data                       
    if (lp_cnt==0) { comb_ds <- ext_ds } 
    else { comb_ds <-rbind(comb_ds, ext_ds)}
    lp_cnt <- lp_cnt+1
  }
  rm(temp_ds)
  
  ## get mean value
  mean(comb_ds[[pollutant]])
}