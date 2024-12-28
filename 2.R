# קובץ זה מבצע ניתוח תיאורי לנתוני Stroop:
# חישוב ממוצעים, סטיות תקן ואחוזי ניסיונות.
# נכתב על ידי:תהילה מן]
# תאריך: 28/12/2024

load("raw_data.RData")
cat("Number of unique subjects:", length(unique(df$subject)), "\n")

df_filtered <- df |>
  filter(!is.na(response_time)) |>
  filter(response_time >= 0.3 & response_time <= 3)

subject_stats <- df_filtered |>
  group_by(subject) |>
  summarise(
    total_trials = n(),
    percent_kept = (n() / 400) * 100 
  )
print(subject_stats)

stats_summary <- subject_stats |>
  summarise(
    mean_percent_kept = mean(percent_kept, na.rm = TRUE),
    sd_percent_kept = sd(percent_kept, na.rm = TRUE)
  )
print(stats_summary)

save(df_filtered, file = "filtered_data.RData")