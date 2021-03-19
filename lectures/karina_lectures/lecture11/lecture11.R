### HED 612 Lecture 11

# LOGISTICS
# install packages
options(scipen=999)

#install new packages 
#install.packages("RCurl") #we'll use this to calculate robust standard errors
#install.packages("stargazer")

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


# HETEROSKEDASTIC STANDARD ERRORS or "ROBUST STANDARD ERRORS"

    #simple regression with homoskedastic standard errors
    mod1 <- lm(math_scr ~ str, data=caschool)
    summary(mod1)
    
    #lets look graphically
    caschool %>%  
      ggplot(aes(x=str, y=math_scr)) + geom_point() + stat_smooth(method = "lm")
    
    #simple regression with robust standard errors
    summary(mod1, robust = TRUE)

# CREATING PUBLICATION REGRESSION TABLES
  
  #Example 1: Reg Table with ONE Model
    
    # save robust standard errors
    robust_se_m1 <- as.vector(summary(mod1,robust = T)$coefficients[,"Std. Error"])
    
    # print stargazer output with robust standard errors
    stargazer(mod1,type = "text",se = list(robust_se_m1), out="lectures/lecture11/regtable1.txt") #text
    stargazer(mod1,type = "html",se = list(robust_se_m1), out="lectures/lecture11/regtable1.html") # copy and paste HTML for word
    
  # Example 2: Reg Model with multiple models
    
    #run the second model with covariates
    mod2 <- lm(math_scr ~ str + el_pct + avginc + expn_stu, data=caschool)
    summary(mod2, robust= T)
    
    # save robust standard errors
    robust_se_m2 <- as.vector(summary(mod2,robust = T)$coefficients[,"Std. Error"])
    
    # print stargazer output with both models + robust standard errors
    stargazer(mod1, mod2, se=list(robust_se_m1, robust_se_m2), title="Table 1: OLS Regression Results", dep.var.labels=c("Math Score","Math Score"),
              covariate.labels=c("Student-Teacher Ratio","% ELL",
                                 "District Income","Expenditures Per Student"),
              omit.stat=c("f"),
              column.labels=c("Model 1: Simple","Model 2: Multivariate"), align=TRUE, type="html", out="lectures/lecture11/regtable2.html")
    
    
    
    
    