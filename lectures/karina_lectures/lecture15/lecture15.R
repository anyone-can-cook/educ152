### HED 612 Lecture 15

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

# OPEN & EXPLORE DATA


#Use CPS Data 
data("CPSSW8")

##### INTERACTIONS BETWEEN TWO CATEGORICAL VARIABLES

  # SIMPLE REGRESSION/SIMPLE HYPOTHESIS

      #let create a 0/1 education dummy (currently it's 1/2)
      CPSSW8 <- CPSSW8 %>% 
        mutate(morehs  = ifelse(education>12, 1, 0))

      CPSSW8$morehs_fac <- as.factor(CPSSW8$morehs)
      
      # run linear regression 
      mod1 <- lm(earnings ~ morehs_fac, data = CPSSW8)
      summary(mod1, robust = T)
      
 
  # MULTIVARIATE REGRESSION/SIMPLE HYPOTHESIS     
      
      #let create a 0/1 female dummy (currently it's 1/2)
      CPSSW8 <- CPSSW8 %>% 
        mutate(female  = ifelse(gender=="female", 1, 0))
      
      CPSSW8$female_fac <- as.factor(CPSSW8$female)
      
      # run linear regression w control 
      mod2 <- lm(earnings ~ morehs_fac + female_fac, data = CPSSW8)
      summary(mod2, robust = T)      
      
      
  # SEPERATE MODELS BY Z
      
      # novice approach- create seperate df for each group
      cps_women <- CPSSW8%>% filter(gender == "female")   
      cps_men <- CPSSW8 %>% filter(gender == "male")      
      
      # run linear regression for women 
      mod3 <- lm(earnings ~ morehs_fac, data = cps_women)
      summary(mod3, robust = T)
      
      # run linear regression for men 
      mod4 <- lm(earnings ~ morehs_fac, data = cps_men)
      summary(mod4, robust = T)
      
      
  # INTERACTION MODEL
      
      # using R shortcut
      mod5<- lm(earnings ~ morehs_fac + female_fac + morehs_fac:female_fac, data = CPSSW8)
      summary(mod5, robust = T)
      
      
##### INTERACTIONS BETWEEN TWO CONTINUOUS VARIABLES
      
  # SIMPLE REGRESSION/SIMPLE HYPOTHESIS  
      
      mod6 <- lm(earnings ~ education, data = CPSSW8)
      summary(mod6, robust = T)
      
      
  # MULTIVARIATE REGRESSION/SIMPLE HYPOTHESIS  
      
      mod7 <- lm(earnings ~ education + age, data = CPSSW8)
      summary(mod7, robust = T)
      
      
  # INTERACTION MODEL  
      
      mod8 <- lm(earnings ~ education + age + education:age, data = CPSSW8)
      summary(mod8, robust = T)    
      