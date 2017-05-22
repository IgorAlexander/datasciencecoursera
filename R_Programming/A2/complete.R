complete <- function(directory, id = 1:332){
  id_vector <- c()
  count_vector <- c()
  for (city_number in id){
    if (city_number < 10){
      data <- read.csv(paste(directory, "/00", city_number, ".csv", sep = ''))
    } else if (city_number < 100){
      data <- read.csv(paste(directory, "/0", city_number, ".csv", sep = ''))
    } else {
      data <- read.csv(paste(directory, "/", city_number, ".csv", sep = ''))
    }
    id_vector <- c(id_vector, city_number)
    count_vector <- c(count_vector, nrow(na.omit(data)))
  }
  data.frame(id = id_vector, nobs = count_vector)
}