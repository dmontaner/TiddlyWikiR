<!--
%\VignetteEngine{knitr::knithtml}
%\VignetteIndexEntry{Getting started with TiddlyWikiR}
-->

<center>

Getting started with TiddlyWikiR
================================================================================

**[David Montaner](http://www.dmontaner.com/)** 

26-10-2013

</center>

--------------------------------------------------------------------------------

TiddlyWikiR is an R package for writing dynamic reports using [TiddlyWiki][tw_home] as a template.

The library implements S4 classes to organize and handle statistical results within R, 
and functions to insert those results into the wiki file.

In this document you can find a brief introduction to the package.


About TiddlyWiki
--------------------------------------------------------------------------------

[TiddlyWiki][tw_home] is a single page wiki application.
It is built in a unique HTML file which includes CSS and JavaScript besides the document content.
As any other wiki system, users may add, modify, or delete content using a web browser.
Being a wiki, it has the advantage over plain HTML pages of the simplified markup language and the easiness of edition.
But unlike most other wiki applications, TiddlyWiki does not need any installation;
it does not even need being hosted in a web server.
The single file that constitutes the application is downloaded and kept locally while the edition is ongoing.
It can be used as a local document or it may be finally uploaded to a server and made accessible via Internet
as any other HTML file.

TiddlyWiki content organization relies on chunks of information called __tiddlers__.
Tiddlers can be set to be displayed in the document when it is first opened,
or they can be accessed through the appropriated links when necessary.
This feature makes TiddlyWiki optimal for writing small statistical reports:
the most relevant information in the document can be display linearly by default 
while complementary information as for instance the explanation of the statistical glossary
can be kept in the background and accessed just when the reader needs it.

Being a single file, a TiddlyWiki document can be straightforward used as a template for such statistical reports.
First the wiki system will allow for the quick edition of the text and for the specification of the document lay out.
Then, as TiddlyWiki is ultimately a text file, 
automatic routines implemented in **TiddlyWikiR** may insert additional information into the report 
as for instance tables of descriptive statistics, results form hypothesis testing,
or links to plots that will be displayed within the document.

TiddlyWiki is published under an open source license 
which makes it very suitable to the R users community.

Visit http://tiddlywiki.com for more in formation about TiddlyWiki.


TiddlyWikiR usage
================================================================================

First of all load the library:


```r
library(package = "TiddlyWikiR")
```


TiddlyWikiR is intended for automatically inserting R results 
into a TiddlyWiki template. 
Thus, first of all you will need to get a TiddlyWiki file 
where the results of our R session will be inserted.
Generally you will download an empty TiddlyWiki file form the [TiddlyWiki][tw_home] web page, 
but, for a quick start, you can use the __example wiki file__ distributed within TiddlyWikiR.


The following code will copy the template to your working directory:


```r
newEmptyWiki("myTemplate.html")
```

```
## [1] FALSE
```

```r
dir()
```

```
## [1] "files"                            "myReport_1.html"                 
## [3] "myReport_2.html"                  "myTemplate.html"                 
## [5] "TiddlySaver.jar"                  "TiddlyWikiR_getting_started.html"
```


The file [myTemplate.html](myTemplate.html) has been crated. 
You can view this html file in your browser and use the TiddlyWiki editor to write into it. 

The __TiddlySaver.jar__ file is needed by some browsers to be able to save changes in the wiki. 
See the [TiddlyWiki][tw_home] web page for details.

From this point the idea is to work at the same time with two files: 
- the wiki template file where you will write your report: introduction, methods, conclusions ...
- an R script that will help you inserting your statistical results into the wiki file creating the final document.


TiddlyWikiR will let you insert data into the wiki in two ways:
- replacing tags within already existing tiddlers.
- creating new tiddlers.



Replace a tag within an existing tiddler
--------------------------------------------------------------------------------

If you open the template file [myTemplate.html](myTemplate.html)
you will see that it has been edited using a web browser.

A section called "Tag example" has been created. 
Some text has been written and two tags are left to be replaced by TiddlyWikiR
in the tiddler GettingStarted.

We may for instance replace the first tag by an image and the second by a number,
but any other elements would be allowed: tables, hyper links, text ...

Let's first create the image to be displayed:





```r
png("files/myplot.png")
plot(1:10)
dev.off()
```


and now let's create the TiddlyWikiR object 
holding the information about how the image should be displayed in the report:


```r
myImage <- twImage(imgf = "files/myplot.png", label = "drag the image with your mouse", 
    ref = "LinkToTiddler", width = "10%+")
```


Finally we replace the tag for the image and the tag for the number:


```r
tagList <- list(`@@my_tag_for_plot@@` = myImage, `@@my_tag_for_number@@` = 1e+06)
writeTags(tagList, infile = "myTemplate.html", outfile = "myReport_1.html")
```

```
## Reading file: myTemplate.html
## Writing file: myReport_1.html
```


You can see the result of the insertion in the newly created file [myReport_1.html](myReport_1.html)



Insert a new tiddler
--------------------------------------------------------------------------------

In this section we will show how new tiddlers can be introduced in the wiki by TiddlyWikiR.
We also exemplify the different elements TiddlyWikiR is able to format:

- images
- hyperlinks to internal or external content
- lists
- tables
- tiddlers
- text lines
- R objects display


As an example we may create a hyper link to a tiddler called TiddlerName:


```r
myLink <- twLink("follow the link to a tiddler", ref = "TiddlerName")
```



We can also create a list:


```r
myList <- twList(elements = c("line 1", "line 2", "line 3", "line 4"), level = c(1, 
    1, 2, 2), type = c("o", "o", "u", "u"))
```


that will be inserted in the wiki file as:


```r
cat(wikify(myList), sep = "\n")
```

```
## # line 1
## # line 2
## ** line 3
## ** line 4
```



We create data set:


```r
myData <- as.data.frame(matrix(rnorm(12), ncol = 4))
rownames(myData) <- c("one", "two", "three")
myData
```

```
##            V1      V2      V3      V4
## one    1.1585  1.6188 0.01018 -0.7081
## two   -0.3116 -0.4347 0.68724  1.0374
## three -0.4112  0.8712 0.56024  0.1257
```


and convert it into a table to be included in the report:


```r
myTable <- twTable(dat = myData, sortable = TRUE)
```


we include internal and external links in the third column of the table:


```r
ref(myTable)[, "V3"] <- c("tiddlerOne", "tiddlerTwo", "http://tiddlywiki.com/")
```


and color the cells in the second column:


```r
color(myTable)[, "V2"] <- c("red", "blue", "green")
```



We also store some standard R object from an statistical analysis:


```r
x <- 1:100
y <- rnorm(100)
my.stats <- summary(glm(y ~ x))
```



And finally we create a text vector containing some wiki syntax:


```r
myVector <- c("This may be some ''bold text''", "!This may be a heading")
```


Now we are ready to insert all those objects into a __tiddler__ of our TiddlyWiki report.

We first gather all of them into a __tiddler object__ entitled "MyNewTiddler":


```r
myTiddler <- newTiddler(title = "MyNewTiddler", content = list(myVector, myLink, 
    myList, myTable, my.stats))
```


And finally we insert the tiddler into the wiki file:


```r
writeTiddlers(tid = myTiddler, infile = "myReport_1.html", outfile = "myReport_2.html")
```

```
## Reading file: myReport_1.html
## Writing file: myReport_2.html
```


Observe that with the above command we created a third file called [myReport_2.html](myReport_2.html).
We did so for clarifying the TiddlyWikiR process but generally one will overwrite the first report file doing:

```r
writeTiddlers (tid = myTiddler, file = "myReport_1.html")
```

Notice that in such way we would overwrite the first created report,
but not the wiki template [myTemplate.html](myTemplate.html) which we are editing in our browser
and that is not intended to be modified by TiddlyWikiR.


Finally we may replace our last tag (now overwriting the file):


```r
writeTags(list(`@@currently does not exist@@` = "has been created"), file = "myReport_2.html")
```

```
## Reading file: myReport_2.html
## Writing file: myReport_2.html
```


Thus, the final report is ready to go in the file [myReport_2.html](myReport_2.html).


Session Info
--------------------------------------------------------------------------------


```r
sessionInfo()
```

```
## R version 3.0.2 (2013-09-25)
## Platform: x86_64-unknown-linux-gnu (64-bit)
## 
## locale:
##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
##  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
##  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
##  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
## [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] TiddlyWikiR_1.0.0 knitr_1.5        
## 
## loaded via a namespace (and not attached):
## [1] evaluate_0.5.1 formatR_0.9    markdown_0.6.3 stringr_0.6.2 
## [5] tools_3.0.2
```




More about TiddlyWikiR
================================================================================

Some more documentation about TiddlyWikiR may be found at:

- https://github.com/dmontaner/TiddlyWikiR
- http://www.dmontaner.com/


<!--
Links
================================================================================
-->

[tw_home]: http://tiddlywiki.com/


--------------------------------------------------------------------------------
<center>
Last revision: 26-10-2013 | Compiled: 28-10-2013
</center>
