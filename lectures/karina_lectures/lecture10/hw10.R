### HED 612 Problem Set 10


# LOGISTICS
# install packages
options(scipen=999)



# load the libraries we will use in this R script
library(haven) 
library(tidyverse) 
library(labelled)


# check current working directory
getwd() 

#open ELS School dataset
els<- read_dta("data/els/els-stu-by-f2-select-vars.dta")


#Q2

    #explore dependent variable
    els %>% select(bytxrstd) %>% var_label()
    els %>% select(bytxrstd) %>% val_labels()

    #count missing
    els %>% filter(bytxrstd==-8) %>% count()   

    #create dependent variable with true NA
    els <- els %>% 
      mutate(read_testscr  = ifelse(bytxrstd==-8, NA, bytxrstd))

    #check new dependent variable   
    els %>% filter(is.na(read_testscr)) %>% count()   
    
#Q3
    # explore independent variable 
    els %>% filter(byhmwrk<0) %>% count()
    els %>% filter(is.na(byhmwrk)) %>% count()

    els %>% filter(byhmwrk>96) %>% count()

    #create new variable
    els <- els %>% 
      mutate(hw_hours = recode(as.integer(byhmwrk),
                               `-9` = NA_integer_,
                               `-8` = NA_integer_,
                               `-4` = NA_integer_,
                               `97`= 26L,
                               `98` = 21L,
                               `99` = 26L) )
    
    
    #check new var
    els %>% filter(byhmwrk>96)  %>% count(hw_hours)
    els %>% count(byhmwrk, hw_hours) %>% print(n=100)
    
#Q4
    
    #create X2
    attributes(els$f1stlang)
    els %>% count(f1stlang)
    els$f1stlang_fac <- as.factor(els$f1stlang)
    
    
#Q5
    
    #create X3
    attributes(els$ f1ses1)
    els %>% count(f1ses1)
    els <- els %>% 
      mutate(f1ses1_v2  = ifelse(f1ses1==-8, NA, f1ses1))
    
    
#Q6    
    mod1 <- lm(read_testscr ~ hw_hours, data=els)
    summary(mod1)

  
#Q7    
    
    mod2 <- lm(read_testscr ~ hw_hours + f1stlang_fac + f1ses1_v2, data=els)
    summary(mod2)
    