# Room-over-Room (RoR) Growth

## Project Overview
This project involves analyzing transaction data to understand sales trends over several years. It calculates annual sales, revenue up to specific product releases, and growth metrics. The analysis is performed using R, with a focus on data manipulation and aggregation tasks.

## Date of Analysis
The analysis is dynamically set to run on the current date, using `Sys.Date()` to ensure the data reflects the most up-to-date information available.

## Dependencies
The project relies on several R packages for data manipulation, reading, and environmental management:
- dplyr
- tidyverse
- wdman
- netstat
- xml2
- purrr
- readr
- usethis
- dotenv
- here
- readxl
- stringr

These packages are checked for at the beginning of the script, and any missing packages are automatically installed and loaded.

## Data Preparation
The data is initially stored in CSV files named according to the year of the transactions they contain. The script sets the working directory, reads the transaction data from these files, and combines them into a single dataset.

Key steps in preparing the data include:
- Reading multiple CSV files for different years.
- Binding these files into a single dataset.
- Converting the `Date` column to the Date format.
- Extracting the year from the `Date` column.
- Cleaning and converting the `Gross.Sales` column from a character to a numeric format, ensuring all currency values are correctly formatted for analysis.

## Analysis
The analysis consists of several parts:
1. **Aggregate Gross Sales by Year**: Calculating total sales for each year in the dataset.
2. **Revenue Calculation for Specific Periods**: 
   - Revenue up to the release of "Ramses in Wonderland" and "The Lost Tar Heel".
   - Room-over-Room growth calculations for these periods.
3. **Displaying Results**: The results are formatted to display revenue and growth metrics clearly, with values rounded and presented in a user-friendly format.
