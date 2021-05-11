################################################################################
##
## [ PROJ ] < Create analysis dataset from ELS BY to PETS # >
## [ FILE ] < read_els_by_pets.R >
## [ AUTH ] < Ozan Jaqeutte / ozanj >
## [ INIT ] < 5/11/2021 >
##
################################################################################

## ---------------------------
## libraries
## ---------------------------

options(max.print=99)
library(tidyverse)
library(haven)
library(labelled)

#library(questionr) # don't think we need this one
  #install.packages('questionr') # if you haven't installed already
    # I could not install package questionr because package 'htmltools' was out of date; 
      # I hade difficulty installing package html tools; worked when I opened R not in an R project
      #install.packages('htmltools') # C:\Users\ozanj\AppData\Local\Temp\Rtmpc1kAUo\downloaded_packages
    # I could not install/load package questionr because package rlang was out of date



## ---------------------------
## directory paths
## ---------------------------

# comment these outs because students will read directly from url of 
#input_data_dir <- file.path('.','data','els','input_data')
#input_data_dir
#list.files(path = input_data_dir)

#output_data_dir <- file.path('.','data','els','output_data')
#output_data_dir
#list.files(path = output_data_dir)

## ---------------------------
## Read els data from Stata
## ---------------------------

#els_02_12_byf1sch_v1_0.dta # high school-level data
#els_02_12_byf3pststu_v1_0.dta # core student-level data
#els_02_12_f2inst_v1_0.dta # PSI institution-level data, follow-up 2
#els_02_12_f3inst_v1_0.dta # PSI institution-level data, follow-up 3


# url of stata dataset stored on Dropbox
  els_stu_url <- 'https://www.dropbox.com/s/y3b7bsobq43cokb/els_02_12_byf3pststu_v1_0.dta?dl=1'


# read in data 
  df_els_stu_all <- read_dta(
    file= file.path(els_stu_url),
    encoding = NULL,
    col_select = NULL,
    skip = 0,
    n_max = Inf,
    .name_repair = "unique"
  )
  #file= file.path(input_data_dir,'els_02_12_byf3pststu_v1_0.dta'),

# replace upper case variable names with lower case variable names
  names(df_els_stu_all) <- tolower(names(df_els_stu_all))

  
# Look for variables based on variable names and variable labels
  lookfor(data=df_els_stu_all, 'real',labels = TRUE, ignore.case = TRUE, details = TRUE)
  lookfor(data=df_els_stu_all, 'ps1start',labels = TRUE, ignore.case = TRUE, details = TRUE)
  
  
# create vector of variable names to keep, and create upper case and lower case versions of this vector  
  keepvars <- c('stu_id','sch_id','strat_id','psu','f3univ','g10cohrt','f1pared','byincome','bystexp','byparasp','bytxstat','bypqstat','bytxmstd',
                'bytxrstd','bysctrl','byurban','byregion','byfcomp','bysibhom','f1sex','f1race','f1stlang','f1homlng','f1mothed','f1fathed','f1ses1',
                'f1ses1qu','f1stexp','f1txmstd','f1rgpp2','f1s24cc','f1s24bc','f2everdo','f2dostat','f2c25a','f2c30a',
                'F3HSSTAT','F3HSCPDR',
                'F3EVRATT','F3EDSTAT','F3PS1START','F3PS1LVL','F3PS1CTR','F3PS1SEC','F3PS1SLC','F3PS1OUT','F3PS1RETAIN','F3PSTIMING',
                'f3tztranresp','f3tzcoverage',
                'f3tzrectrans','f3tzreqtrans','f3tzschtotal','f3tzps1sec','f3tzps1slc','f3tzps1start','f3tzhs2ps1',
                'f3tzever2yr','f3tzever4yr','f3tzremtot','f3tzrempass','f3tzremengps','f3tzrementot','f3tzremmthps','f3tzremmttot',
                'f3tzanydegre','f3tzhighdeg','F3TZCERT1DT','F3TZCRT1CIP2','F3TZASOC1DT','F3TZASC1CIP2','f3tzbach1dt','f3tzbch1cip2',
                'f3stloanamt','f3stloanevr','f3stloanpay','F3ERN2011')
              # drop these vars cuz suppressed "f3tzps1ctr"   "f3tzps1lvl" ;
  

  keepvars_lower <- tolower(keepvars)
  keepvars_lower
  
  keepvars_upper <- toupper(keepvars)
  keepvars_upper

# create dataset with subset of variables

df_els_stu <- df_els_stu_all %>%
  select(keepvars_lower) %>%
  # keep students who:
    # completed by, f1, f2, and f3 surveys [f3univ]
    # ever attended postsecondary education as of f3 [f3evratt]
    # received hs diploma with known date, or received GED [f3hsstat]
    # hs completion date known [f3hscpdr]
  filter(f3univ=='1111', f3evratt ==1, f3hsstat %in% c(1,2,3,6), !(f3hscpdr %in% c(-9,-3))) %>%
  # keep students whose enrollment in first postsecondary institution started same year of hs graduation or after hs graduation or year of first postsecondary institution unkown 
    # (i.e, drop students who enrolled in first postsecondary institution prior to high school graduation year) 
      #df_els_stu %>% filter(f3ps1start<f3hscpdr & f3ps1start !=-9) %>% count(f3ps1start)
      #df_els_stu %>% filter(f3ps1start<f3hscpdr & f3ps1start !=-9) %>% count(f3hscpdr)
  filter(f3ps1start>=f3hscpdr | f3ps1start ==-9) %>%
  # keep students whose first self-reported postsecondary institution is not a 4yr public or 4yr private non-profit or missing
  filter(!(f3ps1sec %in% c(-9,1,2))) %>% 
  # keep students whose first postsecondary institution based on transcript data is not a 4yr public or 4yr private non-profit or missing
  filter(!(f3tzps1sec %in% c(-9,1,2))) %>% 
  # keep students who reported attending postsecondary education and who are "transcript respondents" [f3tztranresp]
  filter(f3tztranresp==1) %>%
  # keep if f3tzanydegre is not missing []
  filter(f3tzanydegre!=-9)

#df_els_stu %>% count(f3tzanydegre)
#df_els_stu %>% count(f3tzhighdeg)

#df_els_stu %>% count(f3tzasc1cip2)

#df_els_stu %>% count(f3ern2011) %>% print(n=99)

mean(df_els_stu$f3ern2011)



df_els_stu %>% var_label()






                       

# save file to disk
save(df_els_stu, file = file.path(output_data_dir, 'els_stu.RData'))

#opening data

#load(file = file.path(star_dir, 'star_panel_data.RData'))

#load(file = url('https://github.com/anyone-can-cook/educ152/raw/main/data/star/star_panel_data.RData'))

#############
#############

# potential outcome vars
  # earnings
  # debt
  # total loans

# potential indepenent vars
  # internship (sophomore year)
  # institutional control
  # highest degree
  # 

# potential samples
  # people with an MA





## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
