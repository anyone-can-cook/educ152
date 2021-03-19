### HED 612 HW 4

# LOGISTICS
# install packages
options(scipen=999)



# load the libraries we will use in this R script
library(haven) 
library(tidyverse) 
library(labelled)
library(ggplot2)


# Q1

    # check current working directory
    getwd() 
    
    #open CA School dataset
    caschool<- read_dta("data/ca/caschool-v2.dta")


#Q2
    
    #summary stats for dependent variable
    summary(caschool$testscr)

    #summary stats for independent variable
    summary(caschool$str)
    
    
# Q3
    
    # plot of x= str, y= testscr
    caschool %>% ggplot(aes(x= str, y= testscr)) + geom_point()

    
# Q6
    
    #save results of regression into an object called mod1
    mod1 <-  lm(testscr ~ str, data=caschool)

    #print regressionresults
    summary(mod1)
