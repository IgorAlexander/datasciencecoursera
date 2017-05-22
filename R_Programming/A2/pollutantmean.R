pollutantmean <- function(directory, pollutant, id = 1:332){
  monitor_means <- c()
  for (city_number in id){
    if (city_number < 10){
      data <- read.csv(paste(directory, "/00", city_number, ".csv", sep = ''))
    } else if (city_number < 100){
      data <- read.csv(paste(directory, "/0", city_number, ".csv", sep = ''))
    } else {
      data <- read.csv(paste(directory, "/", city_number, ".csv", sep = ''))
    }
    pollutant_vector <- data[[pollutant]]
    monitor_means <- c(monitor_means, mean(pollutant_vector[!is.na(pollutant_vector)]))
  }
  mean(monitor_means[!is.na(monitor_means)])
}