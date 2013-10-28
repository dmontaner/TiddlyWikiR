\docType{class}
\name{twList-class}
\alias{elements}
\alias{elements<-}
\alias{initialize,twList-method}
\alias{level}
\alias{level<-}
\alias{twList}
\alias{twList-class}
\alias{type}
\alias{type<-}
\title{A class to handle TiddlyWiki lists.}
\description{
  Some utilities to insert ordered and unordered lists into
  TiddlyWiki.
}
\section{Usage}{
  new ("twList", elements, level, type)

  twList (elements, ...)
}

\section{Slots}{
  \describe{ \item{\code{elements}:}{a character vector of
  the elements of the list.} \item{\code{level}:}{a numeric
  vector indicating the level of indentation of each of the
  elements of the list.} \item{\code{type}:}{a character
  vector indicating the desired bullet type. Allowed values
  are: "o" for "ordered" type elements and "u" for
  unordered. } }
}
\examples{
list1 <- new ("twList", elements = c("line one", "line two", "line three"),
              level = c(1,2,2), type = c("u", "o", "o"))
list2 <- twList (LETTERS[1:5])

wikify (list1)
wikify (list2)
}
\author{
  David Montaner \email{dmontaner@cipf.es}
}
\seealso{
  \code{\link{twLink}} and \code{\link{twImage}}
  \code{\link{twTable}}
}
\keyword{list}
\keyword{wiki}

