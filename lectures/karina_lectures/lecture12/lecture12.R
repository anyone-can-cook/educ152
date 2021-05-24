### HED 612 Lecture 12 

# LOGISTICS
# install packages
options(scipen=999)

#install new packages 
install.packages("stargazer")

# load the libraries we will use in this R script
library(haven) 
library(tidyverse) 
library(labelled)
library(RCurl)
library(stargazer)


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

#using relative file path to open GSS dataset [don't need to assign to a df, it's already an R obj]
load("data/gss/GSS2018.Rdata")


# EFFECT OF CHANGE IN X1 ON Y DEPENDS ON X1
    
      # plot the data first w/o regression line
      caschool %>% ggplot(aes(x=avginc, y=testscr)) + geom_point() 

      # plot the data first w linear regression line
      caschool %>% ggplot(aes(x=avginc, y=testscr)) + geom_point()  + 
        stat_smooth(method = "lm")  
      
      # run regression w/o polynomial
      mod1 <- lm(testscr ~ avginc, data = caschool)
      summary(mod1, robust = T)
      
      #run regression with polynomial
      mod2 <- lm(testscr ~ avginc + I(avginc^2), data = caschool)
      summary(mod2, robust = T)
      
      # plot the data with the polynomial
      caschool %>% ggplot(aes(x=avginc, y=testscr)) + geom_point() +
        stat_smooth(method = "lm", formula = y ~ x + I(x^2), size = 1) 
  
      #plot both lines!
      caschool %>% ggplot(aes(x=avginc, y=testscr)) + geom_point() +
        stat_smooth(method = "lm", color="red") +
        stat_smooth(method = "lm", formula = y ~ x + I(x^2), size = 1) 

      # use predict to see rate of change at different values of X
        # set up data for prediction
        d1_predict <- data.frame(avginc = c(10, 11))
        d2_predict <- data.frame(avginc = c(40, 41))
        
        # do the prediction
        Y_hat1 <- predict(mod2, newdata = d1_predict)
        Y_hat2 <- predict(mod2, newdata = d2_predict)
        
        # compute the difference
        diff(Y_hat1)
        diff(Y_hat2)