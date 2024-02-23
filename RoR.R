#' ---
#' title: "RoR Data"
#' output: html_document
#' date: "`r Sys.Date()`"
#' ---
#' 
## -----------------------------------------------------------------------------------------------------
if(!require(dplyr)) {install.packages("dplyr"); library(dplyr)}
if(!require(tidyverse)) {install.packages("tidyverse"); library(tidyverse)}
if(!require(wdman)) {install.packages("wdman"); library(wdman)}
if(!require(netstat)) {install.packages("netstat"); library(netstat)}
if(!require(xml2)) {install.packages("xml2"); library(xml2)}
if(!require(purrr)) {install.packages("purrr"); library(purrr)}
if(!require(readr)) {install.packages("readr"); library(readr)}
if (!require(usethis)) {install.packages("usethis"); library(usethis)}
if (!require(dotenv)) {install.packages("dotenv"); library(dotenv)}
if (!require(here)) {install.packages("here"); library(here)}
if (!require(readxl)) {install.packages("readxl"); library(readxl)}
if (!require(stringr)) {install.packages("stringr"); library(stringr)}
data <- tibble()
setwd("/Users/riley/Downloads")
data <- read.csv("./transactions-2024-01-01-2024-02-23 (1).csv")
years <- c(2019, 2020, 2021, 2022, 2023)
for (i in years) {
  tempdata <- read.csv(paste0("./transactions-", i, "-01-01-", i + 1,"-01-01 (1).csv"))
  data <- rbind(tempdata, data)
}
data$Date <- as.Date(data$Date, format="%Y-%m-%d")
data$Year <- format(data$Date, "%Y")
data$Gross.Sales <- as.numeric(gsub(",", "", gsub("\\$", "", data$Gross.Sales)))

#' 
## -----------------------------------------------------------------------------------------------------
sum_by_year <- aggregate(Gross.Sales ~ Year, data = data, FUN = sum)
# Revenue up to the release of Ramses in Wonderland
subset_data <- subset(sum_by_year, Year >= 2019 & Year <= 2022)
sales <- sum(subset_data$Gross.Sales)
paste0("Revenue up to the release of Ramses in Wonderland is $", formatC(sales, format = "f", digits = 2))
# Revenue up to the release of The Lost Tar Heel
paste0("Revenue up to the release of The Lost Tar Heel is $",  formatC(sum_by_year[5, 2], format = "f", digits = 2))
paste0("Room-over-Room growth for Ramses in Wonderland is ", round((sum_by_year[5, 2] / sales - 1) * 100, 2) - 1, "%")
# Revenue since the release of The Lost Tar Heel
paste0("Revenue since the release of The Lost Tar Heel is $", formatC(sum_by_year[6, 2], format = "f", digits = 2))
paste0("Room-over-Room growth for The Lost Tar Heel is ", round((sum_by_year[6, 2] / sum_by_year[5, 2] - 1) * 100, 2), "%")

