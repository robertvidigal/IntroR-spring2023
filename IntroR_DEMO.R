###########################################################################
# Stevens Institute of Technology
# College of Arts and Sciences
# Purpose: Introduction to R
# Author: Robert Vidigal
# Version: March 7th
# Materials available at: https://github.com/robertvidigal/IntroR-spring2023
###########################################################################
rm(list=ls())
# # -----------------------------------------------------------------------
# --- Today RStudio Topics ---
# # -----------------------------------------------------------------------
### Entering data in R (variable types).
# 1. We will learn common variable types transformations.

### Using R operators with data frames (data structures). 
# 2. We will learn R functions to explore data frames structure.

# # -----------------------------------------------------------------------
# ENTERING DATA IN R: VARIABLE TYPES
# # -----------------------------------------------------------------------

# There are multiple ways to enter/import data in R.
# The simplest way is to enter it manually.

# --- Assignment Operators 
# Remember: '<-' is used to assign data to a variable or data frame.
# Remember: '$' is used to call variables in a data frame.

# --- Creating a data.frame object
# # -------------------------------------------------------------------------------------------
# Let's suppose we collected survey answers on some political, psychological, 
# and demographic characteristics.

minidf<-data.frame(
  "name"=c("Sofia", "Pedro", "Juan", "Emma", "Fred", "Sasha", "Rachel", "Erica", "Amanda", "Maya"), # Individuals
  "age"=c(23, 22, 44, 56, 90, 18, 77, 31, 20, 23), # Age in years
  "gender"=c(1, 0, 0, 1, 0, 0, 1, 1, 1, 2), # Men 0, Women 1, Non-binary 2
  "ethnicity"=c("Non-hispanic", "Hispanic", "Non-hispanic", "Non-hispanic", "Non-hispanic", "Non-hispanic", "Non-hispanic", "Non-hispanic", "Hispanic", "Non-hispanic"), # Hispanic Ethnicity
  "income"=c(25000, 50000, 28000, 60000, 19000, 25000, 33000, 77000, 50000, 64000), # Income per YEAR in USD
  "ideology"=c(1, 3, 4, 5, 4, 5, 6, 7, 2, 4), # 7-point: extreme left (1) to extreme right (7)
  "extraversion"=c(0.22, 0, 0.77, 1, 0.67, 0.45, 0.65, 0.5, 0.77, 0.22), # Ranges from 0 to  1
  "polknow"=c(2, 3, 4, 5, 6, 2, 0, 4, 3, 6), # Ranges from 0 to 6
  "vaccinated"=c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE), # Logical
  "vote2022"=c(FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE,  FALSE, TRUE), # Logical
  "risk_averse"=c(1, 4, 1, 4, 4, 0, 3, 2, 3, 3) # Ranges from 0 to 4
)

# # -------------------------------------------------------------------------------------------
# LET'S GET TO KNOW THE DATA
# # -------------------------------------------------------------------------------------------

# The data.frame() object
minidf; print(minidf) #
View(minidf) # 

# -- Attributes functions
names(minidf) # Name of columns
nrow(minidf) # Number of rows
ncol(minidf) # Number of columns
str(minidf) # Structure

# -- Class functions
class(minidf$ethnicity)
is.factor(minidf$ethnicity) # FALSE
is.logical(minidf$vote2022) # TRUE
!is.numeric(minidf$age) # 
!is.character(minidf$name) # 

# # -----------------------------------------------------------------------
# USING R OPERATORS: VARIABLES TRANSFORMATION
# # -----------------------------------------------------------------------
# Let's use some R operators to understand and transform our data.

# --- Find how many Women are in the sample.
minidf$gender
table(minidf$gender) # 

## -- Find what's the individual income by month.
table(minidf$income)
minidf$income_month<-minidf$income/12
table(minidf$income_month) # 

# -- Find the % of respondents by yearly and monthly income threshold.
minidf$income<30000 # Logical operator
table(minidf$income<30000) # Counts
proportions(table(minidf$income<30000)) # Proportions
proportions(table(minidf$income<30000))*100 # Percentages

# --- Find the % people are Hispanic in the sample.
table(minidf$ethnicity=="Hispanic") # '==' operator
table(minidf$ethnicity!="Non-hispanic") # '!=' operator

# Now let's change a couple of variables to make data interpretation easier.
# # -------------------------------------------------------------------------------------------
# -- Reverse code "risk_averse" to "risk_taker" (higher values indicate more risk-taking).
table(minidf$risk_averse)
minidf$risk_taker<-(minidf$risk_averse*-1)+4
table(minidf$risk_taker)

## -- Reverse code "extraversion" to "introversion" (higher values indicate more introvert).
table(minidf$extraversion)
minidf$introversion<-(minidf$extraversion*-1)+1
table(minidf$introversion)

# # -----------------------------------------------------------------------
# Now, lets transform variables to the factor data type.
# The factor type will make data use easier in future classes 
# (i.e., modeling or plotting).
# # -----------------------------------------------------------------------

# --- Transform ideology (numeric) into factor (categorical).
# # -------------------------------------------------------------------------------------------
table(minidf$ideology)
minidf$ideo_factor<-factor(minidf$ideology, levels=c(1,2,3,4,5,6,7), 
                           labels=c("Extreme-left",
                                    "Left",
                                    "Center-left",
                                    "Independent",
                                    "Center-right",
                                    "Right",
                                    "Extreme-right")) # 
table(minidf$ideo_factor)

# --- Transform vaccinated (logical) into factor (categorical).
# # -------------------------------------------------------------------------------------------
table(minidf$vaccinated)
minidf$vaccinated<-factor(minidf$vaccinated, levels=c(TRUE, FALSE),
                          labels=c("Vaccinated", "Non-vaccinated"))
table(minidf$vaccinated)

# --- Transform ethnicity (character) into factor (categorical).
# # -------------------------------------------------------------------------------------------
table(minidf$ethnicity); class(minidf$ethnicity)
minidf$hispanic<-factor(minidf$ethnicity, levels=c("Non-hispanic", "Hispanic"))
is.factor(minidf$hispanic)
str(minidf$hispanic)

minidf$hispanic

# # -----------------------------------------------------------------------
### CODING EXERCISES
# # -----------------------------------------------------------------------

# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # ---
# 1. Transform the "gender" variable into a factor variable.
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # ---

# ANSWER:

# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # ---
# 2. Find the year a respondent was born using their "age" variable.
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # ---

# ANSWER:

# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # ---
# 3. Your last task is to create a data.frame() object using the data below. 
# --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # --- # ---

# The data show the score (from 0 to 20) for 20 different students, 
# some of whom are male and some female, and some of whom were taught using 
# **positive** reinforcement (i.e., being nice), and others who were taught using
# **negative** reinforcement (i.e., punishment). 

        ### # -------------------------------------------------- # ###
        ### || ------- MALE ------- || ------- FEMALE ------- || # ###
        ###   Negative |  Positive  ||   Negative |  Positive  | # ###
        ###     10     |     15     ||      6     |     12     | # ###
        ###      9     |     14     ||      7     |     10     | # ###
        ###      8     |     18     ||      5     |      7     | # ###
        ###      8     |     13     ||      4     |     20     | # ###
        ###      7     |     13     ||      5     |     13     | # ###
        ### ---------------------------------------------------- # ###

### TIP: The data will not be entered in the same way that they are laid out above.
### You will have to wrangle the table information above in 3 variables:   
### "score", "gender", and "treatment"

# ANSWER:

###########################################################################
# --- NEXT CLASS: 
# More on data structures & data transformation functions.
# Reading in and exporting out data.
###########################################################################












#minidf <- minidf %>% dplyr::slice(rep(seq_len(nrow(.)), 250)) # 10 (nrow) * 250