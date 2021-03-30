---
title: "EDUC 152: Introduction to Quantitative Research in Education"
author: "Patricia Martín"
urlcolor: blue
output: 
  html_document:
    toc: true
    toc_depth: 2
    toc_float: true # toc_float option to float the table of contents to the left of the main document content. floating table of contents will always be visible even when the document is scrolled
      #collapsed: false # collapsed (defaults to TRUE) controls whether the TOC appears with only the top-level (e.g., H2) headers. If collapsed initially, the TOC is automatically expanded inline when necessary
      #smooth_scroll: true # smooth_scroll (defaults to TRUE) controls whether page scrolls are animated when TOC items are navigated to via mouse clicks
    number_sections: true
    fig_caption: true # ? this option doesn't seem to be working for figure inserted below outside of r code chunk    
    highlight: tango # Supported styles include "default", "tango", "pygments", "kate", "monochrome", "espresso", "zenburn", and "haddock" (specify null to prevent syntax    
    theme: default # theme specifies the Bootstrap theme to use for the page. Valid themes include default, cerulean, journal, flatly, readable, spacelab, united, cosmo, lumen, paper, sandstone, simplex, and yeti.
    df_print: tibble #options: default, tibble, paged
    keep_md: true # may be helpful for storing on github
    
---

# Introduction to R  

R is a language and environment for statistical programming and visualization. The R language is similar to S which was designed in the 80s and created by John Chambers. It is part of the [GNU project](http://www.gnu.org/), a free software or operating system that respects users' freedom. R was created by Robert Gentleman and Ross Ihaka and since 1997 consists of the _R Core Team_ who write access to the R source.  

*Credit: [R-project](https://www.r-project.org/about.html), [R Language Definition](https://cran.r-project.org/doc/manuals/r-release/R-lang.pdf)*  



> "To use R, we’ll need to download two software packages: **Base-R**, and **RStudio**. Base-R is the basic software which contains the R programming language. RStudio is software that makes R programming easier. Of course, they are totally free and open source."  

![](images/base-r.png){width=80%}

*Credit: [Installing Base-R and RStudio](https://bookdown.org/ndphillips/YaRrr/installing-base-r-and-rstudio.html) YaRrr! The Pirate's Guide to R*

## R script  

- You can write your code in RStudio using an R script which has a .R extension or you can write your code using an R Markdown file which has a .Rmd extension. In this class we will predominantly use R Markdown for lectures and problem sets (homeworks). 
    - The benefits of using [R Markdown](https://github.com/rstudio/cheatsheets/raw/master/rmarkdown-2.0.pdf) is that users can embed code in their text. This lets users create high quality documents, reports, presentations, etc.  
    - Let's practice opening an R script. In the far left corner click on the File tab and then select New file and then R Script  

<br>
       ![](images/r-script.png) 

- A hashtag `#` in R has a special meaning. If you use a `#` in an R script it will not be evaluated as code. In other words, R will ignore whatever is followed by the hashtag.  
    - It is important to note that a hashtag in R Markdown has a different meaning. If you want to include a `#` in your code, make sure it is done in a code chunk. 

## RStudio user interface    
![](images/panels.png)
<br>  

1. The source pane is where your code goes. You can think of this pane as a working document where you can create and edit your scripts.  
1. The environment pane displays all of the data objects from your current R session. This can include vectors, matrices, and dataframes.  
1. The console pane is where your code is evaluated. The greater than sign `>` is a prompt that lets you know that R is ready to evaluate new code.  
1. The files, packages, help, and plots panel provides you with a lot of information.  
    - You can set the working directory and/or navigate to other directories using the files tab.  
    - The plots tab allows you to view your plots.
    - In the packages tab you are able to view a list of packages installed and/or identify if they are currently loaded.  
    - The help tab lets you search for R functions. You can type the name of the function in the search window or type a question mark `?` followed by the name of the function in the console.  


*Credit: [The Four RStudio Windows](https://bookdown.org/ndphillips/YaRrr/the-four-rstudio-windows.html) YaRrr! The Pirate's Guide to R*  

- R Markdown outputs  
    - There are various R Markdown outputs which include html, pdf, word document, and [many more](https://bookdown.org/yihui/rmarkdown/output-formats.html).  

- R code chunks  
    - R code chunks are where you write your code  
    - You can insert a code chunk with the keyboard shortcut (cmd + option + i)  
    - Alternatively you can insert a code chunk by clicking on the `+`c insert tab and then click on the R.  
    ![](images/code-chunk.png)

# R practice

<br>  

**Simple arithmetic**  

- You can perform simple math operations using these symbols `+, -, *, /, ()`

```r
1 + 2  #addition
```

```
## [1] 3
```

```r
3 * 4  #multiplication
```

```
## [1] 12
```

```r
1 + 2 / 3 * 4 
```

```
## [1] 3.666667
```

```r
1 + 2 / (3 * 4) # What is the difference here?  
```

```
## [1] 1.166667
```

<br>  

**Working with objects**  

- R stores information in "objects"  
- You can assign an object using `<-` or `=`   
- Objects are organized by type or class (we will discuss this in more detail in class).

```r
1 + 3
```

```
## [1] 4
```

```r
x = 1  
d <- 4 # I prefer this method

p <- 1 + 3

p <- "Daniela"
```

<br>  

## Vectors 

- A fundamental object in R is a "vector".  
- There are two types of vectors, atomic and lists, but for the purpose of this walkthrough we will briefly review the most common atomic vectors you will encounter (logical, integer, double, and character).   

- This is a logical vector or what others refer to as a boolean (TRUE, FALSE, NA).

```r
logical <- c(TRUE, FALSE, FALSE) #logical vector
typeof(logical)
```

```
## [1] "logical"
```

```r
logical
```

```
## [1]  TRUE FALSE FALSE
```

```r
TRUE == 1
```

```
## [1] TRUE
```

```r
FALSE == 1
```

```
## [1] FALSE
```

```r
FALSE == 0
```

```
## [1] TRUE
```
  
- This is a double vector which is a subset of a numeric vector. R makes double vectors the default.  

```r
doub <- c(3.5, -2, 4) #double vector
typeof(doub)
```

```
## [1] "double"
```

```r
doub
```

```
## [1]  3.5 -2.0  4.0
```
  
- This is an integer vector which is a subset of a numeric vector. Don't worry about the difference between a double and integer vector. Just keep in mind that doubles are approximations.   

```r
int <- c(1L, 3L, 2L) #integer vector
typeof(int)
```

```
## [1] "integer"
```

```r
int
```

```
## [1] 1 3 2
```
  
- This is a character vector. Each element of a character vector is a string. Notice how each string is enclosed with a parenthesis. 

```r
char <- c("a", "b", "c") #character vector
typeof(char)
```

```
## [1] "character"
```

```r
char
```

```
## [1] "a" "b" "c"
```

**Exercise** 


- Take a few minutes to practice creating vectors.  
- Create a character vector of the names of people in your immediate family.  
- Now create a numeric vector of the ages of people in your immediate family.  

*Credit: [The Very Basics](https://rstudio-education.github.io/hopr/basics.html) Hands-On Programming with R, [Vector basics](https://r4ds.had.co.nz/vectors.html) R for Data Science*  

<br>  

## Packages  

> "Many of R’s most useful functions do not come preloaded when you start R, but reside in packages that can be installed on top of R. R packages are similar to libraries in C, C++, and Javascript, packages in Python, and gems in Ruby. An R package bundles together useful functions, help files, and data sets. You can use these functions within your own R code once you load the package they live in."  

- To use a package, you have to install it first and then load it in R.  
- You only have to install a package once, but you may have to update a package periodically.  
- To install a package, use the following R function `install.packages("package name")`  


```r
#install.packages("tidyverse")
```

- While you only have to install a package once, you have to load a package in your R session every time.  
- To load a package in R use the following R function `library(package name)`  


```r
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.3.2     ✓ purrr   0.3.4
## ✓ tibble  3.0.4     ✓ dplyr   1.0.2
## ✓ tidyr   1.1.2     ✓ stringr 1.4.0
## ✓ readr   1.3.1     ✓ forcats 0.5.0
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```


*Credit: [Appendix B: R Packages](https://rstudio-education.github.io/hopr/packages2.html#packages2) Hands-On Programming with R*  

<br>  

## Data in R

**Loading R data**  

- It is common for packages to come with data. For example the  `dplyr` package includes the `starwars` data set (as a tibble) which comes from the [Star Wars API](https://swapi.dev/).  
- You can load a data set by typing it's name (ex. `starwars`)


```r
#dplyr::starwars  
starwars
```

```
## # A tibble: 87 x 14
##    name  height  mass hair_color skin_color eye_color birth_year sex   gender
##    <chr>  <int> <dbl> <chr>      <chr>      <chr>          <dbl> <chr> <chr> 
##  1 Luke…    172    77 blond      fair       blue            19   male  mascu…
##  2 C-3PO    167    75 <NA>       gold       yellow         112   none  mascu…
##  3 R2-D2     96    32 <NA>       white, bl… red             33   none  mascu…
##  4 Dart…    202   136 none       white      yellow          41.9 male  mascu…
##  5 Leia…    150    49 brown      light      brown           19   fema… femin…
##  6 Owen…    178   120 brown, gr… light      blue            52   male  mascu…
##  7 Beru…    165    75 brown      light      blue            47   fema… femin…
##  8 R5-D4     97    32 <NA>       white, red red             NA   none  mascu…
##  9 Bigg…    183    84 black      light      brown           24   male  mascu…
## 10 Obi-…    182    77 auburn, w… fair       blue-gray       57   male  mascu…
## # … with 77 more rows, and 5 more variables: homeworld <chr>, species <chr>,
## #   films <list>, vehicles <list>, starships <list>
```
 
- To save the data set in your environment as an object, make sure to assign it `<-` and give it a name.  


```r
p_data <- starwars
```

*Credit: [Tidyverse webpage](https://tidyverse.tidyverse.org/)*

<br>  

**Loading other data**  

- We will be working with various data sets in this class.  
- R data sets are stored in `.RData` files.  
- To load a `.RData` file you need to use the `load()` function.  
- Notice the `url()` function below. We use the `url()` function below because we are loading a `.RData` file from the web.  


```r
load(url("https://github.com/ozanj/rclass/raw/master/data/recruiting/recruit_school_somevars.RData"))
```
  
*Credit: [.RData files](https://bookdown.org/ndphillips/YaRrr/rdata-files.html ) YaRrr! The Pirate's Guide to R*

<br>  

**Data frames and tibbles**  

> "A data frame is a rectangular collection of variables (in the columns) and observations (in the rows)" from ([The mpg dataframe](https://r4ds.had.co.nz/data-visualisation.html))  

- We will be working with a variant of a data frame called a `tibble`.   
- Tibbles are essentially data frames, but have been updated a little bit to make them easier to work with.  

```r
typeof(df_school)  
```

```
## [1] "list"
```

```r
class(df_school)
```

```
## [1] "tbl_df"     "tbl"        "data.frame"
```
  
- The main differences between a `data.frame` and a `tibble` are the printing and subsetting properties.  
    - A tibble shows you the first 10 rows when you print.  
    - You can extract by name or position using `$` or `[[]]`
    

```r
head(df_school$name)  
head(df_school[[4]])
```

**Quick data investigations**  

- The `glimpse()` functions allows you to see the number of rows (observations) and columns (variables) in the data frame/tibble. This function will print the columns and a few observations. 

```r
glimpse(df_school)
```

```
## Rows: 21,301
## Columns: 26
## $ state_code         <chr> "AK", "AK", "AK", "AK", "AK", "AK", "AK", "AK", "A…
## $ school_type        <chr> "public", "public", "public", "public", "public", …
## $ ncessch            <chr> "020000100208", "020000100211", "020000100212", "0…
## $ name               <chr> "Bethel Regional High School", "Ayagina'ar Elitnau…
## $ address            <chr> "1006 Ron Edwards Memorial Dr", "106 Village Road"…
## $ city               <chr> "Bethel", "Kongiganak", "Kwigillingok", "Toksook B…
## $ zip_code           <chr> "99559", "99559", "99622", "99637", "99554", "9958…
## $ pct_white          <dbl> 11.7764, 0.0000, 0.0000, 0.0000, 2.5210, 0.0000, 0…
## $ pct_black          <dbl> 0.5988, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.…
## $ pct_hispanic       <dbl> 1.5968, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.…
## $ pct_asian          <dbl> 0.9980, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.…
## $ pct_amerindian     <dbl> 84.6307, 99.4505, 100.0000, 100.0000, 97.4790, 100…
## $ pct_other          <dbl> 0.3992, 0.5495, 0.0000, 0.0000, 0.0000, 0.0000, 0.…
## $ num_fr_lunch       <dbl> 362, 182, 116, 187, 238, 180, 418, 185, 179, 186, …
## $ total_students     <dbl> 501, 182, 120, 201, 238, 231, 428, 262, 179, 186, …
## $ num_took_math      <dbl> 146, 17, 14, 30, 28, 25, 62, 21, 23, 19, 42, 24, 4…
## $ num_prof_math      <dbl> 24.82, 1.70, 3.50, 3.00, 2.80, 2.50, 1.55, 2.10, 2…
## $ num_took_rla       <dbl> 147, 17, 14, 30, 28, 24, 62, 22, 23, 19, 42, 24, 4…
## $ num_prof_rla       <dbl> 24.99, 1.70, 3.50, 3.00, 2.80, 2.40, 1.55, 2.20, 2…
## $ avgmedian_inc_2564 <dbl> 76160.0, 76160.0, NA, 57656.5, 37552.5, 49219.0, 3…
## $ visits_by_110635   <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
## $ visits_by_126614   <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
## $ visits_by_100751   <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
## $ inst_110635        <chr> "CA", "CA", "CA", "CA", "CA", "CA", "CA", "CA", "C…
## $ inst_126614        <chr> "CO", "CO", "CO", "CO", "CO", "CO", "CO", "CO", "C…
## $ inst_100751        <chr> "AL", "AL", "AL", "AL", "AL", "AL", "AL", "AL", "A…
```
  
- `View()` function will open your data frame/tibble in a new tab.  

```r
View(df_school)
```
 
- `names()` function will print out all the names (variable names)in the data frame/tibble

```r
names(df_school)
```

```
##  [1] "state_code"         "school_type"        "ncessch"           
##  [4] "name"               "address"            "city"              
##  [7] "zip_code"           "pct_white"          "pct_black"         
## [10] "pct_hispanic"       "pct_asian"          "pct_amerindian"    
## [13] "pct_other"          "num_fr_lunch"       "total_students"    
## [16] "num_took_math"      "num_prof_math"      "num_took_rla"      
## [19] "num_prof_rla"       "avgmedian_inc_2564" "visits_by_110635"  
## [22] "visits_by_126614"   "visits_by_100751"   "inst_110635"       
## [25] "inst_126614"        "inst_100751"
```
  
- `head()` and `tail()` functions will print out the first 6 observations or the last six observations in your data frame/tibble.  

```r
head(df_school)  
```

```
## # A tibble: 6 x 26
##   state_code school_type ncessch name  address city  zip_code pct_white
##   <chr>      <chr>       <chr>   <chr> <chr>   <chr> <chr>        <dbl>
## 1 AK         public      020000… Beth… 1006 R… Beth… 99559        11.8 
## 2 AK         public      020000… Ayag… 106 Vi… Kong… 99559         0   
## 3 AK         public      020000… Kwig… 108 Vi… Kwig… 99622         0   
## 4 AK         public      020000… Nels… 118 Vi… Toks… 99637         0   
## 5 AK         public      020000… Alak… 9 Scho… Alak… 99554         2.52
## 6 AK         public      020000… Emmo… Genera… Emmo… 99581         0   
## # … with 18 more variables: pct_black <dbl>, pct_hispanic <dbl>,
## #   pct_asian <dbl>, pct_amerindian <dbl>, pct_other <dbl>, num_fr_lunch <dbl>,
## #   total_students <dbl>, num_took_math <dbl>, num_prof_math <dbl>,
## #   num_took_rla <dbl>, num_prof_rla <dbl>, avgmedian_inc_2564 <dbl>,
## #   visits_by_110635 <int>, visits_by_126614 <int>, visits_by_100751 <int>,
## #   inst_110635 <chr>, inst_126614 <chr>, inst_100751 <chr>
```

```r
tail(df_school)
```

```
## # A tibble: 6 x 26
##   state_code school_type ncessch name  address city  zip_code pct_white
##   <chr>      <chr>       <chr>   <chr> <chr>   <chr> <chr>        <dbl>
## 1 WY         public      560583… Jack… 1910 W… Jack… 83001         70.2
## 2 WY         public      560609… Upto… 610 Po… Upton 82730         96.4
## 3 WY         public      560624… Worl… 801 So… Worl… 82401         75  
## 4 WY         public      568025… Sain… 128 Mi… St. … 82524          0  
## 5 WY         private     A03034… JOUR… 700 CO… JACK… 83001         83.6
## 6 WY         private     A09038… JACK… PO BOX… JACK… 83002         97.6
## # … with 18 more variables: pct_black <dbl>, pct_hispanic <dbl>,
## #   pct_asian <dbl>, pct_amerindian <dbl>, pct_other <dbl>, num_fr_lunch <dbl>,
## #   total_students <dbl>, num_took_math <dbl>, num_prof_math <dbl>,
## #   num_took_rla <dbl>, num_prof_rla <dbl>, avgmedian_inc_2564 <dbl>,
## #   visits_by_110635 <int>, visits_by_126614 <int>, visits_by_100751 <int>,
## #   inst_110635 <chr>, inst_126614 <chr>, inst_100751 <chr>
```

# Pipes 

**What are "pipes", %>%**

- **Pipes** are a means of performing multiple steps in a single line of code

  - When writing code, the pipe symbol is `%>%`
  - The pipe operator `%>%` is created by the **magrittr** package, which is not part of base R
  - However, the magrittr package is automatically loaded when you load the tidyverse package


```r
?magrittr::`%>%`
```

- pipe syntax: `LHS %>% RHS`
  
- `LHS` (refers to "left hand side" of the pipe) is an object or function 
- `RHS` (refers to "right hand side" of the pipe) is a function

**How pipes work:**

- Object created by `LHS` becomes the first argument of the function (`RHS`) to the right of the `%>%` pipe symbol 
- Basic code flow: `object %>% function1 %>% function2 %>% function3`    
- Output of `some_function1` becomes the input (the first argument) of the function `some_function2` to the right of the `%>%` pipe symbol 

Example of using pipes to calculate mean value of atomic vector

```r
1:10 # an atomic vector
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

```r
mean(1:10) # calculate mean without pipes
```

```
## [1] 5.5
```

```r
1:10 %>% mean() # calculate mean with pipes
```

```
## [1] 5.5
```
- no pipe: (1) write function; (2) data object `1:10` is 1st argument of `mean()`
- pipe: (1) write data object; (2) "pipe" (verb) object as 1st argument of `mean()` 


**Intuitive mnemonic device for understanding pipes**

- whenever you see a pipe `%>%` think of the words "__and then...__"


Example: isolate all the first-generation prospects [output omitted]

- in words: start with object `df_school` __and then__ filter for public schools 

```r
df_school %>% filter(school_type == "public") %>% head()
```
    
below code in words:

- start with `df_school` __and then__ select a few vars __and then__ filter __and then__ sort  __and then__ investigate structure of object

```r
df_school %>% select(name, school_type, state_code, avgmedian_inc_2564) %>% 
  filter(school_type == "public", state_code == "CA") %>% 
  arrange(desc(avgmedian_inc_2564)) %>% str()
```

```
## tibble [1,404 × 4] (S3: tbl_df/tbl/data.frame)
##  $ name              : chr [1:1404] "Los Altos High" "Miramonte High" "Palisades Charter High" "Saratoga High" ...
##  $ school_type       : chr [1:1404] "public" "public" "public" "public" ...
##  $ state_code        : chr [1:1404] "CA" "CA" "CA" "CA" ...
##  $ avgmedian_inc_2564: num [1:1404] 250001 235445 223967 222879 222879 ...
```

*Credit: [Enter the tidyverse: pipes and dplyr](https://anyone-can-cook.github.io/rclass1/lectures/enter_the_tidyverse/enter_the_tidyverse.pdf) EDUC 260A - Introduction to Programming & Data Management*

<br>

# Resources  

- [R for Data Science](https://r4ds.had.co.nz/)  
- [YaRrr! The Pirate's Guide to R](https://bookdown.org/ndphillips/YaRrr/)  
- [Hands-On Programming with R](https://rstudio-education.github.io/hopr/)   
- [R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/)  
- [EDUC 260A - Introduction to Programming & Data Management in R](https://anyone-can-cook.github.io/rclass1/)
- [EDUC 260B - Introduction to Programming using R](https://anyone-can-cook.github.io/rclass2/)
