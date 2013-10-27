\docType{class}
\name{twTable-class}
\alias{[,twTable-method}
\alias{align,twTable-method}
\alias{align<-,twTable-method}
\alias{bgcolor}
\alias{bgcolor<-}
\alias{color}
\alias{color<-}
\alias{colref}
\alias{colref<-}
\alias{dat}
\alias{dat<-}
\alias{digits}
\alias{digits<-}
\alias{dim,twTable-method}
\alias{footer}
\alias{footer<-}
\alias{includeColNames}
\alias{includeColNames<-}
\alias{includeRowNames}
\alias{includeRowNames<-}
\alias{initialize,twTable-method}
\alias{ref,twTable-method}
\alias{ref<-,twTable-method}
\alias{rowref}
\alias{rowref<-}
\alias{sortable}
\alias{sortable<-}
\alias{title,twTable-method}
\alias{title<-}
\alias{twTable}
\alias{twTable-class}
\title{A class to handle TiddlyWiki tables.}
\description{
  A class to handle TiddlyWiki tables.
}
\details{
  Missing values are allowed for the entries of the table
  in the "dat" slot. Missing data in in the "ref" or
  "color" slots are interpreted as no reference to be
  linked or not color to be used in the cell.

  If sortable = TRUE the plugin needs to be installed.
}
\section{Usage}{
  new ("twTable", dat, ...)

  twTable (dat, ref, color, ...)
}

\section{Slots}{
  \describe{ \item{\code{dat}:}{a data.frame containing the
  table values.} \item{\code{ref}:}{character matrix of the
  target or URL to be redirected to from each cell of the
  table.} \item{\code{color}:}{character matrix indicating
  the color of each cell of the table.}
  \item{\code{bgcolor}:}{character matrix indicating the
  background color of each cell of the table.}
  \item{\code{includeRowNames}:}{logical; if TRUE row names
  of "dat" are used as row names of the table.}
  \item{\code{includeColNames}:}{logical; if TRUE column
  names of "dat" are used as column names of the table.}
  \item{\code{rowref}:}{a character vectors of references
  to be linked from the row names of the table.}
  \item{\code{colref}:}{a character vectors of references
  to be linked from the column names of the table.}
  \item{\code{align}:}{a character vector indicating the
  alignment of each column of the table; may be missing or
  one of "l", "c" or "r".} \item{\code{title}:}{a title or
  header for the table.} \item{\code{footer}:}{a footer for
  the table.} \item{\code{sortable}:}{if TRUE the columns
  of the table may be sorted by clicking on their column
  names.} \item{\code{digits}:}{number of digits to be
  displayed in numerical, non integer columns. Default is
  3.} }
}
\examples{
myData <- as.data.frame (matrix (rnorm (12), ncol = 4))
myTable <- new ("twTable", dat = myData)
wikify (myTable)
}
\author{
  David Montaner \email{dmontaner@cipf.es}
}
\seealso{
  \code{\link{twLink}} and \code{\link{twImage}}
}
\keyword{table}
\keyword{wiki}

