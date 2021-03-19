### HED 612 Homework 10

# LOGISTICS
# install packages
options(scipen=999)



# load the libraries we will use in this R script
library(haven) 
library(tidyverse) 
library(labelled)



# DIRECTORIES

# check current working directory
# this should result in something like the following: "/Users/karinasalazar/Dropbox/hed612"
# if it does not, did you open the R project first?
getwd() 


# OPEN & EXPLORE DATA

#using relative file path to open CA dataset 
caschool<- read_dta("data/ca/caschool-v2.dta")


# SIMPLE VS MULTIVARIATE REGRESSION

  #simple regression
  mod1 <- lm(read_scr ~ str, data=caschool)
  summary(mod1)
  
  #multivariate regression
  mod2 <- lm(read_scr ~ str + el_pct, data=caschool)
  summary(mod2)
  
# INTEPRETING CONTINUOUS & CATEGORICAL X
  
  #create majority ELL classroom >50% ELL
  caschool <- caschool %>% mutate(
    ell = ifelse(el_pct>=50, 1, 0)
  )
  
  
  #check variable 
  caschool %>% filter(el_pct>=50) %>% count() 
  caschool %>% count(ell)
  
  caschool$ell <- as.factor(caschool$ell)
  
  #model with STR as main ind var of interest
  mod3 <- lm(read_scr ~ str + ell + avginc, data=caschool)
  summary(mod3)
  
  #model with ELL as main ind var of interest
  mod4 <- lm(read_scr ~ ell + str + avginc, data=caschool)
  summary(mod4)
  
  