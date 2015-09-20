complete <- function(directory, id = 1:332) {
  results <- data.frame()
  
  for (i in id) {
    file_id <- sprintf("%03d", i)
    filename <- paste(file_id, "csv", sep = ".")
    data <- read.csv(file.path(directory, filename))
    
    complete_records <- !is.na(data$sulfate) & !is.na(data$nitrate)
    result <- c(i, sum(complete_records))
    results <- rbind(results, result)
  }
  
  names(results) <- c("id", "nobs")
  results
}