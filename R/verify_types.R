#' Verify types are correct
#'
#' The necessary types depend on the type, so this will verify types are correct
#' for all types
#'
#' @param entry An entry data.frame
#' @param challenge one of "ilinet" or "state_ili", indicating which
#'   challenge the submission is for
#' @return Invisibly returns TRUE if successful
#' @export
#' @keywords internal
#' @seealso \code{\link{verify_entry}}
#' @examples
#' verify_types(full_entry_new)
verify_types <- function(entry, challenge = "ilinet") {
  
  if (!(challenge %in% c("ilinet", "state_ili","hospitalization"))) {
    stop("challenge must be one of ilinet, hospital, or state_ili or hospitalization")
  }
  
  names(entry) <- tolower(names(entry))
  
  # ILINet challenge
  if (challenge == "ilinet") {
    valid_types <- unique(cdcForecastUtils::full_entry_new$type)
  } else if (challenge == "state_ili") {
    valid_types <- unique(cdcForecastUtils::full_entry_state_new$type)
  } else if (challenge == "hospitalization"){
    valid_types <- unique(cdcForecastUtils::hosp_template$type)
  } 
  entry_types <- unique(entry$type)
  
  missing_types <- setdiff(valid_types, entry_types)
  extra_types   <- setdiff(entry_types, valid_types)
  has_error <- FALSE
  
  if (challenge == "ilinet" | challenge == "state_ili"){
    if (length(missing_types)>0) {
      warning("Missing these types: ", paste(missing_types, collapse=", "))
      has_error <- TRUE
    }
  } else if(challenge == "hospitalization"){
    if (length(missing_types) == 2) {
      warning("Missing both point and bin types")
      has_error <- TRUE
    }
  }
    
  if (length(extra_types)>0 && extra_types != "point") {
    warning("These extra types are not valid: ", paste(extra_types, collapse=", "))
    has_error <- TRUE
  }
  
  
  if (has_error) {
    return(invisible(FALSE))
  } else {
    return(invisible(TRUE))
  }
}