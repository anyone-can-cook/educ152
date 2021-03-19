### HED 612 Lecture 3

# LOGISTICS

  # install packages
  #install.packages("labelled")
  options(scipen=999)
  

  
  # load the libraries we will use in this R script
  library(haven) 
  library(tidyverse) 
  library(labelled)
  library(ggplot2)
  

# DIRECTORIES

  # check current working directory
  # this should result in something like the following: "/Users/karinasalazar/Dropbox/hed612"
  # if it does not, did you open the R project first?
  getwd() 


# OPEN & EXPLORE DATA

  #using relative file path to open GSS dataset [don't need to assign to a df, it's already an R obj]
  load("data/gss/GSS2018.Rdata") #windows: use backslashes (\) if you get error

  #print column names and attributes(variables)
  colnames(gss)
  gss %>% var_label()
  
  gss %>% select(income16, hrs1, race, sex) %>% val_labels()
  
  #Income is Categorical: let's change to continuous by taking the "median" of each category range
    
    #step 1: convert labelled into a factor
    gss <- gss %>% mutate(income16_fac = factor(income16))
  
    #step 2: covert factor income var into continuous var by taking median of range
    gss <- gss %>%  
      mutate(incomev2 = 
               recode(income16_fac,
                      "1" =500, "2" = 1500, "3" = 2500, "4" =3500, "5" = 5500,
                      "6" = 3500, "7" = 7500, "8" = 9000,"9" = 11250, "10" =13750,
                      "11" = 16250,"12" = 18750, "13" = 21250, "14" = 23750, "15" = 17500,
                      "16" = 32500,"17" = 37500, "18" = 45000, "19" =55000, "20" = 67500,
                      "21" = 82500, "22" = 100000,"23" = 120000,"24" = 140000, "25" =160000,
                      "26" = 170000,
                      .default= 0
                    )
              )
  
  #check that new var is continuous
  gss %>% summarise(mean(incomev2, na.rm=TRUE)) 
  
  #list first 10/20 obs of income and hrs
  gss %>% filter(!is.na(incomev2) & !is.na(hrs1)) %>%
    select(hrs1, incomev2) %>% head(10)
  
  gss %>% filter(!is.na(incomev2) & !is.na(hrs1)) %>%
    select(hrs1, incomev2) %>% head(20)

  
# HYPOTHESIS TESTING ABOUT THE POPULATION MEAN 
  
  #mean income
  gss %>% summarise(mean(incomev2, na.rm = TRUE)) 
  
  # 1-sample t-test [written in Base R; tidyverse way is too complex]
  t.test(gss$incomev2, mu = 20000, alternative = "two.sided")
  
  #2-sample t-test [written in Base R; tidyverse way is too complex]
  t.test(gss$sex, gss$incomev2,  alternative = "two.sided")
  
  
# SCATTER PLOTS

    
    # Basic scatter plot (filter for respondents identifying as Black)
    gss %>% filter(race==2) %>% 
      ggplot(aes(x=hrs1, y=incomev2)) + geom_point()

    # Basic scatter plot (filter for respondents identifying as Black) + prediction line
    gss %>% filter(race==2) %>% 
      ggplot(aes(x=hrs1, y=incomev2)) + geom_point() + stat_smooth(method = "lm")
    
    
    
# COVARIANCE
    
    #covariance between income + hours
    gss %>% summarise(cov(hrs1, incomev2, use = "complete.obs")) #tidyverse
    cov(gss$hrs1, gss$incomev2, use = "complete.obs") #baseR
    
    
# CORRELATION
    
    #correlation between income + hours
    gss %>% summarise(cor(hrs1, incomev2, use = "complete.obs")) #tidyverse
    cor(gss$hrs1, gss$incomev2, use = "complete.obs") #baseR
    
    
    #correlation between income + age
    gss %>% summarise(cor(age, incomev2, use = "complete.obs")) #tidyverse
    cor(gss$age, gss$incomev2, use = "complete.obs") #baseR
    
        #non-linear relationship?
        gss %>% filter(race==3) %>% 
          ggplot(aes(x=age, y=incomev2)) + geom_point()
        
        #how about for those likely in the labor force (not retired)?
        gss %>% filter(race==3 & age<50) %>% 
          ggplot(aes(x=age, y=incomev2)) + geom_point() + stat_smooth(method = "lm")
    
        
# RANDOM ASSIGNMENT
        
    #generate new variable with random values
    gss$randomvar <- sample(1000, size = nrow(gss), replace = TRUE)
    summary(gss$randomvar, na.rm=TRUE) #[we will all get diff results]
    
    #run correlation [we will all get diff results]
    gss %>% summarise(cor(randomvar, incomev2, use = "complete.obs")) #tidyverse
    cor(gss$randomvar, gss$incomev2, use = "complete.obs") #baseR
        
    
    
# CLASS EXERCISE     
    
    
    
    
    
    
    
    