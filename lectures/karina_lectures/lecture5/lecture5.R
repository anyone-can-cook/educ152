### HED 612 Lecture 5

# LOGISTICS
# install packages
#install.packages("margins")
options(scipen=999)



# load the libraries we will use in this R script
library(haven) 
library(tidyverse) 
library(labelled)
library(ggplot2)
library(margins)


# DIRECTORIES

# check current working directory
# this should result in something like the following: "/Users/karinasalazar/Dropbox/hed612"
# if it does not, did you open the R project first?
getwd() 


# OPEN & EXPLORE DATA

#using relative file path to open GSS dataset [don't need to assign to a df, it's already an R obj]
caschool<- read_dta("data/ca/caschool-v2.dta")


#EXPLORE X AND Y

  # Y = district wide math test score
      summary(caschool$math_scr, na.rm=TRUE) #Base R
      
      caschool %>% select(math_scr) %>%  #Tidyverse 
        summarise(across(
          .fns = list(Mean = mean, SD = sd, Min = min, Max =max), na.rm = TRUE ))
      

  # X = district expenditures per student 
      summary(caschool$expn_stu, na.rm=TRUE) #Base R
      
      caschool %>% select(expn_stu) %>%  #Tidyverse 
        summarise(across(
          .fns = list(Mean = mean, SD = sd, Min = min, Max =max), na.rm = TRUE ))
      
      

# CREATE NEW VARIABLE FOR EXPENTIDURES IN $000s
      
      caschool <- caschool %>%  
        mutate(expn_stu_000 = expn_stu/1000)
      
      #checks variable created correctly
      summary(caschool$expn_stu, na.rm=TRUE)
      summary(caschool$expn_stu_000, na.rm=TRUE)
      
      
      
# REGRESS EXPENDITURES ON MATH SCORE (m1)
  
  mod1 <-  lm(math_scr ~ expn_stu_000, data=caschool)
  summary(mod1)

  
  
# REGRESS EXPENDITURES ON READING SCORE (m2)
  
  #student exercise
  mod2 <- lm(read_scr ~ expn_stu_000, data=caschool)
  summary(mod2)
    
# MARGINS AND PREDICTION PACKAGES
  
  summary(mod1)
  margins(mod1) #same as our regression coefficient
  m <- margins(mod1) #save outcome so we can plot
  
  #plot our regression
  cplot(mod1, main = "Predicted District Math Score, Given Expenditures")
  
  #plot our "average" effect of X on Y 
  plot(m)

  #predict values of Y for specific values of X
  predict(mod1,newdata=data.frame(expn_stu_000=5))
  predict(mod1,newdata=data.frame(expn_stu_000=6))
  predict(mod1,newdata=data.frame(expn_stu_000=7))
  predict(mod2,newdata=data.frame(expn_stu_000=11))
  
  
# R SQUARED
  
  #REGRESS STUDENT TEACHER RATIO ON OVERALL TESTSCORES (m3)
  mod3<- lm(testscr ~ str, data=caschool)
  summary(mod3)
  
  mean(caschool$testscr)
  anova(mod3)
  # regression sum of squares =7794
  # sum of squared residuals = 144315
  
    
  # student exercises RQ1; Y=Math Test Scores & X=expenditures
    summary(mod1)
    anova(mod1)
    
  #student exercise RQ2: Y= Math Test Scores & X=Student teacher ratio
    m4 <- lm(math_scr ~ str, data=caschool)
    summary(m4)
    anova(m4)    
    
# STANDARD ERROR OF THE REGRESSION

  #calculating SER
  summary(mod2)
  anova(mod2) #get the sum of squared residuals (SSR)
  nrow(caschool) #get the total number of observations
  
    
  #ser vs st dev
  summary(mod2)
  caschool %>% summarise(mean(read_scr, na.rm=TRUE)) 
  caschool %>% summarise(sd(read_scr, na.rm=TRUE)) 
  