library(dplyr)

# חישוב סטטיסטיקות תיאוריות
descriptive_stats <- function(df, subject_start = NULL, subject_end = NULL) {
  
  if (nrow(df) < 10) {
    stop("data is too short")
  }
  
  if (!is.null(subject_start) && !is.null(subject_end)) {
    df <- df |> filter(subject >= subject_start & subject <= subject_end)
  }
  
  results <- data.frame(
    variable = character(),
    type = character(),
    stat = character(),
    value = character(),
    stringsAsFactors = FALSE
  )
  
  for (var in names(df)) {
    data <- df[[var]]
    
    if (class(data) %in% c("numeric", "integer")) {
      results <- rbind(results, data.frame(variable = var, type = "Continuous", stat = "Min", value = min(data, na.rm = TRUE)))
      results <- rbind(results, data.frame(variable = var, type = "Continuous", stat = "Max", value = max(data, na.rm = TRUE)))
      results <- rbind(results, data.frame(variable = var, type = "Continuous", stat = "Mean", value = mean(data, na.rm = TRUE)))
    } else if (class(data) %in% c("factor", "character")) {
      results <- rbind(results, data.frame(variable = var, type = "Categorical", stat = "Levels", value = paste(levels(factor(data)), collapse = ", ")))
      results <- rbind(results, data.frame(variable = var, type = "Categorical", stat = "Counts", value = paste(table(data), collapse = ", ")))
    }
  }
  
  return(results)
}
