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



#download_file2 <- function(dir_name, file_prefix, file_year, file_suffix, file_type, file_extension) {
download_file <- function(file_type, file_prefix, file_year, file_suffix) {

  # create objects for which directory, file extension, etc. based on whether reading csv data, dictionrary, or stata do file
  if (file_type == 'csv') {
    dir_name <- csv_dir
    type_extension <- ''
    file_extension <- '.csv'
        
  } else if (file_type == 'dict') {
    dir_name <- dict_dir
    type_extension <- '_dict'
    file_extension <- '.xlsx'
    
  } else { # stata code
    dir_name <- stata_dir
    type_extension <- '_Stata'
    file_extension <- '.do'
    
  }
  
  # create objects for: file_name, data_url, data_zipfile, data_unzipped file
  file_name <- str_c(file_prefix,file_year,file_suffix)
    writeLines(str_c('file_name object = ',file_name))
  data_url <- str_c(url, file_name, type_extension, '.zip')
    writeLines(str_c('data_url object = ',data_url))
  data_zipfile <- file.path(dir_name, str_c(file_name, type_extension, '.zip'))
    writeLines(str_c('data_zipfile object = ',data_zipfile))
  data_unzipped <- file.path(dir_name, str_c(file_name, file_extension))
    writeLines(str_c('data_unzipped object = ',data_unzipped))
    
  # download and unzip files
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


# loop across file_type and year

file_types <- c('csv','dict','stata')

years <- c('2015','2016','2017','2018','2019')

# loop for data year
for (y in 1:length(years)) { 
  
  writeLines(str_c("\n i=", i, "; year=", years[[y]]))
  
  # loop for file_types c('csv','dict','stata')
  for (i in 1:length(file_types)) { 
    
    writeLines(str_c("\n i=", i, "; file_type=", file_types[[i]]))
  
    # institutional characteristics, flags
    download_file(file_type = file_types[[i]], file_prefix = 'flags', file_year = years[[y]], file_suffix = '')
      
    # institutional characteristics, hd
    download_file(file_type = file_types[[i]], file_prefix = 'hd', file_year = years[[y]], file_suffix = '')
    
    # Imstitutional characteristics, Educational offerings, organization, services and athletic associations Educational offerings, organization, services and athletic associations
    download_file(file_type = file_types[[i]], file_prefix = 'ic', file_year = years[[y]], file_suffix = '')
    
    # instituional characteristics, student charges for academic year programs
    download_file(file_type = file_types[[i]], file_prefix = 'ic', file_year = years[[y]], file_suffix = '_ay')
    
    
  }
}


# STUFF FOR CRYSTAL TO DO:

  # READ CSV DATA INTO R
  # LABEL ALL VARIABLES AND ADD VALUE LABELS TO VARIABLES WITH VALUE LABELS
    # YOU DECIDE WHETHER YOU WANT TO USE THE XLSX DICTIONARIES OR STATA DO FILES AS INPUTS TO VARIABLE/VALUE LABELS
  # FOR EACH DIFFERENT KIND OF DATA (E.G., flags; hd; educational offerings...; student charges) append the datasets from different years to create a panel
    # create a year identifier to identify year
    # this will involve ovewriting variable/value labels
    # save these r datasets to local machine 
      # C:\Users\ozanj\Documents\educ152\data\ipeds\output_data
  # merge the following panels by unitid and year:
      # hd, flags, academic year charges
      # save R dataset to local machine

## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
