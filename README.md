# Using R Markdown & the Tidyverse to Create Reproducible Research

<a href = "https://jbpost2.github.io/R4Reproducibility/CourseFiles.html"><button type="button">Course Files Page</button></a> 

## Course Summary

R is one of the major platforms for doing statistical analysis and research.  This course introduces the powerful and popular R software through the use of the RStudio IDE.  This course covers the use of the `tidyverse` suite of packages to import raw data (`readr`), do common data manipulations (`dplyr` and `tidyr`), and summarize data numerically (`dplyr`) and graphically (`ggplot2`).  In order to promote reproducibility of analyses, we will discuss how to code using R Markdown - a method of R coding that allows one to easily create PDF and HTML documents that interweave narrative, R code, and results.  

## Packages Required

```
package_list <- c("tidyverse", "GGally", "Lahman", "tinytex", "fivethirtyeight", "haven", "readxl", "DBI")
new_packages <- package_list[!(package_list %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)
```

## Workshop Instructor

<img src = "slides/img/justin_post.jpg" alt = "Justin Post's face from 10 years ago" style = "float:left; width:250px;margin-right:15px"> 

Justin Post is a Teaching Associate Professor and the Director of Online Education in the Department of Statistics at North Carolina State University. Teaching has always been his passion and that is his main role at NCSU. He teaches undergraduate and graduate courses in both face-to-face and distance settings.  Justin is an R enthusiast and has taught many short courses on R, the tidyverse, R shiny, and more.
