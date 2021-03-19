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

data_dir <- file.path('.','data','college_scorecard')
data_dir
list.files(path = data_dir)

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
  #sc_key('aff360d1fe8a919619776f48e975f03b8bb1379e')
   sc_key('aff360d1fe8a919619776f48e975f03b8bb1379e')

# sample request

df <- sc_init() %>% 
    sc_filter(control == 1) %>% 
    sc_select(unitid, instnm, stabbr) %>% 
    sc_year(2013) %>% 
    sc_zip(37203, 50) %>%
    sc_get()

df <- 
  sc_init() %>% 
    sc_filter(region == 2, ccbasic == c(21,22,23), locale == 41:43) %>% 
    sc_select(unitid, instnm, stabbr) %>% sc_get()
  
  
    sc_year("latest") %>% 
    sc_get()

sc_dict("control")
## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
