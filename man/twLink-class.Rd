\docType{class}
\name{twLink-class}
\alias{initialize,twLink-method}
\alias{label,twLink-method}
\alias{label<-,twLink-method}
\alias{ref,twLink-method}
\alias{ref<-,twLink-method}
\alias{show,twLink-method}
\alias{twLink}
\alias{twLink-class}
\title{A class to handle TiddlyWiki links.}
\description{
  Some utilities to insert internal or external links into
  TiddlyWiki.
}
\section{Usage}{
  new ("twLink", label, ref)

  twLink ("the text here", ref = "the target here")
}

\section{Slots}{
  \describe{ \item{\code{label}:}{the visible text or
  anchor.} \item{\code{ref}:}{the target or URL to be
  redirected to.} }
}

\section{Methods}{
  \describe{ \item{\code{label} and \code{label (object) <-
  value}:}{Access and set \code{label}.} \item{\code{ref}
  and \code{ref (object) <- value}:}{Access and set
  \code{ref}.} }
}
\examples{
new ("twLink", label = "the text here", ref = "aTiddlerNameHere")
twLink (label = "the text here", ref = "http://www.r-project.org/")

twLink ("here", ref = "http://www.dmontaner.com")
paste ("see my home page",
       twLink ("here", ref = "http://www.dmontaner.com"), ", I hope you like it.")
}
\author{
  David Montaner \email{dmontaner@cipf.es}
}
\seealso{
  \code{\link{twTable}} and \code{\link{twImage}}
}
\keyword{link}
\keyword{wiki}

