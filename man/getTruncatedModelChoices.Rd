\name{getTruncatedModelChoices} 
\alias{getTruncatedModelChoices} 
\title{Lists currently available models for population dynamics} 
\description{
	Lists currently available models, the number of parameters, and a brief description
	\loadmathjax }
\usage{getTruncatedModelChoices()}

\details{

All the following models are truncated, such that the the total area (probability mass) between \mjseqn{x_{min}} and \mjseqn{x_{max}} equals 1. 
These limits (\mjseqn{x_{min}} and \mjseqn{x_{max}}) are the date range of the argument 'years', which is specified by the user. 
The user is therefore free to specify any date range of interest in which to model the underlying popluation dynamics of the overall data.
For example, the full radiocarbon dataset may cover a wide range, with dates between 30,000 BP and 500 BP, but the user may wish to model a narrow the model range, for several reasons, such as
1) the sampling intensity when accruing the dataset is only reliable over a narrow range (research bias); 2) to avoid edge effects.

As such, these models are not appropriate for modelling archaeological phases, which by their very nature have a start and end (or at least wax and wane into and out of existance).

\itemize{

\item 
'CPL' is a Continuous Piecewise Linear model. It must have an odd number of parameters, each with a value between 0 and 1. A n-CPL model has \mjseqn{2n-1} parameters (\mjseqn{n-1} x-parameters and \mjseqn{n} y-parameters) that are mapped to \mjseqn{n+1} PD coordinates (x,y pairs) using a modified Stick Breaking Dirichlet Process. The first and last x-coordinate are set as \mjseqn{x_{min}} and \mjseqn{x_{max}}, and the remaining internal x-coordinates are converted from their respective x-parameters using the Beta distribution CDF (where \mjseqn{\alpha = 1} and \mjseqn{\beta =} the number of pieces still to be broken). The y-parameters (between 0 and 1) are converted to y-coordinates in two steps. Firstly, they are mapped from the parameter range (0,1) to the coordinate range (0, \mjseqn{\infty}) using the formula \mjseqn{\frac{1}{(1 - y)^2} - 1}, and the single remaining y-coordinate is set as \mjseqn{\frac{1}{(1 - 0.5)^2} - 1}. Secondly, they are normalised by the total area under the curve, calculated as the sum of the areas under all \mjseqn{n} pieces: \mjsdeqn{Area = \sum_{i=1}^{n} (\frac{y_i + y_{i+1}}{2})(x_{i+1} - x_i) }

\item
'uniform' is a uniform model requiring no parameters. I.e. the argument pars must be NA, and trivially the PDF is: \mjsdeqn{\frac{1}{x_{max} - x_{min}}}

\item 
'norm' is a truncated Gaussian model. The two parameters are used as \mjseqn{\mu} and \mjseqn{\sigma} in the formula for a truncated Normal distribution, the PDF of which is calculated in two steps. Firstly, the PDF of an ordinary Normal distribution is calculated. Secondly, it is normalised by the area within the date range.

\item 
'exp' is a truncated exponential model of the form \mjseqn{f(x)=ae^{rx}} where \mjseqn{x =} years. The single parameter is used as the rate exponent \mjseqn{r} which gives growth through time if \mjseqn{r > 0}, decline if \mjseqn{r < 0}, and constant if \mjseqn{r=0}. The PDF is as follows. Note the \mjseqn{a} parameter cancels out: \mjsdeqn{\frac{-re^{-r x}}{e^{-rx_{max}} - e^{-rx_{min}}}}  

\item 
'logistic' is a truncated logistic model. The two parameters are used as the rate \mjseqn{k} and centre \mjseqn{x_0} where the PDF is: \mjsdeqn{\frac{k}{(e^{-k(x_0 - x)} + 1)\ln{\Bigl(\frac{e^{-k(x_0 - x_{min})} + 1}{e^{-k(x_0 - x_{max})} + 1}}\Bigr)}}

\item 
'sine' is a truncated sinewave model. 	
The usual function to describe a sine wave is \mjseqn{f(x) = A\sin(2\pi f x + p)}, where \mjseqn{A} is the amplitude, \mjseqn{f} is the frequency (cycles per year), and \mjseqn{p} is the cycle position (in radians) at \mjseqn{x = 0}, and therefore oscillates above and below the x-axis.

However, a sinusoidal PDF must by definition always be non-negative, which can conceptually be considered as a sine wave stacked on top of a uniform distribution with a height \mjseqn{A + k}, where \mjseqn{k >= 0}.
Since the PDF is \mjseqn{f(x)} divided by the area below the curve, A and k simplify to a single parameter \mjseqn{r} that determines the relative proportions of the uniform and sinusoidal components, such that:

when \mjseqn{r = 0} the amplitude of the sine wave component is zero, and the overall PDF is just a uniform distribution between min and max.

when \mjseqn{r = 1} the uniform component is zero, and the minima of the sine wave touches zero. This does not necessarily mean the PDF minimum equals zero, since a minimum point of the sine wave may not occur with PDF domain (truncated between min and max).

Therefore the formula for the PDF is:

\mjsdeqn{\frac{1 + \sin(2\pi f x + p) - \ln(r)}{(x_{max} - x_{min})(1 - \ln(r)) + (\frac{1}{2\pi f})[\cos(2\pi f x_{min} - p) - \cos(2\pi f x_{max} - p)]}} 
where \mjseqn{x =} years, and \mjseqn{x_{min}} and \mjseqn{x_{max}} determine the truncated date range;

\mjseqn{f} determines the numeric frequency (cycles per unit \mjseqn{x});

\mjseqn{p} determines the cycle position (in radians) at \mjseqn{x = 0}, and must be a numeric between \mjseqn{0} and \mjseqn{2\pi};

\mjseqn{r} determines how flat the distribution is, and must be a numeric between 0 and 1.

\item 
'cauchy' is a truncated Cauchy model. The two parameters are used as \mjseqn{l} (location) and \mjseqn{s} (scale) in the formula for a truncated Cauchy distribution. The PDF is as follows where \mjseqn{x =} years: \mjsdeqn{\frac{1}{sa[1+(\frac{x-l}{s})^2][\arctan(\frac{l-x_{min}}{s})-\arctan(\frac{l-x_{max}}{s})]}}  

\item 
'power' is a truncated Power function model of the form \mjseqn{f(x)=a(b+x)^c} where \mjseqn{x =} years.  The PDF is as follows. Note the \mjseqn{a} parameter cancels out: \mjsdeqn{\frac{(c+1)(b+x)^c}{(b+x_{max})^{(c+1)} - (b+x_{min})^{(c+1)}}}

\item 
'timeseries' is a custom model of any complexity, typically derived from an independent source. For example, a timeseries of the proportion of forest to grassland through time, derived from pollen data. This requires a single parameter \mjseqn{r} to scale the PDF.
}

}
\examples{
	getTruncatedModelChoices()
	}
