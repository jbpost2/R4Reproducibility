Exercises 6 - dplyr
================

We’ll continue to work on the same .Rmd file from the previous exercise.

<hr>

# 6.1 Fix the BabyNameSupp Data

Edit your code chunk that reads the data in from a csv file and add the
argument `col_types = cols(sex = col_character())` to the `read_csv()`
code.

# 6.2 Combining Data Sets with `dplyr::bind_rows()`

1.  Write a quick note below your last R code chunk that mentions that
    we are going to combine the two data sets into one.

2.  Use the `bind_rows()` function from `dplyr` to combine `BabyNames` &
    `BabyNamesSupp` via `bind_rows(BabyNames, BabyNamesSupp)` into an
    object called `BabyNamesFull`.

<hr>

# 6.3 Filter and Arrange Rows

-   Filter the `BabyNamesFull` data to include only the names we are
    interested in (Hint: use `%in%`). Just have this print out to the
    console.

-   Continue the previous code to then reorder the rows descending on
    the `count` variable.

<hr>

<br>

<a href = "https://jbpost2.github.io/Basics-of-R-for-Data-Science-and-Statistics/CourseFiles.html"><button type="button">Course
Files Page</button></a>