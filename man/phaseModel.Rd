\name{phaseModel} 
\alias{phaseModel} 
\title{Posterior parameter estimation of a phase model} 
\description{Calibrates 14C dates in a phase and calculates joint posterior parameter probabilities and point estimates (weighted mean) of a simple parameteric phase model}
\usage{phaseModel(data, calcurve, prior.matrix, model, plot = FALSE)}
\arguments{
  \item{data}{
	A dataframe of 14C dates. Requires 'age' and 'sd'.
	}
  \item{calcurve}{
	A calibration curve object. Choose from intcal20 (default), shcal20, intcal13 or shcal13. 
	}
	\item{prior.matrix}{
	A matrix of prior probabilities of the two model parameters. Row names and col names are the parameter values.
	}
	\item{model}{
	Specify the model used for the phase distribution. Choose from 'norm', 'ellipse'
	}
  \item{plot}{
	By default (TRUE) will plot the calibrated 14C dates, the posterior probability surface of the parameters, and the model using the (weighted) mean posterior point esimates.
	}
}
\value{
	Returns a list of various objects, including: PD (the Probability Densities of each calibrated 14C date); posterior (the posterior probabilites of the model parameters); and the weighted mean posterior parameter estimates.
	}
\details{
	Function to combine the prior probabilities of the phase model parameters, with the evidence of the 14C dates at that phase.
	}
\examples{
	calcurve <- intcal20

	# 10 random 14C dates
	N <- 10
	age <- uncalibrateCalendarDates(rnorm(N,6350,350), calcurve)
	sd <- rep(25,N)
	data <- data.frame(age,sd)

	# specify the prior probabilities of the parameter values of a gaussian model in a matrix
	mu.range <- c(5500,7000)
	sigma.range <- c(5,700)
	prior.matrix <- matrix(1,150,150)
    prior.matrix <- prior.matrix/sum(prior.matrix)
    row.names(prior.matrix) <- seq(
       from = min(mu.range),
       to = max(mu.range),
       length.out = nrow(prior.matrix)
    )
	colnames(prior.matrix) <- seq(
           from = min(sigma.range),
           to = max(sigma.range),
           length.out=ncol(prior.matrix)
        )

	# generate the posterior parameter probabilities
	pm <- phaseModel(data, calcurve, prior.matrix, model='norm', plot=TRUE)
	}
