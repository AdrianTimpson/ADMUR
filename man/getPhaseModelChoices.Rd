\name{getPhaseModelChoices} 
\alias{getPhaseModelChoices} 
\title{Lists currently available models for the PDF of a phase.} 
\description{
	Lists currently available models for the PDF of an archaeological phase, the number of parameters, and a brief description
	\loadmathjax }
\usage{getTruncatedModelChoices()}

\details{

All the following models models are suitable for modelling individual archaeological phases, 
or other temporal entities that by their very nature have a start and end (or at least wax and wane into and out of existance), 
such as an archaeological culture, or archaeological period.

\itemize{

\item
'uniform' is a uniform model requiring two parameters \mjseqn{x_{max}} and \mjseqn{x_{min}}, with the pdf defined as: \mjsdeqn{\frac{1}{x_{max} - x_{min}}}

\item 
'norm' is a  Gaussian model requiring two parameters  \mjseqn{\mu} and \mjseqn{\sigma}, with the pdf defined as: ??

\item 
'cauchy' is a Cauchy model requiring two parameters  \mjseqn{l} (location) and \mjseqn{s} (scale), with the pdf defined as: \mjsdeqn{\frac{1}{\pi{s}}\left(1+\Bigl(\frac{x-l}{s}\Bigr)^{2}\right) ^{-1}}  

\item 
'ellipse' is a semi-ellipse (top arch) requiring two parameters \mjseqn{x_{max}} and \mjseqn{x_{min}}, with the pdf defined as: 
}

}
\examples{
	getPhaseModelChoices()
	}
