#' Sanitize a csv entry file
#'
#' This function re-format entry files for minor formatting issues.
#'
#' @param entry A data.frame of a csv entry
#' @param challenge one of "ilinet" or "state_ili" or "hospitalization", indicating which
#'   challenge the submission is for
#' @return A correctly formatted data.frame
#' @import dplyr
#' @export
sanitize_entry <- function(entry,challenge="ilinet"){
  # change all column names to lower case
  names(entry) <- tolower(names(entry))
  
  # get rid of blank spaces on the left+right sides in locations and targets
  entry$location <- trimws(entry$location, which="both")
  entry$target <- trimws(entry$target, which="both")
  
  # change type to lower case
  entry$type <- tolower(trimws(entry$type, which="both"))
  
  # sanitize bins
  if (challenge != "hospitalization"){
    # add .0 to 1-25 integer bins if exist
    if(length(
        entry$bin[which(entry$type=="bin" & 
                        (grepl("wk ahead",entry$target) | grepl("Peak height",entry$target)) & 
                        (!is.na(entry$bin)) & (nchar(entry$bin) <=2))])>0){
      entry$bin[which(entry$type=="bin" & 
                        (grepl("wk ahead",entry$target) | grepl("Peak height",entry$target)) & 
                        (!is.na(entry$bin)) & (nchar(entry$bin) <=2))] <- 
        paste0(entry$bin[which(entry$type=="bin" & 
                                 (grepl("wk ahead",entry$target) | grepl("Peak height",entry$target)) & 
                                 (!is.na(entry$bin)) & (nchar(entry$bin) <=2))],".0")  
    } 
  }
  # add NA in bin for point prediction
  entry$bin[which(entry$type=="point")]<-NA
  
  # trim white spaces and lower case
  entry$bin <- tolower(trimws(entry$bin, which="both"))
  
  # sanitize value
  entry$value <- tolower(trimws(entry$value, which="both"))
  
  return(entry)
}