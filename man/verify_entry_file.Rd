% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/verify_entry.R
\name{verify_entry_file}
\alias{verify_entry_file}
\title{Verify an entry file}
\usage{
verify_entry_file(file, challenge = "ilinet")
}
\arguments{
\item{file}{A csv entry file}

\item{challenge}{one of "ilinet" or "state_ili" or "hospitalization", indicating which
challenge the submission is for}
}
\value{
Invisibly returns \code{TRUE} if successful, \code{FALSE} if not
}
\description{
This function will check to make sure the structure is correct and that
the forecast probabilities are non-negative and sum to a value between
0.9 and 1.1. For binary targets, this function will check if the forecast
provavilities are between 0 and 1.
}
\examples{
\dontrun{
file <- system.file("extdata/2020-ew10-valid-national.csv",package="cdcForecastUtils")
verify_entry_file(file) 
}
}
\seealso{
\code{\link{verify_entry}}
}
