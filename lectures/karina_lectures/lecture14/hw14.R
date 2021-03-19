### HED 612 Homework 14

# LOGISTICS
# install packages
options(scipen=999)

#install new packages 
#install.packages("AER") #Applied econometrics in R!

# load the libraries we will use in this R script
library(haven) 
library(tidyverse) 
library(labelled)
library(RCurl)
library(AER) 
library(RCurl)
library(AER) # will use for Current Population Survey

# DIRECTORIES

# check current working directory
# this should result in something like the following: "/Users/karinasalazar/Dropbox/hed612"
# if it does not, did you open the R project first?
getwd() 


# DOWNLOAD THE ROBUST FUNCTION
# import the function
url_robust <- "https://raw.githubusercontent.com/IsidoreBeautrelet/economictheoryblog/master/robust_summary.R"
eval(parse(text = getURL(url_robust, ssl.verifypeer = FALSE)),
     envir=.GlobalEnv)


# OPEN CA SCHOOLS
caschool<- read_dta("data/ca/caschool-v2.dta")


# Q2

    #create majority ELL classroom >30% ELL
    caschool <- caschool %>% mutate(
      ell = ifelse(el_pct>=30, 1, 0)
    )
    
    caschool$ell <- as.factor(caschool$ell)
    
    attributes(caschool$testscr)

# Q4
    
    mod1 <- lm(testscr ~ str + ell + str:ell, data = caschool)
    summary(mod1, robust=T)
    
    