\name{Ozone measurements}
\docType{data}
\alias{ozone}
\title{Monthly ozone measurements over Central America}
\description{

This data set is a subset of the data from the 2006 ASA Data expo challenge, \url{http://stat-computing.org/dataexpo/2006/}.  The data are monthly ozone averages on a very coarse 24 by 24 grid covering Central America, from Jan 1995 to Dec 2000.

The data is stored in a 3d area with the first two dimensions representing latitude and longitude, and the third representing time.  See the ozone case study in the introductory vignette (\code{vignette("intro", "plyr")}) for more details, including maps of the region.

}
\usage{data(ozone)}
\format{A 24 x 24 x 72 numeric array}
\references{\url{http://stat-computing.org/dataexpo/2006/}}
\keyword{datasets}
\examples{
value <- ozone[1, 1, ]
time <- 1:72
month.abbr <- c("Jan", "Feb", "Mar", "Apr", "May", 
 "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
month <- factor(rep(month.abbr, length = 72), levels = month.abbr)
year <- rep(1:6, each = 12)
deseasf <- function(value) lm(value ~ month - 1)

models <- alply(ozone, 1:2, deseasf)
coefs <- laply(models, coef)
dimnames(coefs)[[3]] <- month.abbr
names(dimnames(coefs))[3] <- "month"

deseas <- laply(models, resid)
dimnames(deseas)[[3]] <- 1:72
names(dimnames(deseas))[3] <- "time"

dim(coefs)
dim(deseas)
}