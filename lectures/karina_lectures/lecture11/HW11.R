### HED 612 HW 11


# LOGISTICS
options(scipen=999)
rm(list = ls(all.names = TRUE))

# load the libraries we will use in this R script
library(haven) 
library(tidyverse) 
library(labelled)
library(RCurl)


# DOWNLOAD THE ROBUST FUNCTION
# import the function
url_robust <- "https://raw.githubusercontent.com/IsidoreBeautrelet/economictheoryblog/master/robust_summary.R"
eval(parse(text = getURL(url_robust, ssl.verifypeer = FALSE)),
     envir=.GlobalEnv)

# check current working directory
getwd() 

#open ELS School dataset
els<- read_dta("data/els/els-stu-by-f2-select-vars.dta")


#############################

#DATA CLEANING

  #explore DV - Number of Colleges Applied To
  attributes(els$f2napp1p)

  #count missing obs in DV
  els %>% filter(f2napp1p<0) %>% count()   
  els %>% count(f2napp1p)

  #create DV with true NA
  els <- els %>% 
    mutate(num_coll_apps  = ifelse(f2napp1p<0, NA, f2napp1p))

  #check new DV 
  summary(els$num_coll_apps, na.rm=TRUE)
  
  #explore IV - Mother's Level of Education
  attributes(els$f1mothed)
  
  #count missing obs in IV
  els %>% filter(f1mothed<0) %>% count()   

  #create new IV with  1 = Where Mother's ed level is Less than HS, student is first-gen
  els <- els %>% 
    mutate(first_gen  = ifelse(f1mothed<3, 1, 0))
  
  #check new IV 
 els %>% count(els$first_gen, f1mothed)
  
 # Turn into factor
 els$first_gen <- as.factor(els$first_gen)
  
 #clean up control variables
 #investigate, clean, and check variable on "how far in school student thinks they'll get"
 attributes(els$f1stexp)
 els <- els %>% 
   mutate(student_motivation  = ifelse(f1stexp<0, NA, f1stexp))
 els %>% count(els$student_motivation, f1stexp)
 # Turn into factor
 els$student_motivation <- as.factor(els$student_motivation)
 
 
 #investigate, clean, and check variable SES quartile variable
 attributes(els$f1ses1qu) 
 els <- els %>% 
   mutate(ses_quartile= 
            ifelse(f1ses1qu==-8, NA, f1ses1qu))
  els %>% count(ses_quartile, f1ses1qu)
  els$ses_quartile <- as.factor(els$ses_quartile)
  
 ######################################
  
  #REGRESSIONS 
  
  mod1 <- lm(num_coll_apps ~ first_gen, data=els)
  summary(mod1, robust = T)
  
  mod2 <- lm(num_coll_apps ~ first_gen + ses_quartile, data=els)
  summary(mod2, robust = T)
  
  mod3 <- lm(num_coll_apps ~ first_gen + student_motivation + ses_quartile, data=els)
  summary(mod3, robust = T)
  

 
 
 
 