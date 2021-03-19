### HED 612 Lecture 13

# LOGISTICS
# install packages
options(scipen=999)

#install new packages 
install.packages("AER") #Applied econometrics in R!

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

#using relative file path to open CA dataset 
caschool<- read_dta("data/ca/caschool-v2.dta")

#Use AER HDMA Data 
data(HMDA)


# LINEAR LOG MODEL
    
      # plot the data first w/o regression line
      caschool %>% ggplot(aes(x=avginc, y=testscr)) + geom_point() 

      # plot the data first w linear regression line
      caschool %>% ggplot(aes(x=avginc, y=testscr)) + geom_point()  + 
        stat_smooth(method = "lm")  
      
      # run linear regression 
      mod1 <- lm(testscr ~ avginc, data = caschool)
      summary(mod1, robust = T)
      
      #run linear-log model regression
      mod2 <- lm(testscr ~ log(avginc), data = caschool)
      summary(mod2, robust = T)
      
      # plot the linear-log model regression
      caschool %>% ggplot(aes(x=avginc, y=testscr)) + geom_point() +
        stat_smooth(method = "lm", formula = y ~ log(x), size = 1) 
  
      #plot both lines!
      caschool %>% ggplot(aes(x=avginc, y=testscr)) + geom_point() +
        stat_smooth(method = "lm", color="red") +
        stat_smooth(method = "lm", formula = y ~ log(x), size = 1) 

# LINEAR PROBABILITY MODEL
      
      # DV, debt payment to income ratio
      attributes(HMDA$deny)
      HMDA %>% count(deny)
      
      #let create a 0/1 deny dummy (currently it's 1/2)
      HMDA <- HMDA %>% 
        mutate(denyv2  = ifelse(deny=="yes", 1, 0))
      
      HMDA %>% count(denyv2, deny)
      
      # LINEAR PROBABILITY MODEL WITH CONTINOUS X
      mod3 <- lm(denyv2 ~ pirat, data=HMDA)
      summary(mod3, robust = T)
      
      # LINEAR PROBABILITY MODEL WITH CATEGORICAL X
      
        #create IV
        attributes(HMDA$afam)
        
        #let create a 0/1 afam dummy (currently it's 1/2)
        HMDA <- HMDA %>% 
          mutate(afamv2  = ifelse(afam=="yes", 1, 0))
      
        HMDA %>% count(afamv2, afam)
        
        #convert to factor
        HMDA$afamv2 <- as.factor(HMDA$afamv2)
        
      #run model
      mod4 <- lm(denyv2 ~ afamv2 + pirat, data=HMDA)
      summary(mod4, robust = T)
      
      