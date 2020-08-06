---
title: "EDUC 152, Course Outline"
author: 
date: 
urlcolor: blue
output: 
  html_document:
    toc: true
    toc_depth: 3
    toc_float: true # toc_float option to float the table of contents to the left of the main document content. floating table of contents will always be visible even when the document is scrolled
      #collapsed: false # collapsed (defaults to TRUE) controls whether the TOC appears with only the top-level (e.g., H2) headers. If collapsed initially, the TOC is automatically expanded inline when necessary
      #smooth_scroll: true # smooth_scroll (defaults to TRUE) controls whether page scrolls are animated when TOC items are navigated to via mouse clicks
    number_sections: true
    fig_caption: true # ? this option doesn't seem to be working for figure inserted below outside of r code chunk    
    highlight: tango # Supported styles include "default", "tango", "pygments", "kate", "monochrome", "espresso", "zenburn", and "haddock" (specify null to prevent syntax    
    theme: default # theme specifies the Bootstrap theme to use for the page. Valid themes include default, cerulean, journal, flatly, readable, spacelab, united, cosmo, lumen, paper, sandstone, simplex, and yeti.
    df_print: tibble #options: default, tibble, paged
    keep_md: true # may be helpful for storing on github
    
---

# What will be the same/different across iterations

## Things that will be constant

- The course will focus on learning multivariate regression
- The course will have a final project

## Things that may differ

- Approach to introducing regression
  - some may introduce regression from the perspective of program evaluation/causal inference; others may introduce regression from a different disciplinary perspective
- Instructor of record will have full discretion over the final project
- required textbook and readings

# Course description [ozan's version]

This course introduces students to applied linear regression analysis with a focus on program evaluation.  Program evaluation is the main methodological strategy used to assess the impact of programs, policies, and interventions. The primary purpose of regression analysis in program evaluation research is to assess the causal effect of one intervention  (the independent variable of interest) on an educational outcome (the dependent variable) in observational settings where random assignment to the independent variable of interest is not possible. The course will focus on learning regression with a continuous dependent variable, one independent variable of interest, and control variables to evaluate the effect of some program, policy, and/or intervention. We will devote substantial time to interpreting and visualizing regression output, as well as cover measures of model fit, multicollinearity, non-linear relationships (i.e., polynomials and logs), and interaction effects. 

## Final project [ozan]

Explain topic for final project;

- provide tentative timeline for final project

## course topics [ozan]

1. Introduction
    - syllabus
    - Discussion of causal vs. correlational relationships
    - Introduce final project
      - same broad topic for entire class (class votes on broad topic)
      - do in groups of 3 (groups can decide on specific resarch question)
    - Doing stuff in R
      - introduce relevant programming concepts
    - student homework assignment: 
      - what topic do you want to study (examing a causal relationship)?
      - optional: any data sources you think are relevant
1. Rubin's causal model and why experiments work
    - counterfacturals
    - cross sectional vs. longitudinal research designs
    - random assignment experiments as creating comparison group that represents the counterfactual
    - causal inference in the absence of experiments
    - quasi experimental designs (isolate exogenous variation in X)
    - correlational designs that have purpose of estimating correlational relationship
    - regressipon as an observational design to estimate causal relationship
    - Doing stuff in R
      - introduce relevant programming concepts
    - Final project
      - students form groups of 3 for final project
1. Fundamentals of inference I
    - Brief review of of goal in inferential statistics
      - e.g., population parameters vs. point estimates; correlational vs. causal relationships
    - standard deviation
    - distributions, properties of distributions
      - e.g., normal, skewed; 
    - sampling distribution
    - standard error
    - central limit theorem
    - Doing stuff in R
      - introduce relevant programming concepts
      - group activity applying theoretical concepts to data using R functions
    - Final project
      - Ozan introduce potential topics and data sources for final project
    - student homework assignment: 
      - student groups vote on final project topic (a couple days before next class)
1. Fundamentals of inference II    
    - Hypothesis testing
      - stating null and alternative hypotheses
      - one sided vs. two-sided
      - e.g., estimate population mean $\mu$
    - Practice all steps of hypothesis testing [group activity?]
    - Doing stuff in R
      - introduce relevant programming concepts
      - group activity applying theoretical concepts to data using R functions
    - Discuss final project topic and data sources
      - potential specific research questions
      - introduce data sources
    - homework
      - come up w/ research questions
      - identify data sources and variables
1. Introduction to bivariate regression
    - Covariance
    - Correlation
      - Scatterplots
      - slope
      - best fit line
    - Population linear regression model
      - Population regression coefficient
      - Population intercept
      - error term, residuals
    - main things we do in regression analysis
      - estimation, prediction, hypothesis testing
    - Estimation
      - Sample regression line
      - Ordinary least squares 
    - Doing stuff in R
      - introduce relevant programming concepts
      - group activity applying theoretical concepts to data using R functions
    - homework
      - revise research questions; revise data sources and variables

1. 
1. 
1. 
1. 
1. 
1. 
1. 

The course will consist of X units

- Unit 1: Fundamentals of statistical theory
  - sampling distribution
  - central limit theorem
  - standard error
  - hypothesis testing
- Unit 2: regression for causal inference
  - Rubin's causal model
  - why experiments work
  



# Tentative outline

## Week 1: Introduction 

## Week 2: fundamentals of statistics 1

## Week 3: fundamentals of statistics 2

## Week 4: 

## Week 5: 

## Week 6: 

## Week 7: 

## Week 8: 

## Week 9: 

## Week 10: 
