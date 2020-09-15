---
title: "Syllabus, EDUC152"
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

- EDUC152: Regression for education research
- Quarter and year
- 4 units
- Link to syllabus: [https://rucla-ed.github.io/educ152/syllabus/educ152_syllabus_draft.html](https://rucla-ed.github.io/educ152/syllabus/educ152_syllabus_draft.html)

# Short course description

This course introduces students to regression as a tool to answer questions about education. Regression is the most commonly used quantitative method in education research and can be  used to answer many causal research questions and descriptive research questions. However, using regression appropriately requires thoughtfulness about what kinds of questions regression can answer, the assumptions regression relies on, the limitations of our data, and how particular variables (e.g., “race” and “gender”) are incorporated into analyses. Otherwise, regression results may be biased and may reify rather than interrogate problematic ideas.  Therefore, EDUC250 teaches the fundamentals concepts of regression analysis and how these concepts can be thoughtfully applied to answer different kinds of research questions, with a particular emphasis on explicitly critical research questions. The course also emphasizes how to understand and critically assess research that uses regression. The course integrates theory and application using the **_R_** programming language. Students will be assessed through four substantive assignments, including the final, capstone assignment in which students will conduct the major steps in the life-cycle of a regression research project.
\\
THIS DESCRIPTION IS A BIT OVER WORD LIMIT. I'LL GET DOWN BELOW WORD LIMIT FOLLOWING FEEDBACK

# Instructor and teaching assistant

## Instructor

- Ozan Jaquette
- Pronouns: he/him/his
- Office: Moore Hall, room 3038
- email: [ozanj@ucla.edu](ozanj@ucla.edu)
- Office hours:
  - Zoom ofice hours TBA
  - And by appointment


## Teaching assistant

- name
- Pronouns: 
- email:
- Office hours:

# Extended course description

Regression is the most widely-used quantitative methodology to answer causal, and also non-causal, research questions. This section of EDUC152 will introduce students to regression with a focus on using regression to answer causal research questions, which typicaly follow the form “what is the effect of X on Y.” The course also emphasizes undersanding how to read and critically assess empirical research that uses regression.

The course integrates statistical theory and application using the **_R_** programming language.  Students will work through asynchronous video lectures and lectures slides on their own. These lectures introduces statistical theory, introduces the relevant programming skills, and provides the code and real-world data so that students can practice conducting and interpreting statistical analyses. Course topics will include: fundamental statistical concepts of statistical inference; principles of causal inference; and fundamentals of multiple regression.  During class time, students will work in groups to solve practical research challenges and we will discuss and deconstruct empirical research that uses regression analysis. The primary course assessments are four problem sets -- including the final capstone problem set -- which will be completed in groups. Each problem set will require students to apply knowledge of statistical concepts, and conduct substantive statistical analyses around a particular research question. 



The course embraces using regression to answer traditional research questions (e.g., the effect of student-teacher ratio on achievement) and critical research questions (e.g., the effect of racial salience -- as presented in email text -- on how white university admissions officers respond to inquiries from Black prospective students). The skills this course teaches are valued by employers and are valued in the process of applying to graduate schools. After completing this course, students will be prepared to take more advanced causal inference coursework (e.g., quasi-experimental methods) and coursework that teaches the programming and data manipulation skills necessary to create analysis datasets for real research projects.


# Course learning goals



__Big-picture (conceptual) learning goals__

1. Understand principles of statistical inference for hypothesis testing
1. Understand the fundamentals of multiple regression analysis and the assumptions that must be satisfied to make inferences from these results
1. Understand how to interpret multiple regression results and communicate these results in non-technical language.
1. Develop thoughtfulness about the ethical and social dimensions of using regression for education research, for example critically examining how race variables are created and how they are incorporated into regression analyses
1. Understand the principles of causal inference, including why experiments work and how to use regression to answer causal research questions
1. Understand and critically evaluate empirical research that uses regression to answer research questions

__Skill-based learning goals__

1. Conduct regression analysis using R
1. Develop proficiency in basic data management skills, including simple descriptive statistics to investigate data quality and creating analysis variables
1. Use RMarkdown to produce documents containing research results, including: graphical visualizations; tables of descriptive statistics and regression results; and in-text citations and APA formatted reference lists





# Course structure and how to succeed

## Course structure

Each week, the course will be structured around asynchronous (pre-class) lectures and one synchronous workshop-style class meeting per week. Weekly homework will consist of students working through the lectures on their own and a modest amount of required reading. Written homework will consist of four "problem sets." Students will complete the first three problem sets in groups. Students will complete the final capstone problem set, due during finals week, on their own.

1. __Asynchronous (pre-class) lectures__. Weekly asynchronous lectures will be posted on the course website with the expectation that students work through the lecture in advance of our weekly synchronous class meeting. Lecture materials will consist of three types of resources: first, detailed lecture slides (PDF or HTML) introducing the statistical theory, programming skills, and sample code; second, short videos (e.g., 15 to 30 total minutes per week) that provide a high-level discussion of important and/or challenging concepts from the lecture slides, but not a line-by-line recitation of the lecture; and, third, the .Rmd file that created the PDF/html lecture slides. This .Rmd file will contain all "code chunks" and links to all data utilized in the lecture. Thus, students will be able to "learn by doing" in that they can run R code on their own computer while they work through lecture materials on their own.
1. __Synchronous workshop-style class meetings.__ We will have one synchronous class meeting per week. Typically, these meetings will begin with a discussion of concepts students found difficult or confusing from the lecture materials. However, the bulk of class time will be devoted to students working in groups on a substantive question or challenge posed by the instructor. For example, students may be asked to create analysis variables from survey data in the presence of skip patterns or how we could improve on the analyses conducted in a research article students read prior to class. While students work in groups, the instructor and TA will visit with each group to answer questions and talk through ideas.

## How to succeed in this class

Prior to our in-class meetings, students should work through lecture materials on their own. We recommend treating the lecture materials as an active learning experience, in which students run *R* code on their computer instead of merely reading text on the slide. Additionally, we recommend that students ask questions on the course github website when they are having difficulty with the material.

With respect to written work, the problem sets -- described below -- will be substantive and are intended to be challenging. Students who devote time each week working through the lecture materials will be better prepared for the problem sets. We recommend starting the problem sets early. This way students will have plenty of time to ask for help on questions they find challenging.


# Creating an Inclusive Classroom Community 

(Instructor, TA, and Community Expectations)

## Respect for diversity

# Course website and communication

## Course website

- Using github. 

## Course discussion

- Use github issues/groups for all questions related to course content

## Communication with instructor and TA

- Email to instructor/TA for personal and sensitive issues

# Course materials

## Textbooks

TBA, but will chose one or two free books

## Other reading

Links to reading on course website


## Software

# Assignments and grading

## Assignments

### Problem sets

The primary course assessments are four problem sets, including the final capstone problem set.  Each problem set will require students to apply knowledge of statistical concepts, conduct substantive statistical analyses, present and interpret results. Problem sets will also be designed to introduce students to some of the thorny data challenges that inevitably arise in real research projects.  The final, capstone problem set will require students to conduct the major components of an empirical regression analysis, from research question and variable collection to modeling, presentation, and interpretation. Additionally, the capstone problem set will require students to critically evaluate an empirical journal article that utilized the same data sources to answer the same research question.

COMMENTS

- recommmendation on how challenging
  - make first problem set credit/no credit
  - make them short but challenging;
  - take time in class to work on the problem set
  - make the first couple of problem sets that have a lot of hints;
- think about how grades would be distributed throughout; you can't give everyone an A;
- maybe giving students an opportunity to revise?
- Rashmita: Lucrecia's example of "ED471-Project 3 - Spring 2019" problem set is  problem set is 


### Attendance and participation

## Grading scale

# Course schedule

1. Introduction
1. Fundamentals of statistical inference I (sampling distributions and central limit theorem)
1. Fundamentals of statistical inference II (hypothesis testing)
1. Principles of causal inference: Rubin's Causal Model and why experiments work
1. Introduction to bivariate regression
1. Prediction and measures of model fit
1. Hypothesis testing and confidence intervals for $\beta_1$
1. Categorical X variables and introduction to multivariate regression
1. Using regression for causal inference: OLS assumptions and omitted variable bias
1. Creating tables and graphs of descriptive statistics and regression results

# Course policies

## Classroom environment
## Online Collaboration/Netiquette
## Academic accomodations
## Academic integrity

# Campus resources

Counseling
Discrimination
Sexual harassment
LGBTQ resource center
International students
Undocumented students
Student legal services
Students with dependents
Gender inclusive restrooms
Campus accessibility
Center for accessible education
Counseling and Psychological Services (CAPS)
Title IX Resources
Undergraduate Writing Center
