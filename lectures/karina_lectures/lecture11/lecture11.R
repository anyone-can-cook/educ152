### HED 612 Lecture 11

# LOGISTICS

    # turn off scientific notation
    options(scipen=999)
    
    #install new packages 
     #install.packages("RCurl") #we'll use this to calculate robust standard errors

    # load the libraries we will use in this R script
    library(haven) 
    library(tidyverse) 
    library(labelled)
    library(RCurl)

   # import the robust SE function 
   url_robust <- "https://raw.githubusercontent.com/IsidoreBeautrelet/economictheoryblog/master/robust_summary.R"
   eval(parse(text = getURL(url_robust, ssl.verifypeer = FALSE)),
        envir=.GlobalEnv) 
 
# DIRECTORIES

    # check current working directory
    # this should result in something like the following: "/Users/karinasalazar/Dropbox/hed612"
    # if it does not, did you open the R project first?
    getwd() 


# OPEN DATA WE WILL USE TODAY

    #using relative file path to open CA dataset 
    caschool<- read_dta("data/ca/caschool-v2.dta")
    


# HETEROSKEDASTIC STANDARD ERRORS/"ROBUST STANDARD ERRORS"

    #simple regression with homoskedastic standard errors
    mod1 <- lm(math_scr ~ str, data=caschool)
    summary(mod1)
    
    #lets look graphically
    caschool %>%  
      ggplot(aes(x=str, y=math_scr)) + geom_point() + stat_smooth(method = "lm")
    
    #simple regression with robust standard errors
    summary(mod1, robust = TRUE)
    
    
# MULTIVARIATE REGRESSION 
    
    # create categorical ELL variable
    caschool <- caschool %>% 
      mutate(ell_cat  = as.factor(ifelse(el_pct>50, 2, 1))) %>%
      mutate(ell_cat  = as.factor(ifelse(el_pct<21, 0, ell_cat)))
    
        #check new var against old
        caschool %>% filter(el_pct>50) %>% count() 
        caschool %>% filter(el_pct>=21 & el_pct<=50) %>% count() 
        caschool %>% filter(el_pct<21) %>% count() 
        
        caschool %>% count(ell_cat) 
    
    
    # create district expenditures per thousands
    caschool <- caschool %>%  
      mutate(expn_stu_000 = expn_stu/1000)
    
    # multivariate regression with homoskedastic standard errors
    mod2 <- lm(read_scr ~ str + ell_cat + expn_stu_000, data=caschool)
    summary(mod2, robust = TRUE)
    
    
# COLLINEARITY
    
    #create variable that measures percent NON-ELL
    caschool <- caschool %>%
              mutate(non_el_pct = 100 - el_pct)
    
    #correlation
    caschool %>% summarise(cor(el_pct, non_el_pct, use = "complete.obs"))
    

    #Run regression to see collinearity output
    mod3 <- lm(read_scr ~ str + non_el_pct + el_pct + expn_stu_000, data=caschool)
    summary(mod3)
    
    
        
        
        
        