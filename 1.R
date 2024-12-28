# קובץ זה מבצע עיבוד מקדים לנתוני Stroop
# נכתב על ידי:תהילה מן]
# תאריך:28.12.24 

#### RAW DATA ----
setwd("C:\\Users\\ASUS\\Documents\\R\\2025\\week 7")

files_names <- dir() 
df <- data.frame()
for (file in files_names) {
  df <- rbind(df, read.csv(file))  
}

library(dplyr)

df <- df |>
  mutate(
    task = ifelse(grepl("ink_naming", condition), "Naming Color", "Reading Word"),
    congruency = ifelse(grepl("incong", condition), "Incongruent", "Congruent")
  )

df <- df |>
  mutate(
    accuracy = ifelse(participant_response == correct_response, 1, 0)
  )

df <- df |>
  select(subject, task, congruency, block, trial, accuracy, rt) |>
  mutate(
    subject = as.factor(subject),
    task = factor(task, levels = c("Reading Word", "Naming Color")),
    congruency = factor(congruency, levels = c("Congruent", "Incongruent")),
    block = as.factor(block),
    trial = as.factor(trial),
    accuracy = as.numeric(accuracy),
    response_time = as.numeric(rt)
  )

save(df, file = "raw_data.RData")
