### Veg Monitoring Data Tables ###
### Tal Atkins ###
### 3/16/23 ###

library(flextable)
library(forcats)
library(tidyverse)
library(dplyr)
library(lubridate)
library(stringr)
library(tools)
library(readr)
library(anytime)
library(data.table)
library(here)

here()

files <- list.files(here("outputs"),pattern = "*.csv")
files

data <- read.csv(here("outputs", files))

data <- data[,-c(1)]

data$DATE <- as.POSIXct(data$DATE)

data$PROJECT <- as.factor(data$PROJECT)

levels(data$PROJECT)

Murray1 <- data[data$PROJECT == "Murray 1", ]
Murray2 <- data[data$PROJECT == "Murray 2", ]
Uhlenkott <- data[data$PROJECT == "Uhlenkott", ]
BarryMoore <- data[data$PROJECT == "Barry Moore", ]
CadleBerry <- data[data$PROJECT == "Caddle-Berry", ]
Pettitt <- data[data$PROJECT == "Pettitt", ]
Beyer <- data[data$PROJECT == "Beyer", ]
Bidle <- data[data$PROJECT == "Bidle", ]
Brown <- data[data$PROJECT == "Brown", ]
BrownPhaseV <- data[data$PROJECT == "Brown Phase V", ]
CobosWhitmore <- data[data$PROJECT == "Cobos/Whitmore", ]
Cornelius <- data[data$PROJECT == "Cornelius", ]
DStout <- data[data$PROJECT == "D Stout", ]
Farnsworth <- data[data$PROJECT == "Farnsworth", ]
Farrand <- data[data$PROJECT == "Farrand", ]
Gearhart <- data[data$PROJECT == "GEARHART", ]
Johnson <- data[data$PROJECT == "Johnson", ]
Jones <- data[data$PROJECT == "Jones", ]
Jovanovich <- data[data$PROJECT == "Jovanovich", ]
LMooreWetland <- data[data$PROJECT == "L.Moore Wetland", ]
LandonMoore <- data[data$PROJECT == "Landon Moore", ]
Matthews <- data[data$PROJECT == "Matthews", ]
ParadiseCreekEast <- data[data$PROJECT == "Paradise Creek East", ]
Rawls <- data[data$PROJECT == "Rawls", ]
Rice <- data[data$PROJECT == "Rice", ]
SpencerWetland <- data[data$PROJECT == "Spencer Wetland", ]
StoutBrothers <- data[data$PROJECT == "Stout Brothers", ]
Ulibarri <- data[data$PROJECT == "Ulibarri", ]
Weber <- data[data$PROJECT == "Weber", ]
Whitmore <- data[data$PROJECT == "Whitmore", ]
WSURiparianRoseCreek <- data[data$PROJECT == "WSU Riparian (Rose Creek)", ]

my_path <- here("outputs", "All_Years_Per_Site", "/")

dataframes<-Filter(function(x) is.data.frame(get(x)) , ls())

dataframes

for(i in 1:length(dataframes)) {
  write.csv(get(dataframes[i]), 
             paste0((my_path),
                    dataframes[i],
                    ".csv"),
             row.names = FALSE)
}

