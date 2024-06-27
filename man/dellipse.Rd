\name{dellipse} 
\alias{dellipse} 
\title{The semi-ellipse} 
\description{
	Probability Density Function of the semi-ellipse
	\loadmathjax }
\usage{dellipse(x, min, duration)}
\arguments{
  \item{x}{
	Vector of values at which to calculate the pdf.
	}
  \item{min, duration}{
	min is the lower limit of the distribution. Therefore min plus duration is the upper limit of the distribution.  Must be finite.
	}
}
\value{
	The pdf at the provided x values.
	}
\details{
The pdf of the semi-ellipse (the top half of an ellipse) is defined as:  \mjseqn{f(x) = \frac{\sqrt{r^{2} - \Bigl(x - \frac{min + max}{2} \Bigr)^{2}}}{\frac{1}{2}\pi r^{2}}} where \mjseqn{r = \frac{max - min}{2}}
	}
\examples{
	x <- seq(1:500)
	y <- dellipse(x, min = 100, duration=200)
	plot(x,y,type='l')
	}

