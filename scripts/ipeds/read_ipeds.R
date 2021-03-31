################################################################################
##
## [ PROJ ] < Script to download, read, and label ipeds data # >
## [ FILE ] < read_ipeds.R >
## [ AUTH ] < Ozan Jaquette / ozanj >
## [ INIT ] < 3/31/2021 >
##
################################################################################

## ---------------------------
## libraries
## ---------------------------

library(tidyverse)
library(labelled)

## ---------------------------
## directory paths
## ---------------------------

ipeds_dir <- file.path('.', 'data','ipeds')
  #ipeds_dir
  #list.files(path = ipeds_dir)

input_dir <- file.path(ipeds_dir,'input_data')
  #input_dir
  #list.files(path = input_dir)

csv_dir <- file.path(input_dir, 'csv_data')
  #csv_dir
  #list.files(path = csv_dir)
dict_dir <- file.path(input_dir, 'dictionaries')
  #dict_dir
  #list.files(path = dict_dir)
stata_dir <- file.path(input_dir, 'stata_files')
  #stata_dir
  #list.files(path = stata_dir)

## -----------------------------------------------------------------------------
## function to download ipeds files
## -----------------------------------------------------------------------------

url <- 'https://nces.ed.gov/ipeds/datacenter/data/'


  
download_file <- function(dir_name, file_prefix, file_year, file_suffix, file_type, file_extension) {

  file_name <- str_c(file_prefix,file_year,file_suffix)
    writeLines(str_c('file_name object = ',file_name))
  data_url <- str_c('https://nces.ed.gov/ipeds/datacenter/data/', file_name, file_type, '.zip')
    writeLines(str_c('data_url object = ',data_url))
  data_zipfile <- file.path(dir_name, str_c(file_name, file_type, '.zip'))
    writeLines(str_c('data_zipfile object = ',data_zipfile))
    
  data_unzipped <- file.path(dir_name, str_c(file_name, file_extension))
    writeLines(str_c('data_unzipped object = ',data_unzipped))
    
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
  
}

# hd 2019
  #https://nces.ed.gov/ipeds/datacenter/data/HD2019.zip
  #https://nces.ed.gov/ipeds/datacenter/data/HD2019_Stata.zip
  #https://nces.ed.gov/ipeds/datacenter/data/HD2019_Dict.zip

download_file(dir_name = csv_dir, file_prefix = 'hd', file_year = '2019', file_suffix = '', file_type = '', file_extension = '.csv')
download_file(dir_name = dict_dir, file_prefix = 'hd', file_year = '2019', file_suffix = '', file_type = '_dict', file_extension = '.xlsx')
download_file(dir_name = stata_dir, file_prefix = 'hd', file_year = '2019', file_suffix = '', file_type = '_Stata', file_extension = '.do')

# flags 2019

  #https://nces.ed.gov/ipeds/datacenter/data/FLAGS2019.zip
  #https://nces.ed.gov/ipeds/datacenter/data/FLAGS2019_Stata.zip
  #https://nces.ed.gov/ipeds/datacenter/data/FLAGS2019_Dict.zip

download_file(dir_name = csv_dir, file_prefix = 'flags', file_year = '2019', file_suffix = '', file_type = '', file_extension = '.csv')
download_file(dir_name = dict_dir, file_prefix = 'flags', file_year = '2019', file_suffix = '', file_type = '_dict', file_extension = '.xlsx')
download_file(dir_name = stata_dir, file_prefix = 'flags', file_year = '2019', file_suffix = '', file_type = '_Stata', file_extension = '.do')

# student charges for academic year programs 2019

  #https://nces.ed.gov/ipeds/datacenter/data/IC2019_AY.zip
  #https://nces.ed.gov/ipeds/datacenter/data/IC2019_AY_Stata.zip
  #https://nces.ed.gov/ipeds/datacenter/data/IC2019_AY_Dict.zip

download_file(dir_name = csv_dir, file_prefix = 'ic', file_year = '2019', file_suffix = '_ay', file_type = '', file_extension = '.csv')
download_file(dir_name = dict_dir, file_prefix = 'ic', file_year = '2019', file_suffix = '_ay', file_type = '_dict', file_extension = '.xlsx')
download_file(dir_name = stata_dir, file_prefix = 'ic', file_year = '2019', file_suffix = '_ay', file_type = '_Stata', file_extension = '.do')

#fall enrollment; Race/ethnicity, gender, attendance status, and level of student: Fall 2019

  #https://nces.ed.gov/ipeds/datacenter/data/EF2019A.zip
  #https://nces.ed.gov/ipeds/datacenter/data/EF2019A_Stata.zip
  #https://nces.ed.gov/ipeds/datacenter/data/EF2019A_Dict.zip

download_file(dir_name = csv_dir, file_prefix = 'ef', file_year = '2019', file_suffix = 'a', file_type = '', file_extension = '.csv')
download_file(dir_name = dict_dir, file_prefix = 'ef', file_year = '2019', file_suffix = 'a', file_type = '_dict', file_extension = '.xlsx')
download_file(dir_name = stata_dir, file_prefix = 'ef', file_year = '2019', file_suffix = 'a', file_type = '_Stata', file_extension = '.do')

download_file(dir_name = file_dirs[1], file_name = files[1], file_suffix = suffixes[1], file_extension = extensions[1])



file_dirs <- c(csv_dir, dict_dir, stata_dir)
suffixes <- c('', '_Dict', '_Stata') 
extensions <- c('.csv', '.xlsx', '.do')

## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
