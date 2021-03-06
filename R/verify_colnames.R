#' Verify the column names of an entry
#'
#' Compares column names to a valid entry and provides an error if any required names
#' are missing and a warning if there are any extra names.
#'
#' @param entry An entry data.frame
#' @param check_week A logical value (default `TRUE`) indicating whether to check
#'   for the column forecast_week. Should be `TRUE` if evaluating entry prior to 
#'   scoring, can be `FALSE` if evaluating entry prior to writing to disk.
#' @return Invisibly returns \code{TRUE} if successful
#' @export
#' @keywords internal
verify_colnames <- function(entry) {
  
  names(entry) <- tolower(names(entry))
  
  entry_names <- colnames(entry)
  valid_names <- colnames(cdcForecastUtils::full_entry_new)
  
  missing_names <- setdiff(valid_names, entry_names)
  extra_names   <- setdiff(entry_names, valid_names)
  
  if (length(missing_names) > 0) {
      stop("Missing these columns: ", paste(missing_names, collapse=", "))
  }
  if (length(extra_names)>0)
      stop("These extra columns are not valid: ", paste(extra_names, collapse=", "))
  
  return(invisible(TRUE))
}