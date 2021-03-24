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
#library(rscorecard)

## ---------------------------
## directory paths
## ---------------------------


#data_dir <- file.path('.','..','college_scorecard')
#data_dir
#list.files(path = data_dir)

input_data_dir <- file.path('.','data','college_scorecard','input_data')
input_data_dir
list.files(path = input_data_dir)

output_data_dir <- file.path('.','data','college_scorecard','output_data')
output_data_dir
list.files(path = output_data_dir)

## ---------------------------
## create a function to download scorecard data
## ---------------------------

download_scorecard <- function(url, zip_file_name, unzip_file_name, file_date, file_extension) {

  # create objects for: url; path and name of zip-file; path and name of unzipped file  
  data_url <- str_c(url,zip_file_name,file_date,'.zip')
  writeLines(str_c('data_url object = ',data_url))
  
  data_zipfile <- file.path(input_data_dir, str_c(zip_file_name, file_date, '.zip'))
  writeLines(str_c('data_zipfile object = ',data_zipfile))
  
  data_unzipped <- file.path(input_data_dir, str_c(unzip_file_name,file_extension))
  writeLines(str_c('data_unzipped object = ',data_unzipped))
  
  # download and unzip file [if necessary]
  if (!file.exists(data_zipfile)) {
    writeLines(str_c('Downloading file: ', data_zipfile, ' & Unzipping file: ', data_unzipped))
    download.file(url = data_url, destfile = data_zipfile)
    unzip(zipfile = data_zipfile, exdir = input_data_dir)
  } else if (!file.exists(data_unzipped)) {
    writeLines(str_c('Unzipping file: ', data_unzipped))
    unzip(zipfile = data_zipfile, exdir = input_data_dir)
  } else {
    writeLines(str_c('Already have files: ', data_zipfile, ' & ', data_unzipped))
  }
  
}

# Most recent institution-level data

  inst_url <- 'https://data.ed.gov/dataset/9dc70e6b-8426-4d71-b9d5-70ce6094a3f4/resource/823ac095-bdfc-41b0-b508-4e8fc3110082/download/'
  inst_file_name <- 'most-recent-cohorts-all-data-elements'
  inst_file_date <- '_01192021'
  
  download_scorecard(url = inst_url, zip_file_name = inst_file_name , unzip_file_name = inst_file_name, file_date = inst_file_date, file_extension = '.csv')
  
  # delete objects for url, file name, etc.
  rm(inst_url,inst_file_name,inst_file_date)

# Most recent data by field of study
  
  field_url <- 'https://data.ed.gov/dataset/9dc70e6b-8426-4d71-b9d5-70ce6094a3f4/resource/ff68afc4-6d23-459d-9f60-4006e4f85583/download/'
  field_file_name <- 'most-recent-cohorts-field-of-study'
  field_file_date <- '_01192021'
  
  download_scorecard(url = field_url, zip_file_name = field_file_name , unzip_file_name = field_file_name, file_date = field_file_date, file_extension = '.csv')
  
  # delete objects for url, file name, etc.
  rm(field_url,field_file_name,field_file_date)

# all data 
  # !!! note: function needs to be modified to for all data/all years because all has a sub-directory "Raw Data Files" that contains multiple CSV files !!!

  all_url <- 'https://ed-public-download.app.cloud.gov/downloads/'
  all_zip_file_name <- 'CollegeScorecard_Raw_Data'
  all_unzip_file_name <- 'Raw Data Files'
  all_file_date <- '_01192021'
  
  download_scorecard(url = all_url, zip_file_name = all_zip_file_name , unzip_file_name = all_unzip_file_name, file_date = all_file_date, file_extension = '')
  
  # delete objects for url, file name, etc.
  rm(all_url,all_zip_file_name,all_unzip_file_name,all_file_date)
    

## ---------------------------
## create function to read scorecard data
## ---------------------------

read_scorecard <- function(file_name) {
  
  df <- read_csv(file = file.path(input_data_dir, str_c(file_name,'.csv')))
  
  names(df) <- str_to_lower(names(df))
  
  df # what to return
}
  
# read most recent institution level data
  
  df_inst_recent <- read_scorecard(file_name = 'most-recent-cohorts-all-data-elements')
  
  df_inst_recent
  #rm(df_inst_recent)

# read most recent institution-field level data
  
  #df_field_recent <- read_scorecard(file_name = 'most-recent-cohorts-field-of-study')
  #rm(df_field_recent)

# read data from all files, all years
  
  # institution-field level data
  df_field_1516 <- read_scorecard(file_name = 'Raw Data Files/FieldOfStudyData1415_1516_PP')
  df_field_1617 <- read_scorecard(file_name = 'Raw Data Files/FieldOfStudyData1516_1617_PP')
  df_field_1718 <- read_scorecard(file_name = 'Raw Data Files/FieldOfStudyData1617_1718_PP')
  
  df_field_1516
  
  
## ---------------------------
## Create analysis file that contains variables from institution level and institution-field level data
## ---------------------------

# Investigate structure of institution level data

  # uniquely identify obs
    
    # unitid uniquely identifies obs
    df_inst_recent %>% group_by(unitid) %>% summarise(n_per_key=n()) %>% ungroup() %>% count(n_per_key)
  
    # opeid6 does not uniquely identify obs
    df_inst_recent %>% group_by(opeid6) %>% summarise(n_per_key=n()) %>% ungroup() %>% count(n_per_key)
    
    # opeid does not uniquely identify obs
    df_inst_recent %>% group_by(opeid) %>% summarise(n_per_key=n()) %>% ungroup() %>% count(n_per_key)
  
    
  # which variables to keep
    
    df_inst_recent %>% 
      select(unitid,instnm,city,stabbr,zip,accredagency,main,numbranch,highdeg,control,st_fips,region,locale,locale2,latitude,longitude,ccbasic,
             hbcu,annhi,tribal,aanapii,hsi,nanti,relaffil)
    
# Investigate structure of institution-field level data  

  # uniquely identify obs
    
    df_field_1718
    df_field_1718 %>% glimpse()
    
    df_field_1718 %>% count(main)
    
    # unitid-cipcode-credlev does not uniquely identify obs
    df_field_1718 %>% group_by(unitid,cipcode,credlev) %>% summarise(n_per_key=n()) %>% ungroup() %>% count(n_per_key)
    
    # filter first by main == 1, then group_by unitid-cipcode-credlev does not uniquely identify obs
    df_field_1718 %>% filter(main == 1) %>% group_by(unitid,cipcode,credlev) %>% summarise(n_per_key=n()) %>% ungroup() %>% count(n_per_key)
    
    # opeid6-cipcode-credlev does not uniquely identify obs [does worse than unitid]
    df_field_1718 %>% group_by(opeid6,cipcode,credlev) %>% summarise(n_per_key=n()) %>% ungroup() %>% count(n_per_key)
  
    
  # identify variables of interest to keep
    # variable name suffixes of note
      # stgp = stafford and grad plus
        # note: safford = direct subsidized and direct unsubsidized
      # pp = parent plus
      # eval = debt statistics for loans originated only at the institution where the debt is reported
      # any = loans originated at any institution the student attended
    
    
    # drop variables you don't want
    df_field_1718 %>% select(-contains('male'),-contains('pell'),-starts_with('bbrr'),-contains('nwne'),-contains('cntover150')) %>% glimpse()
## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
