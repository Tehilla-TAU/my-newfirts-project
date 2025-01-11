

N <- 100

# יצירת Data Frame
df <- data.frame(
  subject        = seq(1, N, 1),
  gender         = factor(sample(c("Male", "Female", "Other"), N, replace = TRUE)),
  sleep_duration = runif(N, 2, 12),
  age            = runif(N, 18, 80),
  depression     = runif(N, 0, 100),
  response_time  = runif(N, 200, 6000)
)

# הגדרת נתיב מלא לשמירה
save(df, file = "analysis.rdata")
