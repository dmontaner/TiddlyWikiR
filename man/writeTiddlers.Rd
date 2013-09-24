\name{writeTiddlers}
\alias{insert}
\alias{writeTiddlers}
\title{Inserts one or more tiddlers into a TiddlyWiki file.}
\usage{
  writeTiddlers(tid = NULL, file, infile = file,
    outfile = file, check = TRUE, verbose = TRUE)
}
\arguments{
  \item{tid}{a tiddler or a list of tiddlers to be
  inserted.}

  \item{file}{TiddlyWiki template file.}

  \item{infile}{the template file where the tiddler is to
  be inserted.}

  \item{outfile}{the output file. Intended not to overwrite
  the template.}

  \item{verbose}{verbose.}

  \item{check}{check that there is not already a tiddler
  with the same title.}
}
\description{
  Inserts a tiddler into the desired TiddlyWiki file.
}
\details{
  By default the TiddlyWiki template "file" will be
  overwritten. The options "infile" and "outfile" may be
  used not to overwrite the template.
}
\author{
  David Montaner \email{dmontaner@cipf.es}
}
\seealso{
  \code{\link{wikify}}
}
\keyword{insert}
\keyword{tiddler}

