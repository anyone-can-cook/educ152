---
title: "Syllabus, EDUC152"
author: 
date: 
urlcolor: blue
output:
  # word_document:
  #   toc: no
  #   toc_depth: '3'
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

- EDUC152. Introduction to quantitative research in education: Regression analysis
- Quarter and year
- 5 units
- Link to syllabus: [https://rucla-ed.github.io/educ152/syllabus/educ152_syllabus_draft.html](https://rucla-ed.github.io/educ152/syllabus/educ152_syllabus_draft.html)
- Link to course website: 
- Link to course Slack workspace: 

# Short course description

https://docs.google.com/document/d/1IrC3I9qVG5OvJQjyw3m1eh9MRPI1865foQmwv7e8GII/edit
This course introduces students to regression as a tool to answer questions about education. Regression is commonly used to answer questions about "association claims" -- the relationship between variables -- and "causal claims" -- the causal effect of one variable on another. However, using regression appropriately requires thoughtfulness about what kinds of questions regression can answer, about the assumptions regression relies on, about the limitations of our data, and about how particular variables (e.g., "race" and "gender") are incorporated into analyses. Otherwise, regression results may be biased and may reify rather than interrogate problematic ideas. Therefore, EDUC152 introduces students to fundamental concepts of regression analysis and how these concepts can be thoughtfully applied to address important questions about education. The course also trains students how to read and critically assess research that uses regression. ECUC152 integrates theory and application using the **_R_** programming language. Students will be assessed through four substantive take-home assignments, including the final, capstone assignment.




# Instructor and teaching assistant

## Instructor

- Ozan Jaquette
- Pronouns: he/him/his
- Office: Moore Hall, room 3038
- Email: [ozanj@ucla.edu](ozanj@ucla.edu)
- Office hours:
  - Zoom office hours TBA
  - And by appointment


## Teaching assistant

- Name
- Pronouns: 
- Email:
- Office hours:

# Extended course description


Regression is the most widely-used quantitative methodology to answer causal, and also non-causal, research questions. This section of EDUC152 will introduce students to regression with a focus on using regression to answer causal research questions, which typicaly follow the form "what is the effect of X on Y." The course also emphasizes undersanding how to read and critically assess empirical research that uses regression.

The course integrates statistical theory and application using the **_R_** programming language.  Students will work through asynchronous video lectures and lectures slides on their own. These lectures introduces statistical theory, introduces the relevant programming skills, and provides the code and real-world data so that students can practice conducting and interpreting statistical analyses. Course topics will include: fundamental statistical concepts of statistical inference; principles of causal inference; and fundamentals of multiple regression.  During class time, students will work in groups to solve practical research challenges and we will discuss and deconstruct empirical research that uses regression analysis. The primary course assessments are four problem sets -- including the final capstone problem set -- which will be completed in groups. Each problem set will require students to apply knowledge of statistical concepts, and conduct substantive statistical analyses around a particular research question. 



The course embraces using regression to answer traditional research questions (e.g., the effect of student-teacher ratio on achievement) and critical research questions (e.g., the effect of racial salience -- as presented in email text -- on how white university admissions officers respond to inquiries from Black prospective students). The skills this course teaches are valued by employers and are valued in the process of applying to graduate schools. After completing this course, students will be prepared to take more advanced causal inference coursework (e.g., quasi-experimental methods) and coursework that teaches the programming and data manipulation skills necessary to create analysis datasets for real research projects.


# Course learning goals



__Big-picture (conceptual) learning goals__

1. Understand principles of statistical inference for hypothesis testing
1. Understand the fundamentals of multiple regression analysis and the assumptions that must be satisfied to make inferences from these results
1. Understand how to interpret multiple regression results and communicate these results in non-technical language.
1. Develop thoughtfulness about the ethical and social dimensions of using regression for education research
1. Understand the principles of causal inference, including why experiments work and how to use regression to answer causal research questions
1. Understand and critically evaluate empirical research that uses regression to answer research questions

COOMMENTS

- systematically replace understand with more active verbs;
- Understand principles of statistical inference for hypothesis testing – be able to apply principles of statistical inference to conduct hypothesis tests
- Understand the fundamentals of multiple regression analysis and the assumptions that must be satisfied to make inferences from these results – be able to conduct multiple regression analysis, starting by listing and checking the necessary assumptions
- Understand how to interpret multiple regression results and communicate these results in non-technical language – be able to interpret and communicate…


<!-- 
, for example critically examining how race variables are created and how they are incorporated into regression analyses
 -->

__Skill-based learning goals__

1. Estimate linear regression models using R
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

## Classroom environment

<!-- 
# Creating an Inclusive Classroom Community 
(Instructor, TA, and Community Expectations)
## Respect for diversity  
 -->

We all have a responsibility to ensure that every member of the class feels valued and safe. 
Be mindful that our words and body language affects others in ways we not fully understand. We have a responsibility to express our ideas in a way that doesn't make disparaging generalizations and doesn't make people feel excluded. As an instructor, I am responsible for setting an example through my own conduct.

Learning regression, while trying to get a handle on R and unfamiliar data can feel overwhelming! We must create an environment where students feel comfortable asking questions and talking about what they did not understand. Discomfort is part of the learning process. Unburdern yourself from the weight of being an "expert." Focus your energy on improving and helping your classmates improve.

##  Towards an anti-racist learning experience

Every course should be an anti-racist course, even when the subject matter is broadly oriented. In this course we’ll engage with research that reflect systemic gaps based on race, ethnicity, immigration status, and gender identity, among other aspects of identity. We will discuss whether the language, the framing, the analyses, and even the research question of a study contribute to problematic beliefs. If so, how can we do better? It is also critical that we acknowledge that the social and economic marginalization reflected in data is rooted in systemic oppression that upholds opportunity for some at the expense of others. We should all be thinking about our own role in upholding these systems.

COMMENT

- WHERE IS THIS ACTUALLY LEARNED AND ASSESSED IN THE COURSE STRUCTURE; AND MAYBE AS A LEARNING GOAL
- PROVIDE AN ILLUSTRATIVE READING THAT GETS AT THIS; 


# Course website and communication

## Course website

All course related material can be found on the class website [here]. Pre-recorded lecture videos, lecture slides (pdf, html), and .Rmd files will be posted on the class website under the associated sections. Additional resources (e.g. syllabus) may also be posted on the class website. Class announcements and discussion will be conducted on GitHub (see below). 

## Course communication and online discussion

Instead of communicating via email, we’ll use *Slack*, an online collaborative workspace. You can access it through a web browser or by downloading the Slack app to your phone or computer. Our workspace is called “EDUC 152, QUARTER YEAR” and the link is at the top of the syllabus. The best way to communicate with the instructor, TAs, and your classmates is via Slack, instead of email. All class announcements (e.g., “the due date for the assignment has changed” or “I’ve posted a study guide – check it out!”) will be made with Slack. This means it’s important that you check regularly for communication.

If you have a personal question or issue, please send a message to the instructor and/or TA via Slack. Additionally, we are available for office hours or by appointment if there is anything you would like to discuss with us in private. 

# Course materials

**Required books**

- [Learning Statistics with R](https://learningstatisticswithr.com/) by Danielle Navarro [**FREE!**]
- [R Markdown: The Definative Guide](https://bookdown.org/yihui/rmarkdown/) by Yihui Xie, J. J. Allaire, and Garrett Grolemund [**FREE!**]

**Optional books**

- [R for Data Science](https://r4ds.had.co.nz/) by Garrett Grolemund and Hadley Wickham [**FREE!**]

Links to other required and optional reading will be on the course website [link]


**Required software**

- **_[R](https://cloud.r-project.org/)_**, statistical programming language [**FREE!**]
- **[RStudio](https://rstudio.com/products/rstudio/download/)**, integrated development environment for R  [**FREE!**]

<!-- -
**[Git and GitHub](https://github.com/Rucla-ed/rclass2/raw/master/_resources/todo/educ263_todo.pdf)**  [**FREE!**] 
-->


# Assignments and grading

Course grade will be based on the following components:

- Problem set 1, 15%
- Problem set 2, 15%
- Problem set 3, 15%
- Problem set 4, 30%
- In-class group activities, 15%
- Attendance and participation, 10%

## Assignments

### Problem sets (75 percent of total grade)

The primary course assessments are four problem sets. The first three problem sets are each worth 15% of the course grade and students will work in groups. The final, capstone problem set is worth 30% and students will work alone. 

Each problem set will require students to apply knowledge of statistical concepts, conduct substantive statistical analyses, present and interpret results. Other questions will introduce students to some of the thorny data challenges that inevitably arise in real research projects. The capstone problem set will require students to conduct the major components of an empirical regression analysis, from research question and variable collection to modeling, presentation, and interpretation. Additionally, the capstone problem set will require students to critically evaluate an empirical journal article that utilized the same data sources to answer the same research question.


You will work in groups for the first three problem sets. **However, it is important that you understand how to do the problem set on your own, rather than copying the solution developed by group members.**  Each student will submit their own R script or .Rmd file. Since you will be working together, it is understandable that answers for some questions will be the same as your group members. However, if I find compelling evidence that a student merely copied solutions from a classmate, I will consider this a violation of academic integrity and that student will receive a zero for the homework assignment.

Late submissions will lose 20% (i.e., max grade becomes 80%). Problem sets not submitted by XXXX will not receive points. You will not lose points for late submission if you cannot submit a problem set due to an unexpected emergency. But please contact the instructor by email as soon as you can so we can work out a plan.

We strongly recommend using GitHub issues to ask questions you have about problem sets. Instructors will do our best to reply quickly with helpful hints/explanations and we encourage members of the class to do the same.

More detailed problem set guidelines can be found here [link]

COMMENT:

- FOR CDAS SAY PROBLEM SETS ARE NOT FULLY DEVELOPED BUT HERE IS AN EXAMPLE OF A SIMILAR PROBLEM SET
- 

<!-- -

COMMENTS FROM THE UNDERGRAD STATS COMMITTEE

- recommmendation on how challenging
  - make first problem set credit/no credit
  - make them short but challenging;
  - take time in class to work on the problem set
  - make the first couple of problem sets that have a lot of hints;
- think about how grades would be distributed throughout; you can't give everyone an A;
- maybe giving students an opportunity to revise?
- Rashmita: Lucrecia's example of "ED471-Project 3 - Spring 2019" problem set is  problem set is 

-->

## In-class group activities (15 percent of total grade)

During most synchronous class sessions, students will work on a group activity or challenge that applies concepts and skills we are learning. For example, Run a statistical test in *R* and use the test results object to create a formatted table that you insert into a .Rmd file. Or, write a draft critique of the methodology of a published research paper. Students will submit their work at the end of class. 
Most of these tasks cannot be fully completed. The goal is to get students thinking. Students will be graded largely based on effort.

## Attendance and Participation (10 percent of total grade)

Students are expected to participate in the weekly class meetings by being attentive, supportive, by asking questions, or by answering questions posed by others on zoom. Additionally, students can receive strong participation grades by asking questions and answering questions on GitHub issues. 


## Grading scale

<table class="table table-striped table-hover table-condensed table-responsive" style="width: auto !important; ">
 <thead>
  <tr>
   <th style="text-align:left;"> Letter Grade </th>
   <th style="text-align:left;"> Percentage </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> A+ </td>
   <td style="text-align:left;"> 99-100% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> A </td>
   <td style="text-align:left;"> 93&lt;99% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> A- </td>
   <td style="text-align:left;"> 90&lt;93% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> B+ </td>
   <td style="text-align:left;"> 87&lt;90% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> B </td>
   <td style="text-align:left;"> 83&lt;87% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> B- </td>
   <td style="text-align:left;"> 80&lt;83% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> C+ </td>
   <td style="text-align:left;"> 77&lt;80% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> C </td>
   <td style="text-align:left;"> 73&lt;77% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> C- </td>
   <td style="text-align:left;"> 70&lt;73% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> D </td>
   <td style="text-align:left;"> 60&lt;70% </td>
  </tr>
  <tr>
   <td style="text-align:left;"> F </td>
   <td style="text-align:left;"> 0&lt;60% </td>
  </tr>
</tbody>
</table>


# Course schedule

UNITS:

- STATISTICAL INFERENCE FOR DESCRIPTIVE CLAIMS
- REGRESSION FOR ASSOCIATION CLAIMS
- REGRESSION TO MAKE CAUSAL CLAIMS

[HAVE NOT UPDATED SINCE LAST MEETING]

1. Introduction
STATISTICAL INFERENCE
1. Fundamentals of statistical inference I (sampling distributions and central limit theorem)
1. Fundamentals of statistical inference II (hypothesis testing)

FUNDAMENTALS OF REGRESSION IN DESCRIPTIVE
1. Introduction to bivariate regression
1. Prediction and measures of model fit
1. Hypothesis testing and confidence intervals for $\beta_1$
1. Categorical X variables and introduction to multivariate regression
1. INSERT A WEEK ON CRITICALLY ASSESSING RESEARCH; AND HOW TO AVOID DOING BAD THINGS PEOPLE DO WITH REGRESSION
REGRESSION FOR CAUSAL INFERENCE
1. Principles of causal inference: Rubin's Causal Model and why experiments work
1. Using regression for causal inference: OLS assumptions and omitted variable bias


COMMENTS
- ON UNITS, FROM GLORY
  - "The kinds of quant research claims we discuss in ED 150 are descriptive claims, association claims, causal claims. ED 150 alum will find it helpful - I think - if you're able to reference these (especially the second two) when you talk about internal validity and transition from your unit on "regression as a descriptive tool" to your unit on "regression as a causal tool.""
- WANTING TO SEE EXAMPLES OF EMPIRICAL READING; 
- REPLACE "WHY EXPERIMENTS WORK" WITH SOMETHING ELSE; 
1. Creating tables and graphs of descriptive statistics and regression results
x. when to come up with 
FOR CDAS, NEED TO EXPAND THIS OUT

- they want to see course readings;
  - should show readings on the technical skills you want students to use
- they want to see specific assignments;
- submit to CDAS by next wednesday; 
- will there be a weeek 
- associational claims vs. causal claims;
  - research design

# Course policies

## Academic accomodations

**Center for Accessible Education**  

Students needing academic accommodations based on a disability should contact the Center for Accessible Education (CAE). When possible, students should contact the CAE within the first two weeks of the term as reasonable notice is needed to coordinate accommodations. For more information visit www.cae.ucla.edu.

Located in A255 Murphy Hall: (310) 825-1501, TDD (310) 206-6083; http://www.cae.ucla.edu/

-	Due to COVID-19, the CAE office is closed for in-person meetings.
-	CAE counselor, resources, and services are still available via email / virtual appointment.
-	Stay up-to-date with CAE newsletters & announcements at https://www.cae.ucla.edu/announcements-events/student



## Academic integrity

__UCLA policy__  

  - UCLA is a community of scholars. In this community, all members including faculty, staff and students alike are responsible for maintaining standards of academic honesty. As a student and member of the University community, you are here to get an education and are, therefore, expected to demonstrate integrity in your academic endeavors. You are evaluated on your own merits. Cheating, plagiarism, collaborative work, multiple submissions without the permission of the professor, or other kinds of academic dishonesty are considered unacceptable behavior and will result in formal disciplinary proceedings.  
  
__This class__  

  - Given that 75% of course grade is based on problem sets, the primary academic honesty concern that could come up in this class is copying problem set solutions from somebody else and passing this in as your own work.


# Campus resources


## Counseling and Psychological Services (CAPS)

As a student you may experience a range of issues that can cause barriers to learning, such as strained relationships, increased anxiety, alcohol/drug problems, depression, difficulty concentrating and/or lack of motivation. These mental health concerns or stressful events may lead to diminished academic performance or reduce a student's ability to participate in daily activities. UC offers services to assist you with addressing these and other concerns you may be experiencing. If you or someone you know are suffering from any of the aforementioned conditions, consider utilizing the confidential mental health services available on campus.

Students in distress may speak directly with a counselor 24/7 at (310) 825-0768, or may call 911; located in Wooden Center West; www.caps.ucla.edu

-	CAPS is open and has transitioned to Telehealth services ONLY.
-	Open Mon – Thurs: 8 am-6 pm and Fri: 8 am-5 pm.
-	As always, 24/7 crisis support is always available by phone at (310) 825-0768.


## Discrimination

UCLA is committed to maintaining a campus community that provides the stronget possible support for the intellectual and personal growth of all its members- students, faculty, and staff. Acts intended to create a hostile climate are unacceptable.  

  - To file an online incident report, visit: https://equity.ucla.edu/report-an-incident/  


## LGBTQ resource center

The LGBTQ resource center provides a range of education and advocacy services supporting intersectional identity development. It fosters unity; wellness; and an open, safe, inclusive environment for lesbian, gay, bisexual, intersex, transgender, queer, asexual, questioning, and same-gender-loving students, their families, and the entire campus community. Find it in the Student Activities Center, or via email lgbt\@lgbt.ucla.edu.  

  - Visit their website for more information: https://www.lgbt.ucla.edu/ and virtual upcoming events. 

## International students

The Dashew Center provides a range of programs to promote cross-cultural learning, language improvement, and cultural adjustment. Their programs include trips in the LA area, performances, and on-campus events and workshops.  

  -	Due to COVID-19, the Dashew Center has transitioned its operations to a remote setting.
  - Visit their website for more information: https://www.internationalcenter.ucla.edu/  
  - For COVID updates, visit https://www.internationalcenter.ucla.edu/covid-19-updates

## UCLA Undocumented Student Program

This program provides a safe space for undergraduate and graduate undocument students. USP supports the UndocuBruin community through personalized services and resources, programs, and workshops.  

  - Visit their website for more information: https://www.usp.ucla.edu/  
  - You can reach USP at usp@saonet.ucla.edu

## Student legal services

UCLA Student Legal Services provides a range of legal support to all registered and enrolled UCLA students. Some of their services include:  

  - Landlord/Tenant Relations (Including challenges during COVID)
  - Accident and Injury Problems
  - Domestic Violence and Harassment
  - Divorces and Other Family Law Matter  

Due to COVID, Student legal Services is closed to walk-ins.  

  - All services are by appointment only.  
  - For more information visit their website: http://www.studentlegal.ucla.edu/index.php  
  

## Students with Dependents

UCLA Students with Dependents provides support to UCLA studens who are parents, guardians, and caregivers. Some of their services include:  

- Information, referrals, and support to navigate UCLA (childcare, family housing, financial aid)
- Access to information about resources within the larger community
- On-site application and verification for CalFresh (food stamps) & MediCal and assistance with Cal Works/GAIN
- A quiet study space
- Family friendly graduation celebration in June  

For more information visit their website: https://www.swd.ucla.edu/

## Campus maps 

**Lactation Rooms** 

- [Map to lactation rooms on campus](https://ucla.app.box.com/v/2019-lactation-map)  

**Gender Inclusive restrooms**  

- [Map to gender inclusive restrooms](https://www.lgbt.ucla.edu/Portals/38/Documents/GIRR%20Map%2007-2019%20Compressed.pdf)  

**Campus accessibility**  

- [Campus accessibility map](http://map.ucla.edu/downloads/pdf/Access_08_21_15.pdf)


## Title IX Resources

Title IX prohibits gender discrimination, including sexual harassment, domestic and dating violence, sexual assault, and stalking.  If you have experienced sexual harassment or sexual violence, there are a variety of resources to assist you.  

- __CONFIDENTIAL RESOURCES__:You can receive confidential support and advocacy at the CARE Advocacy Office for Sexual and Gender-Based Violence, A233 Murphy Hall, CAREadvocate\@careprogram.ucla.edu, (310) 206-2465. Counseling and Psychological Services (CAPS) also provides confidential counseling to all students and can be reached 24/7 at (310) 825-0768.  

- __NON-CONFIDENTIAL RESOURCES__: You can also report sexual violence or sexual harassment directly to the University's Title IX Coordinator, 2255 Murphy Hall, titleix\@conet.ucla.edu, (310) 206-3417. Reports to law enforcement can be made to UCPD at (310) 825-1491. These offices may be required to pursue an official investigation.

*Faculty and TAs are required under the UC Policy on Sexual Violence and Sexual Harassment to inform the Title IX Coordinator should they become aware that you or any other student has experienced sexual violence or sexual harassment.*  

## Undergraduate Writing Center

Peer learning facilitators (PLFs) are undergraduates who understand the challenges of writing at UCLA. Scheduled appointment and walk-in options are available, see www.wp.ucla.edu/uwc for more information about writing programs and to get assistance with your writing.

-	Due to COVID-19, all physical UWC offices will be closed until further notice.
-	All UWC appointments are now online via Zoom and Google Docs.
-	Offer virtual drop-in appointments Mon – Thurs from 10am-9pm, Fri from 10am-3pm and Sun from 6-9pm.

For additional campus resources and student services, please review [this document](https://ucla.app.box.com/s/st51pify842ouoc24ae2r80s9sesavmy). 