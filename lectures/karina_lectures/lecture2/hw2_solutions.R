### HED 612 HW 2

# load the libraries we will use in this R script
library(haven)
library(tidyverse) 

# DIRECTORIES

  # check current working directory
  getwd() 


#Q1

  #using relative file path to open CA dataset
  caschool<- read_dta("data/ca/caschool-v2.dta") #windows: use backslashes (\) if you get error


#Q2

  #subset to the first 10 obs
  caschool <- caschool[1:5,]
  

#Q3 
  
  #view observations of computer
  caschool['computer']


#Q7
  
  #check your work-mean
  caschool %>% summarise(mean(computer, na.rm = TRUE)) 
    
    # rounding, option 1 via dataframe object
    caschool %>% summarise(mean(computer, na.rm = TRUE)) %>% as.data.frame()

    # rounding, option 2 via save as tibble object and view it
    q3 <- caschool %>% summarise(mean(computer, na.rm = TRUE))
    View(q3)
    
    
  #check your work-mean
  caschool %>% summarise(sd(computer, na.rm=TRUE))