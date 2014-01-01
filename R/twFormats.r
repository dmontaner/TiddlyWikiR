##twFormats.r
##2014-01-01 dmontaner@cipf.es
##basic formatting functions

## @name twFormats ##SEE WHY THIS DOES NOT WORK
## @docType function
##' @author David Montaner \email{dmontaner@@cipf.es}
##' 
##' @aliases twBold
##' @aliases twIt
##' @aliases twUnder
##' @aliases twHigh
##' @aliases twCode
##' 
##' @keywords wiki formats
##' @seealso \code{\link{twImage}} and \code{\link{twLink}}
##' 
##' @title Basic TiddlyWiki formatting functions
##'
##' @description Some basic functions for basic formatting.
##'
##' @details See http://classic.tiddlywiki.com/#[[Basic Formatting]] for further details.
##'
##' @section Usage:
##' twBold (x)
##' twIt (x)
##' twUnder (x)
##' twHigh (x)
##' twCode (x)
##'
##' @param x text to be formatted
##'
##' @examples
##' twBold ("here my bold")
##' twCode ("here my code")

##' @export
twBold <- function (x) {
    paste ("''", x, "''", sep = "")
}

##' @export
twIt <- function (x) {
    paste ("//", x, "//", sep = "")
}

##' @export
twUnder <- function (x) {
    paste ("__", x, "__", sep = "")
}

##' @export
twHigh <- function (x) {
    paste ("@@", x, "@@", sep = "")
}

##' @export
twCode <- function (x) {
    paste ("{{{", x, "}}}", sep = "")
}
