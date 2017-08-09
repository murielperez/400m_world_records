library(tidyverse)
library(readr)
library(lubridate)
library(stringr)

file_name <- "./400m_wr.txt"

data <- read_fwf(file          = file_name, 
                 col_positions = fwf_empty(file_name, n = 3700))

colnames(data) <- c("position_abs", 
                    "time", 
                    "name", 
                    "country", 
                    "date_birth", 
                    "position_venue", 
                    "venue", 
                    "date")

data %>% 
  mutate(date_birth = paste(substr(date_birth, 1, 6), "19", substr(date_birth, 7, 8), sep = ""), 
         date_birth = dmy(date_birth), 
         date = dmy(date), 
         time = substr(time, 1, 5) %>% as.double()) %>%
  write_csv("clean_400m_wr.csv")
  
