### HED 612 Lecture 2

"
Date: 01/20/2021
Author: Karina
"

# LOGISTICS
  
  #install packages needed to read Stata datasets
  #install.packages("haven")
  #install.packages("tidyverse") #let me know if you get errors
  #install.packages("labelled") #let me know if you get errors

  # load the libraries we will use in this R script
  library(haven) 
  library(tidyverse) 
  library(labelled)

  
# DIRECTORIES
  
  # check current working directory
  # this should result in something like the following: "/Users/karinasalazar/Dropbox/HED612_S21"
  # if it does not, did you open the R project first?
  getwd() 
  
  
# OPEN DATA
  
  # using relative file path to open CA dataset [the entire class can use this]
  caschool <- read_dta("data/ca/caschool-v2.dta") #windows: use backslashes (\) if you get error

  # using absolute file path to open CA dataset [you will get an error unless this is individualized to your computer]
  caschool <- read_dta("/Users/karinasalazar/Dropbox/HED612 Linear Regression/data/ca/caschool-v2.dta") #windows: use backslashes (\) if you get error


  
# SUMMARY STATISTICS
  
  # getting to know the dataset
  caschool %>% colnames() # look at the variables
  
  caschool %>% select(enrl_tot, computer, read_scr) %>% var_label()
  
  
  #central tendency: summary stats
  caschool %>% summarise(mean(enrl_tot, na.rm=TRUE))
  caschool %>% summarise(sd(enrl_tot, na.rm=TRUE))
  
  
# SUBSETTING 
  
  #this subsets the df to 5 obs
  caschool <- caschool[1:5,]
  
  
