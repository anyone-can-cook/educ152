### HED 612 Lecture 6

# LOGISTICS
# install packages
options(scipen=999)



# load the libraries we will use in this R script
library(haven) 
library(tidyverse) 
library(labelled)
library(ggplot2)


# OPEN DATA

  # check current working directory
  getwd() 
  
  #open CA School dataset
  caschool<- read_dta("data/ca/caschool-v2.dta")
  
  #open GSS data [don't need to assign to a df via <- , it's already an R obj]
  load("data/gss/GSS2018.Rdata") #windows: use backslashes (\) if you get error


# HYPOTHESIS TESTING ABOUT POPULATION MEAN
  
  #summary statistics for hours worked
  gss %>% summarise(mean(hrs1, na.rm=TRUE)) 
  gss %>% summarise(sd(hrs1, na.rm=TRUE)) 
  
  summary(gss$hrs1, na.rm=TRUE) 
  
    
  # t-test and p-value
  t.test(gss$hrs1, mu = 40, alternative = "two.sided")
  
  
# HYPOTHESIS TESTING ABOUT POPULATION REGRESSION COEFFICIENT
   
    #run regression
    mod1 <- lm(testscr ~ str, data=caschool)
    summary(mod1)
    
    
# STUDENT EXERCISE
    
    # create district expenditures per thousands
    caschool <- caschool %>%  
      mutate(expn_stu_000 = expn_stu/1000)
    
    mod2 <- lm(testscr ~ expn_stu_000, data=caschool)
    summary(mod2)
    