### HED 612 HW 12


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

caschool<- read_dta("data/ca/caschool-v2.dta")


# Q2
  
  #without linear prediction line 
  caschool %>% ggplot(aes(x=calw_pct, y=math_scr)) + geom_point()
  
  
  #with linear prediction line
  caschool %>% ggplot(aes(x=calw_pct, y=math_scr)) + geom_point() +
    stat_smooth(method = "lm", color="red")

# Q4
  
    mod1 <- lm(math_scr ~ calw_pct + I(calw_pct^2), data = caschool)
    summary(mod1, robust = T)
    
    
# Q5
    
    # use predict to see rate of change at different values of X
    # set up data for prediction
    d1_predict <- data.frame(calw_pct = c(9, 10))
    d2_predict <- data.frame(calw_pct = c(30, 31))
    
    # do the prediction
    Y_hat1 <- predict(mod1, newdata = d1_predict)
    Y_hat2 <- predict(mod1, newdata = d2_predict)
    
    # compute the difference
    diff(Y_hat1)
    diff(Y_hat2)
    
  