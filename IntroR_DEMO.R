###########################################################################
# Stevens Institute of Technology
# College of Arts and Sciences
# Purpose: Introduction to R - Class 2
# Author: Robert Vidigal
# Version: March 7th
# Class materials available at: https://github.com/robertvidigal/IntroR-spring2023
# RStudio is also available online: http://rstudio.cloud
###########################################################################

# # -----------------------------------------------------------------------
# --- Today RStudio Topics ---
# # -----------------------------------------------------------------------
### Entering data in R (variable types).
### Using R operators with data frames (data structures).

# # -----------------------------------------------------------------------
# LET'S BEGIN!
# # -----------------------------------------------------------------------
rm(list=ls()) # Cleaning R Environment

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

### Inputting data manually
minidf<-data.frame(
  "name"=c("Sofia", "Pedro", "Juan", "Emma", "Fred", "Sasha", "Rachel", "Erica", "Amanda", "Maya"), # Individuals
  "age"=c(23, 22, 44, 56, 90, 18, 77, 31, 20, 23), # Age in years
  "gender"=c(1, 0, 0, 1, 0, 0, 1, 1, 1, 2), # Men 0, Women 1, Non-binary 2
  "race"=c("White", "Hispanic", "Hispanic", "White", "White", "White", "White", "White", "Hispanic", "White"), # Class?
  "income"=c(25000, 50000, 28000, 60000, 19000, 20000, 33000, 77000, 50000, 64000), # Income per YEAR in USD
  "ideology"=c(1, 3, 4, 5, 4, 5, 6, 7, 2, 4), # 7-point scale: extreme left (1) and extreme right (7)
  "extraversion"=c(0.22, 0, 0.77, 1, 0.67, 0.45, 0.65, 0.5, 0.77, 0.33), # Ranges from 0 to 1
  "polknow"=c(2, 3, 4, 5, 6, 2, 0, 4, 3, 6), # Ranges from 0 to 6
  "vaccinated"=c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE), # Logical
  "vote2022"=c(FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE,  FALSE, TRUE), # Logical
  "risk_averse"=c(1, 4, 1, 4, 4, 0, 3, 2, 3, 3) # Ranges from 0 to 4
)

# GET TO KNOW THE DATA!
# # -------------------------------------------------------------------------------------------

# Visualizing the data.frame() object
minidf; print(minidf) #
View(minidf) # 

# -- Attributes functions
names(minidf) # 
nrow(minidf) # 
ncol(minidf) #
str(minidf) #

# -- Class functions
class(minidf$race)
is.factor(minidf$race) # 
is.logical(minidf$vote2022) # 
!is.numeric(minidf$age) # 
!is.character(minidf$name) # 

# # -----------------------------------------------------------------------
# USING R OPERATORS: VARIABLES TRANSFORMATION
# # -----------------------------------------------------------------------
# Let's use some R operators to understand and transform our data.

# --- Find how many Women are in the sample
table(minidf$gender) # 

## -- Find what's the individual income by month
table(minidf$income)
minidf$income_month<-minidf$income/12 # 

table(minidf$income_month) # 

# -- Find the number of respondents by income
table(minidf$income<30000) # 
table(minidf$income_month>=5000) # 

# --- Find the % people are vaccinated in the sample
table(minidf$vaccinated==TRUE) # '==' operator
prop.table(table(minidf$vaccinated))*100

# # -------------------------------------------------------------------------------------------
# Now let's change a couple of variables to make data interpretation easier.

# -- Reverse code "risk_averse" to "risk_taker"
table(minidf$risk_averse)
minidf$risk_taker<-(minidf$risk_averse*-1)+4
table(minidf$risk_taker)

## -- Reverse code "extraversion" to "introversion"
table(minidf$extraversion)
minidf$introversion<-(minidf$extraversion*-1)+1
table(minidf$introversion)

# # -----------------------------------------------------------------------
# Now, lets transform variables to the factor data type.
# The factor type will make data use easier in future classes 
# (i.e., modeling or plotting).
# # -----------------------------------------------------------------------

# --- Transform ideology (numeric) into factor (categorical)
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

# --- Transform vaccinated (logical) into factor (categorical)
# # -------------------------------------------------------------------------------------------
table(minidf$vaccinated)
minidf$vaccinated<-factor(minidf$vaccinated, levels=c(TRUE, FALSE),
                          labels=c("Vaccinated", "Non-vaccinated"))
table(minidf$vaccinated)

# --- Transform race (character) into factor (categorical)
# # -------------------------------------------------------------------------------------------
table(minidf$race); class(minidf$race)
minidf$race<-factor(minidf$race, levels=c("Hispanic", "White"))
is.factor(minidf$race)
str(minidf$race)

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