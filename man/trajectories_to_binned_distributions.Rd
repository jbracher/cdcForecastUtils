% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trajectories_to_binned_distributions.R
\name{trajectories_to_binned_distributions}
\alias{trajectories_to_binned_distributions}
\title{Convert a matrix of sampled trajectories to binned distributions for
short-term and/or seasonal targets.}
\usage{
trajectories_to_binned_distributions(
  trajectories,
  targets,
  h_max,
  bins,
  baseline,
  season_start_ew,
  season_end_ew,
  cdc_report_ew
)
}
\arguments{
\item{trajectories}{matrix of simulated trajectories.  Each row is one
simulated trajectory, each column is one time point.  Must contain all
time points needed to calculate seasonal and short-term targets}

\item{h_max}{largest horizon for short-term targets}

\item{targets:}{character vector specifying targets to compute. May include:
"wk ahead", "Below baseline for 3 weeks", "First week below baseline",
"Peak height", "Peak week"}

\item{bins:}{vector of start and end points for incidence targets.
For example: c(seq(from = 0.0, to = 25.0, by = 0.1), 100.0)}

\item{baseline:}{baseline for this unit, if applicable; required if
"onset timing", "Below baseline for 3 weeks", or
"First week below baseline" are among the targets to forecast}

\item{season_start_ew:}{character specification of season start epidemic
week, formatted as "2019-EW40"}

\item{season_end_ew:}{character specification of season end epidemic week,
formatted as "2020-EW20"}

\item{cdc_report_ew:}{character specification of epidemic week corresponding
to most recent cdc report, formatted as "2019-EW40"}
}
\value{
data frame with columns:
   target: with values coming from targets
   type: populated with "Bin"
   bin: name of bin for categorical targets, lower endpoint of bin for
       numeric targets
   value: proportion of trajectories falling in bin
}
\description{
Convert a matrix of sampled trajectories to binned distributions for
short-term and/or seasonal targets.
}
