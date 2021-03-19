### HED 612 HOMEWORK 3

# LOGISTICS
# install packages
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

#using relative file path to open GSS dataset [don't need to assign to a df, it's already an R obj]
load("data/gss/GSS2018.Rdata") #windows: use backslashes (\) if you get error



# Q2
  mean(gss$realrinc, na.rm=TRUE)
  mean(gss$sei10, na.rm = TRUE)

# Q4
  gss %>% ggplot(aes(x=realrinc, y=sei10)) + geom_point()

# Q5
  gss %>% filter(realrinc<150000) %>% ggplot(aes(x=realrinc, y=sei10)) + geom_point() +  stat_smooth(method = "lm")

# Q7
  gss %>% summarise(cor(realrinc, sei10, use = "complete.obs")) 

# Q8
  gss %>% filter(realrinc<150000) %>% summarise(cor(realrinc, sei10, use = "complete.obs")) #tidyverse







