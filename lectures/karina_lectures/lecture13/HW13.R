### HED 612 HW 13


# LOGISTICS
options(scipen=999)
rm(list = ls(all.names = TRUE))

# load the libraries we will use in this R script
library(tidyverse) 
library(RCurl)
library(AER)


# DOWNLOAD THE ROBUST FUNCTION
# import the function
url_robust <- "https://raw.githubusercontent.com/IsidoreBeautrelet/economictheoryblog/master/robust_summary.R"
eval(parse(text = getURL(url_robust, ssl.verifypeer = FALSE)),
     envir=.GlobalEnv)

# OPEN BOTH DATASETS
data("MASchools")
data("ResumeNames")


#### PART 1

# Q2

    # plot the data first w linear regression line
    MASchools %>% ggplot(aes(x=income, y=score8)) + geom_point()  + 
      stat_smooth(method = "lm")  

    
#Q3
    
  mod1<- lm(score8 ~ log(income), data=MASchools)
  summary(mod1, robust = T)

  
#### PART 2
  
  #Q2
  
    attributes(ResumeNames$ethnicity)
    ResumeNames <- ResumeNames %>% 
      mutate(ethnicityv2  = ifelse(ethnicity=="afam", 1, 0))
    
    ResumeNames$ethnicityv2 <- as.factor(ResumeNames$ethnicityv2)
    
    ResumeNames <- ResumeNames %>% 
      mutate(callv2  = ifelse(call=="yes", 1, 0))
    
    ResumeNames$ethnicityv3 <- as.factor(ResumeNames$callv2)
    
    
#Q3

    mod2<- lm(callv2 ~ ethnicityv2, data=ResumeNames)
    summary(mod2, robust = T)


