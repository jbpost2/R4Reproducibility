Exercises 7 - Creating Variables
================

We’ll continue to work on the same .Rmd file from the previous exercise.

<hr>

## 7.1 Create a New Variable

1.  Write a brief note using Markdown syntax that mentions we’ll be
    investigating the name George in more detail and that we’ll be
    creating a new variable that represents the change year to year.

2.  Use the `BabyNamesFull` data object and filter the data to only
    contain observations where `sex` is `M` and the name is `George`.

3.  Create a new variable using `mutate()` that is the difference from
    year to year for the `count` variable. This can be done using the
    `lag()` function via `count-lag(count)`. Call this variable `diff`.

<hr>

<br>

<a href = "https://jbpost2.github.io/Basics-of-R-for-Data-Science-and-Statistics/CourseFiles.html"><button type="button">Course
Files Page</button></a>