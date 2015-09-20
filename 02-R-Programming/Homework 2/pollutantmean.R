pollutantmean <- function(directory, pollutant, id = 1: 332) {
  data <- data.frame()
  for (i in id) {
    file_id <- sprintf("%03d", i)
    filename <- paste(file_id, "csv", sep = ".")
    new_data <- read.csv(file.path(directory, filename))
    data <- rbind(data, new_data)
  }
  
  if (pollutant == "nitrate") {
    mean(data$nitrate, na.rm = TRUE)
  } else {
    mean(data$sulfate, na.rm = TRUE)
  }
}