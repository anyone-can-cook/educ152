### HED 612 Lecture 14

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


# SIMPLE REGRESSION/SIMPLE HYPOTHESIS
    
      # plot the data first w/o regression line
      CPSSW8 %>% ggplot(aes(x=education, y=earnings)) + geom_point() 

      # plot the data first w linear regression line
      CPSSW8 %>% ggplot(aes(x=education, y=earnings)) + geom_point() + 
        stat_smooth(method = "lm")  
      
      # run linear regression 
      mod1 <- lm(earnings ~ education, data = CPSSW8)
      summary(mod1, robust = T)
      

# MULTIVARIATE REGRESSION/SIMPLE HYPOTHESIS     
      
      #let create a 0/1 female dummy (currently it's 1/2)
      CPSSW8 <- CPSSW8 %>% 
        mutate(female  = ifelse(gender=="female", 1, 0))
      
      CPSSW8$female_fac <- as.factor(CPSSW8$female)
      
      # run linear regression w control 
      mod2 <- lm(earnings ~ education + female_fac, data = CPSSW8)
      summary(mod2, robust = T)
      
# PLOT DIFFERENT EFFECTS BY Z
      
      #take a smaller sample so we can see patterns more effectively
      set.seed(1) # sets random number generator seed to ensure consistent results
      CPSSW8_v2 <- sample_n(CPSSW8, 613)
      
      
      #plot just men
      CPSSW8_v2 %>% filter(gender=="male") %>%
        ggplot(aes(x=education, y=earnings)) + geom_point() + 
        stat_smooth(method = "lm")
      
      #plot just women
      CPSSW8_v2 %>% filter(gender=="female") %>%
        ggplot(aes(x=education, y=earnings)) + geom_point() + 
        stat_smooth(method = "lm")
      
      #plot both
      CPSSW8_v2 %>% ggplot(aes(x=education, y=earnings, colour=gender)) + 
        geom_point() +
        geom_smooth(method="lm")
      
      
      
# SEPERATE MODELS BY Z
      
      # novice approach- create seperate df for each group
      cps_women <- CPSSW8_v2 %>% filter(gender == "female")   
      cps_men <- CPSSW8_v2 %>% filter(gender == "male")      
      
      # run linear regression for women 
      mod3 <- lm(earnings ~ education, data = cps_women)
      summary(mod3, robust = T)
      
      # run linear regression for women 
      mod4 <- lm(earnings ~ education, data = cps_men)
      summary(mod4, robust = T)
      
      
# INTERACTION MODEL
      
      #create interaction variable yourself [need to use non-factor var]
      CPSSW8_v2$int_schgen <- CPSSW8_v2$education*CPSSW8_v2$female
      
      # run with created var
      mod5<- lm(earnings ~ education + female_fac + int_schgen, data = CPSSW8_v2)
      summary(mod5, robust = T)
      
      # R shortcut
      mod6<- lm(earnings ~ education + female_fac + education:female_fac, data = CPSSW8_v2)
      summary(mod6, robust = T)
      
      
      