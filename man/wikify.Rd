\docType{methods}
\name{wikify}
\alias{as.character,twImage-method}
\alias{as.character,twLink-method}
\alias{wikify}
\alias{wikify,character-method}
\alias{wikify,tiddler-method}
\alias{wikify,twImage-method}
\alias{wikify,twLink-method}
\alias{wikify,twList-method}
\alias{wikify,twTable-method}
\title{Format R objects to be inserted into TiddlyWiki.}
\value{
  A character vector. Each element is intended to be a line
  within the TiddlyWiki template file.
}
\description{
  Generic function used to do the final formatting of R
  objects so that they can be introduced into a TiddlyWiki
  template file.
}
\details{
  At the moment, specific methods are described for
  classes: \code{tiddler}, \code{twImage}, \code{twLInk},
  \code{twList} and \code{twTable}. A character vector will
  be inserted "as is" into the TiddlyWiki file; each
  element of the vector will be a line within the file. Any
  other R object will be introduced as "code" chunks into
  the file using the standard R results display.

  The function is not intended to be called directly but
  from within the functions \code{writeTiddlers} and
  \code{writeTags}.
}
\author{
  David Montaner \email{dmontaner@cipf.es}
}
\seealso{
  \code{\link{writeTiddlers}}, \code{\link{writeTags}},
  \code{capture.output}
}
\keyword{convert}
\keyword{paste}
\keyword{wiki}

