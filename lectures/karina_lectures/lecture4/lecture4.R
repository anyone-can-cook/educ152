### HED 612 Lecture 4

# LOGISTICS
options(scipen=999)


# load the libraries we will use in this R script
library(haven) 
library(tidyverse) 
library(labelled)
library(ggplot2)


# DIRECTORIES

# check current working directory
# this should result in something like the following: "/Users/karinasalazar/Dropbox/hed612"
# if it does not, did you open the R project first?
getwd() 


# OPEN & EXPLORE DATA

#using relative file path to open CAschool dataset [need to assign it as a df bc it's not an R obj]
caschool <- read_dta("data/ca/caschool-v2.dta")


#using relative file path to open GSS dataset [don't need to assign to a df, it's already an R obj]
load("data/gss/GSS2018.Rdata") #windows: use backslashes (\) if you get error


# SHOW SCATTER PLOT FOR TEST SCORES AND DISTRICT AVG INCOME

  caschool %>%  ggplot(aes(x=testscr, y=avginc)) + geom_point()
  
  caschool %>%  ggplot(aes(x=testscr, y=avginc)) + geom_point()+ stat_smooth(method = "lm")

  caschool %>%  ggplot(aes(x=testscr, y=avginc)) + geom_point() + stat_smooth(method = "lm", formula = y ~ x + I(x^2), size = 1)
  
  
# REGRESS INCOME ON HRS
  
  #attributes for income
  gss %>% select(realrinc) %>% var_label() #check the variable label
  gss %>% summarise(mean(realrinc, na.rm = TRUE)) 
  
  # Run a OLS linear regression prediction line (lm= linear model) 
  # Syntax: lm(DEPENDENT Y VARIABLE ~ INDEPENDENT X VARIABLE)
  # Save results of regression into an object called mod1
  mod1 <-  lm(realrinc ~ hrs1, data=gss)
  
  #print results of mod1
  summary(mod1)
  

# CLASS EXERCISE : REGRESS INCOME ON AGE
  
