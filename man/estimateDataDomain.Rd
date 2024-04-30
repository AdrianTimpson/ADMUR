\name{estimateDataDomain} 
\alias{estimateDataDomain} 
\title{Estimates the calendar date domain of a 14C dataset} 
\description{Estimates the approximate date range of a 14C dataset, in calendar time}
\usage{estimateDataDomain(data, calcurve)}
\arguments{
  \item{data}{
	A dataframe of 14C dates. Requires 'age' and 'sd', and at least one of 'site' and 'phase'. Optional 'datingType' to include '14C' and anything else.
	}
  \item{calcurve}{
	A calibration curve object. Choose from intcal20 (default), shcal20, intcal13 or shcal13.
	}
}
\value{
	Returns a vector of two calendar dates BP.
	}
\details{
Since dates are derived from normal (or log normal) distributions, they have no absolute cut off point. 
However, in practice the tail of a PDF rapidly becomes vanishingly small, so a date range can be estimated using an arbitrarily large interval of the cumulative distribution.
	}
\examples{
\donttest{
# a single date within the 14C range 5000 to 10000
data <- data.frame(
		age = round(runif(1,5000,10000)), 
		sd = 3,
		datingType = '14C'
		)
estimateDataDomain(data, calcurve=intcal20)

# 50 dates within the 14C range 5000 to 10000
data <- data.frame(
		age = round(runif(50,5000,10000)), 
		sd = rep(50,50),
		datingType = rep('14C',50)
		)
estimateDataDomain(data, calcurve=intcal20)
}
}
