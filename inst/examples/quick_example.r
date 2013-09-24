##quick_example.r
##2013-09-24 dmontaner@cipf.es
##A quick example for the library TiddlyWikiR


library (package = "TiddlyWikiR")
help (package = TiddlyWikiR)


############################################################
###Start a new template
############################################################

newEmptyWiki ("myTemplate.html")
newEmptyWiki ("myTemplate.html", overwrite = TRUE)
dir ()



############################################################
###Create an Image to be inserted into the wiki
############################################################
png ("tmp.png")
plot (1:10)
dev.off ()

myImage <- twImage (imgf = "tmp.png", label = "just a label", ref = "LinkToTiddler", width = "10%+")
myImage
width (myImage)



############################################################
###Replace a tag with an image
############################################################
tagList <- list ('@@my_tag_example@@' = myImage)
tagList
writeTags (tagList, file = "myTemplate.html")



############################################################
###Create a Link
############################################################
myLink <- twLink ("here", ref = "hereTiddler")
myLink



############################################################
###Create a List
############################################################
myList <- twList (elements = c("line 1", "line 2", "line 3","line 4"), 
                  level = c(1,1,2,2),
                  type = c("o", "o", "u", "u"))
myList

##will be inserted in the template file as:
cat (wikify (myList), sep = "\n")



############################################################
###Create a Table
############################################################

##example data.set
myData <- as.data.frame (matrix (rnorm (12), ncol = 4))
rownames (myData) <- c("one", "two", "three")
myData 

##create the wiki table
myTable <- twTable (dat = myData)
myTable

##include some links
ref (myTable)[,"V3"] <- c("tiddlerOne", "tiddlerTwo", "http://tiddlywiki.com/")

##include some colors
color (myTable)[,"V2"] <- c("red", "blue", "green")

myData



############################################################
###Create some "generic" R output
############################################################
x <- 1:100
y <- rnorm (100)
myStatRes <- summary (glm (y ~ x))
myStatRes



############################################################
###Create a vector of wiki syntax
############################################################

myVector <- c("This may be some ''bold text''",
              "!This may be a heading")

myVector



############################################################
###Create a tiddler
############################################################

myTiddler <- newTiddler (title = "My new tiddler",
                         content = list (myVector, myLink, myList, myTable, myStatRes))

tdContent (myTiddler)



############################################################
###Insert the tiddler into the wiki file
############################################################

writeTiddlers (tid = myTiddler, file = "myTemplate.html")
