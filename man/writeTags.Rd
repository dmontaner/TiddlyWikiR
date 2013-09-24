\name{writeTags}
\alias{writeTags}
\title{Replace tags within a TiddlyWiki file.}
\usage{
  writeTags(x, tag = names(x), rep = x, file,
    infile = file, outfile = file, verbose = TRUE)
}
\arguments{
  \item{x}{a list}

  \item{tag}{a character vector containing the tags to be
  replaced.}

  \item{rep}{a list of the objects that will replace each
  tag.}

  \item{file}{TiddlyWiki template file.}

  \item{infile}{template file.}

  \item{outfile}{output file if required to be different
  from the input file.}

  \item{verbose}{verbose.}
}
\description{
  The function replaces one or more tags within a
  TiddlyWiki template file. It is intended to insert the
  results of the analysis within already existing tiddlers.
}
\details{
  A list with the tags to be replaced in its 'names' and
  the replacement objects in its 'elements' is required by
  the function.

  Alternatively a character vector of tags and a list of
  replacements objects may be provided. When there is just
  one tag to be replaced 'x' or 'rep' may not be wrapped
  into the list structure; 'x' would be then a character
  vector of length one and 'rep' may be any object in R.

  By default the TiddlyWiki template "file" will be
  overwritten. The options "infile" and "outfile" may be
  used not to overwrite the template.

  A recommendation is to use something like
  \code{@this_is_my_tag@} as a 'tag' to be replaced. This
  character string is generally unique so there Will not be
  any problem in overwriting it. Also the @ indicates a
  highlight in the TiddlyWiki syntax so you will track your
  tags easily in your writing.
}
\examples{
\dontrun{
  writeTags (x, tag = names (x), rep = x, file = "myTemplate.html")
}
}
\author{
  David Montaner \email{dmontaner@cipf.es}
}
\seealso{
  \code{\link{writeTiddlers}}, \code{\link{wikify}},
  \code{gsub}
}
\keyword{replace}
\keyword{tag}

