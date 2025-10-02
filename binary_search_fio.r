binary_search_fio_first <- function(data, target_fio) {
  low <- 1
  high <- nrow(data)
  result <- -1
  
  while (low <= high) {
    mid <- floor((low + high) / 2)
    current_fio <- data$ФИО[mid]
    
    # Используем встроенное сравнение с учетом локали
    comparison <- compare(current_fio, target_fio)
    
    if (comparison == 0) {
      # Нашли совпадение, но продолжаем искать в левой части
      result <- mid
      high <- mid - 1
    } else if (comparison < 0) {
      low <- mid + 1
    } else {
      high <- mid - 1
    }
  }
  
  return(result)
}

# Функция сравнения с учетом русской локали
compare <- function(str1, str2) {
  # Создаем временный вектор и используем order
  temp <- c(str1, str2)
  ordered <- order(temp)
  
  if (ordered[1] == 1 && ordered[2] == 2) return(-1)  # str1 < str2
  if (ordered[1] == 2 && ordered[2] == 1) return(1)   # str1 > str2
  return(0)  # равны
}
