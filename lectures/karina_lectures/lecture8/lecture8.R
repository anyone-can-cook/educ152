### HED 612 Lecture 8

# LOGISTICS
# install packages
options(scipen=999)



# load the libraries we will use in this R script
library(haven) 
library(tidyverse) 
library(labelled)
library(ggplot2)


# OPEN DATA

  # check current working directory
  getwd() 

  #open ELS dataset
  els<- read_dta("data/els/els-stu-by-f2-select-vars.dta")
  
  #open GSS data [don't need to assign to a df via <- , it's already an R obj]
  load("data/gss/GSS2018.Rdata") #windows: use backslashes (\) if you get error
  

# SE OF BETA

  # Income=Y and Hours Worked per Week=X
  mod1 <- lm(realrinc ~ hrs1, data=gss)
  summary(mod1)

  
# CREATING VARIABLES
  
  #investigate X first
      
      # investigate variable and value labels
      els %>% select(f1ses1qu) %>% var_label() 
      els %>% select(f1ses1qu) %>% val_labels() #it has labels and missing values!
      
      # how many obs in each category (including missing)?
      els %>% count(f1ses1qu) 

      # check missing explicitly
      els %>% count(is.na(f1ses1qu)) #all false because missing are currently coded as -8, not true NA
      
  # create dummy variable via ifelse()
      
      #first fix missing (-8) in input variable to true missing in our version 2 var
      els <- els %>% 
        mutate(f1ses1qu_v2= 
                 ifelse(f1ses1qu==-8, NA, f1ses1qu))
      
      #check our work
      els %>% count(f1ses1qu_v2)
      els %>% count(f1ses1qu_v2,f1ses1qu) 
      
      
      #now we can create our new dummy!
      els <- els %>% 
        mutate(ses_high= 
                 ifelse(f1ses1qu_v2>=3, 1, 0))
      
      #check our work
      els %>% count(ses_high)
      els %>% count(ses_high, f1ses1qu) 
      els %>% group_by(ses_high, f1ses1qu) %>% count() #same as above
      
  
  # create simple new variable similar to original via recode()
      
      # Using mutate+recode for "simple" new variable (advanced R users can use .default)
      els <- els %>% 
        mutate(sesquart = as.factor(recode(f1ses1qu,
                                 `1` = 1,
                                 `2` = 2,
                                 `3` = 3,
                                 `4` = 4,
                                 `-8` = NA_real_)))
      
      
      #check our work
      els %>% group_by(sesquart, f1ses1qu) %>% count()
      
      
  #create complex new variable that incorporates two original variables via case_when()
      
      #explore race variable
      
          # investigate variable and value labels
          els %>% select(f1race) %>% var_label() 
          els %>% select(f1race) %>% val_labels() #it has labels  but no missing (negative vals)
          
          # how many obs in each category?
          els %>% count(f1race) 
          
          # check missing
          els %>% count(is.na(f1race)) 
          
      # create complex variable via case_when, using the f1ses1qu_v2 because i know missing values are already corrected
        els <- els %>% mutate(ses_race = as.factor(case_when(
              f1ses1qu_v2<=2 & f1race==7 ~ 0, #reference group, White respondents in lowest quartiles (1,2)
              f1ses1qu_v2>2 & f1race==7 ~ 1, #non-reference group, White respondents in high quartiles (3,4)
              f1ses1qu_v2<=2 & f1race<7 ~ 2, #non-reference group, POC respondents in low quartiles (1,2)
              f1ses1qu_v2>2 & f1race<7 ~ 3))) #non-reference group, POC respondents in high quartiles (3,4)

        
      #check work  
        els %>% group_by(ses_race, f1ses1qu, f1race) %>% count() #ugh cuts off my rows!
        els %>% group_by(ses_race, f1ses1qu, f1race) %>% count()  %>% print(n=100)
        

        
# INTERPRETING CATEGORICAL X
  
    #fix missing values in our dependent variable [same as in HW]
        els %>% summarise(mean(bytxrstd, na.rm=TRUE)) 
        els %>% summarise(sd(bytxrstd, na.rm=TRUE)) 
        
        summary(els$bytxrstd, na.rm=TRUE) 
        
        els <- els %>% 
          mutate(read_testscr  = ifelse(bytxrstd==-8, NA, bytxrstd))
  
    # regression Y=reading test scores, X= SES quartiles  where lowest SES= ref group, 2/3/4 SES= non-reference groups
        mod2 <- lm(read_testscr ~ sesquart, data=els) #automatically dropped sesquat=1 bc its the lowest
        summary(mod2)
        
    
        
# DATA FOR FINAL PROJECTS        
        
        #hsls- 2009 (first year) df=hsls_09_school, N=944 with 687 vars
        load("data/hsls/HSLS_09_school.Rdata")
      
        
        #hsls- 2016 (last update) df=hsls_16_student, N=23,503 with 8509vars
        load("data/hsls/HSLS_16_student.Rdata")

        
        #list variables
        ls(hsls_09_school)
        
        
        