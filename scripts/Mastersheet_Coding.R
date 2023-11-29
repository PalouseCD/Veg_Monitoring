###Veg Monitoring Yearly Mastersheet Code ###
###Tal Atkins ###
### 3/17/23 ###

#Install packages used if needed
install.packages("dplyr")
install.packages("openxlsx")
install.packages("rio")
install.packages("csvy")
install.packages("feather")
install.packages("fst")
install.packages("hexView")
install.packages("readODS")
install.packages("rmatio")
tinytex::install_tinytex()

library(tidyverse)
library(dplyr)
library(lubridate)
library(stringr)
library(tools)
library(readr)
library(anytime)
library(here)
library(data.table)
library(readxl)
library(tidyr)
library(data.table)
library(openxlsx)
library(rio)

here()
rm(list = ls())

#Create first dataframe, "my_files", so that R reads Excel files within the working directory. All files should be read and processed
my_files <- list.files(here("data", "Veg_Monitoring_Data", "2019_Datasheets"))

#Create another datatframe, "vegmon", where lapply will produce a list of the data from the "my_files" dataframe
#Vegmon will access "my_files" to retrieve and list all excel data present from sheet 10. The list of data will be located in "vegmon"
vegmon = lapply(here("data", "Veg_Monitoring_Data", "2019_Datasheets", my_files), function(i){x = read_excel(i, sheet = 10)
  x$file = i
  x
})

#"vegmon" is set to only read sheet 10 for each Excel file, being the "To Export" sheet
#Testing various Excel files in "vegmon" dataframe to ensure R is only reading sheet 10
vegmon[[1]]
vegmon[[2]]
vegmon[[9]]

#do.call will sort all the Excel data from sheet 10 in "vegmon" and bind the data to produce one main mastersheet containing all variables and values
#"vegmon" will produce a final mastersheet table for viewing
vegmon <- rbindlist(vegmon, fill = T)
vegmon$DATE <- ymd(vegmon$DATE)


#This function will export the "vegmon" data table to a new Excel file named "Mastersheet_2022"
write.csv(vegmon, here("data", "Mastersheets", "2019_Mastersheet.csv"))

