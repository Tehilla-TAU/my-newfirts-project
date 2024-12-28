# קובץ זה מציג פיגר לתוצאות נתוני = Stroop:
# נכתב על ידי:תהילה מן]
# תאריך: 28/12/2024

load("raw_data.RData")
# יצירת נתונים לדוגמה
conditions <- c("Congruent", "Incongruent")
mean_rt <- c(500, 700)

# יצירת גרף
barplot(mean_rt,
        names.arg = conditions,
        col = c("skyblue", "orange"),
        main = "Stroop Task Results",
        ylab = "Mean Reaction Time (ms)",
        xlab = "Condition")

# שמירת הגרף כקובץ PNG
png("stroop_results.png")
barplot(mean_rt,
        names.arg = conditions,
        col = c("skyblue", "orange"),
        main = "Stroop Task Results",
        ylab = "Mean Reaction Time (ms)",
        xlab = "Condition")
dev.off()
