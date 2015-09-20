corr <- function(directory, threshold = 0) {
  results <- c()
  
  for (i in list.files(directory, full.names = TRUE)) {
    data <- read.csv(i)
    
    complete_records <- !is.na(data$sulfate) & !is.na(data$nitrate)
    if (sum(complete_records) > threshold) {
      correlation <- cor(data$nitrate, data$sulfate, use = "complete.obs")
      results <- c(results, correlation)
    }
  }
  
  results
}