install.packages("data.table")
install.packages("tidytext")
library(data.table)
library(tidytext)
library(tidyverse)
library(dplyr)

# Location of rap data
dataDir = "/Users/zacharysnoek/Programming/r/rap-data"
# Location of plots script
plotsScript = "/Users/zacharysnoek/Programming/r/rap-analyses/plots.R"
# Output directory of plots
output = "/Users/zacharysnoek/Programming/r/rap-analyses/png"

source(plotsScript)
setwd(dataDir)

# Load dataset
initial <- fread("dataset_0.csv", sep2 = "|")
initial[, collaborators := NULL]

# String cleaning
initial <- initial %>% 
  mutate(lyrics = gsub("\\[.*?\\]", "", lyrics)) %>%
  mutate(lyrics = gsub("\\(.*?\\)", "", lyrics)) %>%
  mutate(lyrics = gsub("\\\\", "", lyrics))

# Create a list of unique artsts
artists <- initial$artist %>% unique()
# Use a small subset to test with
artists <- artists[1:10]

simple_wordCount(artists, 50, output)