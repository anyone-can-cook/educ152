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

      #using relative file path to open ELS dataset 
      els<- read_dta("data/els/els-stu-by-f2-select-vars.dta")
      
      
# CREATING VARIABLES
      
  #investigate Y first, ever attended college
      
      # investigate variable and value labels
      els %>% select(f2evratt) %>% var_label() 
      els %>% select(f2evratt) %>% val_labels() #it has labels and missing values!
      
      # how many obs in each category (including missing)?
      els %>% count(f2evratt) 
      
      # check missing explicitly
      els %>% count(is.na(f2evratt)) #all false because missing are currently coded as -8, not true NA
      
      # create dummy variable via ifelse()
      
      #first fix missing (-8) in input variable to true missing in our version 2 var
      els <- els %>% 
        mutate(college= 
                 ifelse(f2evratt< -3, NA, f2evratt))
      
      els <- els %>% 
        mutate(college= 
                 ifelse(f2evratt== -3, 0, f2evratt))
      
      #check our work
      els %>% count(college,f2evratt) 
      
      
      
  #investigate X categorical, extracurricular participation
      
      els %>% select(byxtracu) %>% var_label()
      els %>% select(byxtracu) %>% val_labels() 
  
      
      els <- els %>% 
        mutate(excurr  = as.factor(recode(byxtracu,
                                          `-9` = NA_real_,
                                          `-8` = NA_real_,
                                          `-4` = NA_real_,
                                          `0` = 0,
                                          `1` = 1,
                                          `2` = 1,
                                          `3` = 1,
                                          `4` = 1,
                                          `5` = 1,
                                          `6` = 1,
                                          `7` = 1,
                                          `8` = 1 )))
      
      els %>% group_by(excurr, byxtracu) %>% count()
      
      
  #investigate X continuous, homework hours
      
      els %>% select(byhmwrk) %>% var_label()
      els %>% select(byhmwrk) %>% val_labels()
      
      
      #create new variable
      els <- els %>% 
        mutate(hw_hours = recode(as.integer(byhmwrk),
                                 `-9` = NA_integer_,
                                 `-8` = NA_integer_,
                                 `-4` = NA_integer_,
                                 `97`= 26L,
                                 `98` = 21L,
                                 `99` = 26L) )
      
      
# RUN LINEAR PROBABILITY MODEL
      
      
      # LPM with Continuous X = hw_hours
      mod1 <- lm(college ~ hw_hours, data=els)
      summary(mod1, robust = T)
      
      
      # LPM with Categorical X = extracurricular participation
      mod2 <- lm(college ~ excurr + hw_hours, data=els)
      summary(mod2, robust = T)
      
      
      
# CREATING PUBLICATION REGRESSION TABLES
      
    #Example 1: Reg Table with ONE Model
      
      # save robust standard errors
      robust_se_m1 <- as.vector(summary(mod1,robust = T)$coefficients[,"Std. Error"])
      
      # print stargazer output with robust standard errors
      stargazer(mod1,type = "text",se = list(robust_se_m1), out="lectures/lecture12/regtable1.txt") #text
      stargazer(mod1,type = "html",se = list(robust_se_m1), out="lectures/lecture12/regtable1.html") # copy and paste HTML for word
      
    # Example 2: Reg Model with multiple models
      
      # save robust standard errors
      robust_se_m2 <- as.vector(summary(mod2,robust = T)$coefficients[,"Std. Error"])
      
      
      # print stargazer output with both models + robust standard errors
      stargazer(mod1, mod2, se=list(robust_se_m1, robust_se_m2), type = "text", out="lectures/lecture12/regtable2.txt")
      stargazer(mod1, mod2, se=list(robust_se_m1, robust_se_m2), type = "html", out="lectures/lecture12/regtable2.html")
      
      
      # print stargazer output with both models + robust standard errors (PLUS FANCY EDITING)
      stargazer(mod1, mod2, se=list(robust_se_m1, robust_se_m2), title="Table 1: OLS Regression Results", dep.var.labels=c("Attend College","Attend College"),
                covariate.labels=c("Extracurricular","Hours on HW"),
                omit.stat=c("f"),
                column.labels=c("Model 1: Simple","Model 2: Multivariate"), align=TRUE, type="html", out="lectures/lecture12/regtable3.html")
      
      
      
