\name{newEmptyWiki}
\alias{newEmptyWiki}
\title{Creates a TiddlyWiki template to start working.}
\usage{
  newEmptyWiki(file, overwrite = FALSE, TiddlySaver = TRUE)
}
\arguments{
  \item{file}{the name of the output file.}

  \item{overwrite}{logical. If TRUE the destination file
  will be overwritten if it exists.}

  \item{TiddlySaver}{logical. If TRUE the "saver" file will
  be copied to the same directory as the TiddlyWiki file.}
}
\value{
  The function tries to create an empty TiddlyWiki template
  file. A value of TRUE or FALSE is returned if the file
  could be created or not.
}
\description{
  An empty TiddlyWiki file is created. It is intended to be
  used as a template where you will "write" your report and
  where you will automatically insert chunks of information
  taken from your R session results.
}
\details{
  The file is copied form the examples folder in the
  TiddlyWikiR library. It may not be the latest version of
  TiddlyWiki so you may want to visit
  \url{http://tiddlywiki.com} to get the newest one.

  The TiddlySaver.jar file is also copied (unless
  indicated). This file is needed by some browsers to be
  able to save changes in TiddlyWiki (see
  \url{http://tiddlywiki.com/#TiddlySaver}).

  Some useful plugins are installed within this local
  version (see \url{http://tiddlywiki.com/#Plugins}).
}
\examples{
\dontrun{
newEmptyWiki ("myTemplate.html")
browseURL ("myTemplate.html")
}
}
\author{
  David Montaner \email{dmontaner@cipf.es}
}
\seealso{
  \code{file.copy}
}
\keyword{template}
\keyword{wiki}

