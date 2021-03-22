################################################################################
##
## [ PROJ ] < Create analysis dataset from College Scorecard for EDUC152 teaching purposes # >
## [ FILE ] < read_scorecard_data.R >
## [ AUTH ] < Ozan Jaqeutte / ozanj >
## [ INIT ] < 3/19/2021 >
##
################################################################################

## ---------------------------
## libraries
## ---------------------------

library(tidyverse)
library(rscorecard)

## ---------------------------
## directory paths
## ---------------------------

#data_dir <- file.path('.','data','college_scorecard')
data_dir <- file.path('.','..','college_scorecard')
data_dir
list.files(path = data_dir)

# all data
all_file <- 'CollegeScorecard_Raw_Data_01192021'

all_url <- str_c('https://ed-public-download.app.cloud.gov/downloads/',all_file,'.zip')
all_url

all_zipfile <- file.path(data_dir, str_c(all_file, '.zip'))
all_zipfile

download.file(url = all_url, destfile = all_zipfile)

# most recent year, institution-level
recent_inst_file <- 'most-recent-cohorts-all-data-elements_01192021'

recent_inst_url <- str_c('https://data.ed.gov/dataset/9dc70e6b-8426-4d71-b9d5-70ce6094a3f4/resource/823ac095-bdfc-41b0-b508-4e8fc3110082/download/',recent_inst_file,'.zip')
recent_inst_url

recent_inst_zipfile <- file.path(data_dir, str_c(recent_inst_file, '.zip'))
recent_inst_zipfile

download.file(url = recent_inst_url, destfile = recent_inst_zipfile)
unzip(zipfile = recent_inst_zipfile, exdir = data_dir)


df_recent_inst <- read_csv(file = file.path(data_dir, str_c('Most-Recent-Cohorts-All-Data-Elements','.csv')))
df_recent_inst






  if (!file.exists(data_zipfile)) {
    writeLines(str_c('Downloading file: ', data_zipfile, ' & Unzipping file: ', data_unzipped))
    download.file(url = data_url, destfile = data_zipfile)
    unzip(zipfile = data_zipfile, exdir = dir_name)
  } else if (!file.exists(data_unzipped)) {
    writeLines(str_c('Unzipping file: ', data_unzipped))
    unzip(zipfile = data_zipfile, exdir = dir_name)
  } else {
    writeLines(str_c('Already have files: ', data_zipfile, ' & ', data_unzipped))
  }





# most recent year, institution-field-level
recent_field_url <- 'https://data.ed.gov/dataset/9dc70e6b-8426-4d71-b9d5-70ce6094a3f4/resource/ff68afc4-6d23-459d-9f60-4006e4f85583/download'
recent_field_file <- 'most-recent-cohorts-field-of-study_01192021'

data_zipfile <- file.path(data_dir, str_c(file_name, file_suffix, '.zip'))





download.file(url = data_url, destfile = data_zipfile)






# R scorecard data documentation:
  # https://collegescorecard.ed.gov/data/documentation/
  
## -----------------------------------------------------------------------------
## Read scorecard data using functions from rscorecard package
## -----------------------------------------------------------------------------

# Functions in rscorecard package

  # sc_dict	Search data dictionary.
  # sc_filter	Filter scorecard data by variable values.
  # sc_filter_	Filter scorecard data by variable values.
  # sc_get	Get scorecard data.
  # sc_init	Initialize chained request.
  # sc_key	Store Data.gov API key in system environment.
  # sc_select	Select scorecard data variables.
  # sc_select_	Select scorecard data variables.
  # sc_year	Select scorecard data year.
  # sc_zip	Subset results to those within specified area around zip code.

# Store data.gov API key
  # incorrect url for api signup: https://api.census.gov/data/key_signup.html
  # correct api signup form: https://api.data.gov/signup/ 
  # this key works too: bd4mMFkVwruvZZAvEeiMbcvyRg5Uj2MDAhtbibSJ
  sc_key('22gLR3V4UcSapOcgPs2fU4ifVq9aumD9iIEEkfGL')



# sample request

df <- sc_init() %>% 
    sc_filter(control == 1) %>% 
    sc_select(unitid, instnm, stabbr) %>% 
    sc_year(2013) %>% 
    sc_zip(37203, 50) %>%
    sc_get()
df

sc_init() %>% 
    sc_filter(region == 2, ccbasic == c(21,22,23), locale == 41:43) %>% 
    sc_select(unitid, instnm, stabbr) %>% sc_year("latest") %>%
  str()

df <- sc_init() %>% 
    sc_filter(region == 2, ccbasic == c(21,22,23), locale == 41:43) %>% 
    sc_select(unitid, instnm, stabbr) %>% sc_year("latest") %>% 
    sc_get()

sc_dict("control")
## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
