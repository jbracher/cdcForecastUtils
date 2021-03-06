#' Write a sanitized file
#'
#' This function reads in the csv file and arranges it for consistency and overwrite.
#'
#' @param file A csv file path
#' @param challenge Either "ilinet" or "state_ili", indicating challenge the submission is for.
#' @return A reformatted csv file
#' @import dplyr
#' @export
write_sanitized_file <- function(file, challenge = "ilinet") {
  entry <- cdcForecastUtils::read_entry(file,challenge = challenge)
  model_name <- basename(file)
  if(cdcForecastUtils::verify_entry_file(file, challenge)){
    write.csv(entry,file,row.names=FALSE)
    return(message(paste0(model_name," has been sanitized and re-written.")))
  } else {
    return(message(paste0(model_name," failed verification tests and has not been re-written.")))
  }
}