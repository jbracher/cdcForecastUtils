date_start_and_end_to_date_seq <- function(date_start,date_end){
  year_start <- as.numeric(substr(date_start,1,4))
  week_start <- as.numeric(substr(date_start,8,10))
  
  year_end <- as.numeric(substr(date_end,1,4))
  week_end <- as.numeric(substr(date_end,8,10))
  
  date_sequence <- seq(MMWRweek::MMWRweek2Date(MMWRyear = year_start,MMWRweek = week_start),
                       MMWRweek::MMWRweek2Date(MMWRyear = year_end,MMWRweek = week_end), by="weeks")
  back_to_dates <- MMWRweek::MMWRweek(date_sequence)
  back_to_dates$MMWRweek <- unlist(lapply(back_to_dates$MMWRweek,function(x){
    if (nchar(x)==1){
      return (paste0("0",x))
    } else {
      return (x)
    }
  }))
  
  return(paste0(back_to_dates$MMWRyear,"-EW",back_to_dates$MMWRweek))
}