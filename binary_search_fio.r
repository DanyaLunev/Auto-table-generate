# Функция бинарного поиска по ФИО
binary_search_fio <- function(data, target_fio) {
  low <- 1
  high <- nrow(data)
  
  while (low <= high) {
    mid <- floor((low + high) / 2)
    current_fio <- data$ФИО[mid]
    
    # Сравниваем ФИО (регистронезависимо)
    comparison <- tolower(current_fio) == tolower(target_fio)
    
    if (comparison) {
      return(mid)  # Найден элемент, возвращаем индекс
    } else if (tolower(current_fio) < tolower(target_fio)) {
      low <- mid + 1
    } else {
      high <- mid - 1
    }
  }
  
  return(-1)  # Элемент не найден
}
