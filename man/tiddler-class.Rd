\docType{class}
\name{tiddler-class}
\alias{initialize,tiddler-method}
\alias{newTiddler}
\alias{tdChangecount}
\alias{tdChangecount<-}
\alias{tdContent}
\alias{tdContent<-}
\alias{tdCreated}
\alias{tdCreated<-}
\alias{tdCreator}
\alias{tdCreator<-}
\alias{tdModified}
\alias{tdModified<-}
\alias{tdModifier}
\alias{tdModifier<-}
\alias{tdTags}
\alias{tdTags<-}
\alias{tdTitle}
\alias{tdTitle<-}
\alias{tiddler}
\alias{tiddler-class}
\title{A class to handle TiddlyWiki tiddlers.}
\description{
  Object to store a TiddlyWiki tiddler information.
}
\section{Usage}{
  new ("tiddler", title, content, ...)

  newTiddler (title, content, ...)
}

\section{Slots}{
  \describe{ \item{\code{title}:}{title of the tiddler.}
  \item{\code{content}:}{content of the tiddler.}
  \item{\code{tags}:}{tags of the tiddler.}
  \item{\code{creator}:}{indicates who created the
  tiddler.} \item{\code{modifier}:}{indicates who modified
  the tiddler.} \item{\code{created}:}{timestamp of the
  tiddler creation.} \item{\code{modified}:}{timestamp of
  the tiddler modification.}
  \item{\code{changecount}:}{number of times the tiddler
  was changed.} }
}

\section{Methods}{
  Methods are implemented to access and set all slots form
  a tiddler object. The most useful ones may be: \itemize{
  \item{\code{tdTitle}} \item{\code{tdContent}}
  \item{\code{tdTags}} \item{\code{tdCreator}} } But
  \code{tdModifier}, \code{tdCreated}, \code{tdModified}
  and \code{tdChangecount} are also implemented.
}
\examples{
tiddler1 <- new ("tiddler", title = "MyNewTiddler1", content = "the first content")
tiddler2 <- newTiddler (title = "MyNewTiddler2", content = "the second content", creator = "me")
}
\author{
  David Montaner \email{dmontaner@cipf.es}
}
\keyword{tiddler}
\keyword{wiki}

