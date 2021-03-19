### HED 612 Lecture 7

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

#open CA School dataset
caschool<- read_dta("data/ca/caschool-v2.dta")

#open GSS data [don't need to assign to a df via <- , it's already an R obj]
load("data/gss/GSS2018.Rdata") #windows: use backslashes (\) if you get error



# CONFIDENCE INTERVALS

    mod1 <- lm(testscr ~ avginc, data=caschool)
    summary(mod1)
    confint(mod1, level = 0.95)
    confint(mod1, level = 0.99)

    
# STUDENT EXERCISE
    
    stuex_mod<- lm(testscr ~ str, data=caschool)
    summary(stuex_mod)
    confint(stuex_mod, level = 0.95)
    confint(stuex_mod, level = 0.99)
    
# CREATING NEW VARIABLES IN R
    
    #Step 1: Investigate values and patterns of variable from "input data"
    
      #check labels
      gss %>% select(degree) %>% var_label()
      gss %>% select(degree) %>% val_labels()
      
      #get frequency counts
      gss %>% count(degree) #will also report missing if there any
      gss %>% count(madeg) #example mothers highest degree
      
      #check for missing obs explicitly 
      gss %>% count(is.na(degree)) 
      gss %>% count(is.na(madeg)) 
      
  
    #Step 2: Identifying and cleaning errors or values that need to be changed
      
      #all our missing categories (dk, iap, na) are all NA
      gss %>% select(degree) %>% val_labels()
      gss %>% count(degree) 
      
      #show mothers education missing for explaining (dk, iap, na)
      gss %>% select(madeg) %>% val_labels()
      gss %>% count(madeg) 
      
      
    #Step 3: Creating "analysis" variables
      
      # Create 0/1 dummy for BA+ degree
      gss <- gss %>% 
        mutate(ba_degree= ifelse(degree>=3, 1, 0))
      
    
    # Step 4: Checking values of new var  against values of input var
      gss %>% group_by(ba_degree, degree) %>% count()


      
    # Incorrectly using the assignment operator
      gss <- gss %>% count(degree) #STEP 1, new df= 2 variables and 5 obs
      
      
      gss <- gss %>%  #Step 3 just adds a new variable!
        mutate(ba_degree= ifelse(degree>=3, 1, 0))
      
      
      
      
# INTERPRETING BETA1 WITH CATEGORICAL X
      
  # EXAMPLE 1: 2 CATEGORY/ DUMMY VARIABLE  
      
      # CAVEAT: in order to run regression, our categorical needs to be a factor variable!
      # Karina explain why; show two ways to turn into factor
      
            gss <- gss %>%  # turn to factor after 
              mutate(ba_degree= as.factor(ba_degree))
            
            gss %>% group_by(ba_degree, degree) %>% count() #check it's a factor
  
                     
            gss <- gss %>%  # when we originally create var
              mutate(ba_degree= as.factor(ifelse(degree>=3, 1, 0)))
      
            gss %>% group_by(ba_degree, degree) %>% count() #check it's a factor
            
      # regression Y=income and X= 0/1 with non-college grads as reference category
      mod2 <- lm(realrinc ~ ba_degree, data=gss)
      summary(mod2)
      
      #switch so that college grads are our reference category
      gss<- gss%>% 
        mutate(lower_ba= as.factor(ifelse(degree<3, 1, 0)))

      gss %>% group_by(lower_ba, degree) %>% count()
      
      
      # regression Y=income and X= 0/1 with college grads as reference category
      mod3 <- lm(realrinc ~ lower_ba, data=gss)
      summary(mod3) 
      
    
  # EXAMPLE 2: 2+ CATEGORY VARIABLE
      
    # explore political party variable
      gss %>% select(partyid) %>% var_label()
      gss %>% select(partyid) %>% val_labels()
      
      gss %>% count(partyid) 
    
      #check for missing obs
      gss %>% count(is.na(partyid)) 
      
    
    #create dummies for each political party
    
        #democrats
        gss<- gss%>% 
          mutate(pp_dem= as.factor(ifelse(partyid<=1, 1, 0)))
        
        gss %>% group_by(pp_dem, partyid) %>% count()
        


        #independents
        gss <- gss%>% 
          mutate(pp_ind= as.factor(ifelse(partyid>=2 & partyid<=4, 1, 0)))
        
        gss %>% group_by(pp_ind, partyid) %>% count()
        

        #republicans
        gss <- gss%>% 
          mutate(pp_rep= as.factor(ifelse(partyid>=5 & partyid<=6, 1, 0)))
        
        gss %>% group_by(pp_rep, partyid) %>% count()
        

        #all other categories = unknown category
        gss <- gss%>% 
          mutate(pp_uk= as.factor(ifelse(partyid==7, 1, 0)))
        
        gss %>% group_by(pp_uk, partyid) %>% count()


      
    # regression Y=income and democrats as reference category [excluded]
        mod4 <- lm(realrinc ~ pp_rep + pp_ind + pp_uk, data=gss)
        summary(mod4)   
      
        
        
 # R SHORTCUT FOR CREATING DUMMIES 
        
        #first create categorical variable with all categories
        gss<- gss%>% mutate(
            pp=case_when(
              partyid<=1  ~ 1, #democrats
              partyid>=5 & partyid<=6 ~ 2, #republicans
              partyid>=2 & partyid<=4  ~ 3, #independents
              partyid==7  ~ 4 )) #unkown party
              
        gss %>% group_by(pp, partyid) %>% count()
        
        #Needs to be a factor!
        gss$pp <- as.factor(gss$pp) #turn into a factor after creating
        
        gss<- gss%>% mutate( #or create it as a factor from the start!
          pp=as.factor(case_when(
            partyid<=1  ~ 1, #democrats
            partyid>=5 & partyid<=6 ~ 2, #republicans
            partyid>=2 & partyid<=4  ~ 3, #independents
            partyid==7  ~ 4 ))) #unkown party
        
        gss %>% group_by(pp, partyid) %>% count()
        
        
        # run regression (R will automatically choose lowest val as ref)
        mod5 <- lm(realrinc ~ pp, data=gss)
        summary(mod5)   

        #what if we want to change the reference group?
        gss$pp <- relevel(gss$pp, ref=2)
        summary(lm(realrinc ~ pp, data=gss))
        
        summary(lm(realrinc ~ pp_dem + pp_ind + pp_uk, data=gss))
        
    
    
    
    
    