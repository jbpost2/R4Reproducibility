Exercises 5 - Markdown Solutions
================

We’ll be continuing from a previous exercise. The code we’ll need is
below.

``` r
# packages
library(tidyverse)  
library(dcData)     
# data intake
data("BabyNames", package = "dcData")

BabyNamesSupp <- read_csv("https://github.com/jbpost2/Basics-of-R-for-Data-Science-and-Statistics/raw/master/datasets/BabyNamesSupp.csv")
```

<hr>

# 5.1 Update the yaml Header

Create a new .Rmd file (using File –&gt; New File –&gt; R Markdown then
choose HTML as the output type).

1.  “Knit” the document to render the initial HTML document. This will
    require you to save the .Rmd file.

2.  Update yaml header as necessary to include an informative title,
    author name, & relevant date.

    -   “Knit” to verify the update
    -   In general, Knit very often as you get the hang of the new
        tools!

<!-- -->

    ---
    title: "Add a title"
    author: "Add your name"
    date: "Pick a date"
    output: html_document
    ---

# 5.2 Writing some Markdown!

After the YAML header and after the first R code chunk, replace the text
with the following (which includes a header and a list):

> # Investigating Names
>
> We’ll be investigating the popularity of names in the US each year.
> The names of interest are:

-   Justin  
-   Alexander  
-   Jacob  
-   Anderson  
-   George

Knit this document to see the changes!

<hr>

# 5.3 Write Some Code Chunks!

1.  In the first code chunk (pre-made in the document), read in the
    `tidyverse` and `dcData` packages using two `library()` function
    calls.

2.  Create a 2nd R code chunk below the text from 5.2 and place the code
    that reads in the two names data sets (given above).

3.  Delete the rest of the pre-made text and code below and knit the
    document.

1st code chunk

    library(tidyverse)
    library(dcData)

2nd code chunk

    data("BabyNames", package = "dcData")

    BabyNamesSupp <- read_csv("https://github.com/jbpost2/Basics-of-R-for-Data-Science-and-Statistics/raw/master/datasets/BabyNamesSupp.csv")

<hr>

<br>

<a href = "https://jbpost2.github.io/Basics-of-R-for-Data-Science-and-Statistics/CourseFiles.html"><button type="button">Course
Files Page</button></a>