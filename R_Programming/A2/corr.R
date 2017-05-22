source("complete.R")

corr <- function(directory, threshold = 0){
  data <- complete(directory)
  data_threshold <- data[data$nobs > threshold, ]
  if (nrow(data_threshold) == 0){
    return(numeric(0))
  }
  
  corr_values <- c()
  
  ids <- data_threshold$id
  for (city_number in ids){
    if (city_number < 10){
      data <- read.csv(paste(directory, "/00", city_number, ".csv", sep = ''))
    } else if (city_number < 100){
      data <- read.csv(paste(directory, "/0", city_number, ".csv", sep = ''))
    } else {
      data <- read.csv(paste(directory, "/", city_number, ".csv", sep = ''))
    }
    
    data <- na.omit(data)
    
    corr_values <- c(corr_values, cor(data$sulfate, data$nitrate))
  }
  corr_values
}