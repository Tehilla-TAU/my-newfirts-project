setwd("C:/Users/ASUS/Desktop/R_Project")
load("analysis.rdata")
source("functions.R")

results <- descriptive_stats(df, subject_start = 10, subject_end = 20)
print(results)
save(results, file = "results.rdata")
View(results)