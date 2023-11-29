### Veg Monitoring Cleanup Combination ###
### Tal Atkins ###
### 3/15/23 ###

library(tidyverse)
library(dplyr)
library(lubridate)
library(stringr)
library(tools)
library(readr)
library(anytime)
library(here)
library(data.table)

here()

files <- list.files(here("data", "Mastersheets"),pattern = "*.csv")
files

data <- lapply(here("data", "Mastersheets", files), read.csv)
data<- rbindlist(data, fill = T)
data <- data[,-c(1, 18)]
data$"TREE TUBES" <- coalesce(data$"Tree.tubes", data$"Tree.Tubes")
data$"WEED MAT" <- coalesce(data$"Weed.mat", data$"Weed.Mat")
data <- data[,-c(15, 16, 18, 19)]
data <- data[,c(1:15, 22:23, 16:17, 18:21)]

data$PROJECT <- as.factor(data$PROJECT)

levels(data$PROJECT)

colnames(data)[colnames(data) == "SURVERYORS"] <- "SURVEYORS"
colnames(data)[colnames(data) == "PROJECT.PLANNER"] <- "PROJECT PLANNER"
colnames(data)[colnames(data) == "Protocol"] <- "PROTOCOL"
colnames(data)[colnames(data) == "STEMS.PER.ACRE"] <- "STEMS PER ACRE"
colnames(data)[colnames(data) == "AVG.CANOPY.COVERAGE"] <- "% WOODY COVER"
colnames(data)[colnames(data) == "PERC.VIGOROUS"] <- "% VIGOROUS"
colnames(data)[colnames(data) == "PERC.STRESSED"] <- "% STRESSED"
colnames(data)[colnames(data) == "PERC.DEAD"] <- "% DEAD"
colnames(data)[colnames(data) == "AVG.BROWSE.CODE"] <- "AVERAGE BROWSE CODE"
colnames(data)[colnames(data) == "AVG.GRASS.CODE"] <- "AVERAGE GRASS CODE"
colnames(data)[colnames(data) == "XS.Comm"] <- "CROSS SECTION MOST COMMON PLANT COMMUNITY"
colnames(data)[colnames(data) == "Greenline.Comm"] <- "GREENLINE MOST COMMON PLANT COMMUNITY"
colnames(data)[colnames(data) == "General.Site.Notes"] <- "GENERAL SITE NOTES"
colnames(data)[colnames(data) == "Weed.mat.roll.size"] <- "WEED MAT ROLL SIZE"
colnames(data)[colnames(data) == "Tube.type"] <- "TUBE TYPE"
colnames(data)[colnames(data) == "Plants..0.5.m"] <- "PLANTS <0.5 M"
colnames(data)[colnames(data) == "Plants.0.5..1.m"] <- "PLANTS 0.5- 1 M"
colnames(data)[colnames(data) == "Plant.1.2.m"] <- "PLANTS 1-2 M"
colnames(data)[colnames(data) == "Plants.2.m.or.taller"] <- "PLANTS 2 M OR TALLER"
                 

data$PROJECT <- recode_factor(data$PROJECT, murray1 = "Murray 1",
                              Murray2 = "Murray 2",
                              "Murray East" = "Murray 2",
                              Uhlenkot = "Uhlenkott",
                              "B. Moore" = "Barry Moore",
                              "Cadle-Berry" = "Caddle-Berry",
                              "Cadle Berry" = "Caddle-Berry",
                              PETTITT = "Pettitt", 
                              GEARHART = "Gearhart")

levels(data$PROJECT)

write.csv(data, here("outputs", "Mastersheet_All_Years.csv"))


