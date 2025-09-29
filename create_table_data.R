
library(readxl)
library(writexl)

options(digits = 20)

payment_table <- read.table(pipe("pbpaste"), sep = "\t", dec = ",", header = TRUE); payment_table

t_date <- readline(prompt = "Сегодняшняя дата: ")
month <- rbind(c(1, "Январь"), c(2, "Февраль"), c(3, "Март"), c(4, "Апрель"), c(5, "Май"), c(6, "Июнь"), c(7, "Июль"), c(8, "Август"), c(9, "Сентябрь"), c(10, "Октябрь"), c(11, "Ноябрь"), c(12, "Декабрь")); month
date_obj <- as.Date(t_date, format = "%d.%m.%Y")
month_number <- as.numeric(format(date_obj, "%m"))
t_mounth <- month[month_number, 2]; t_mounth

tax_table <- read_excel("PATH", 2); tax_table

headers <- names(tax_table)
result_table <- data.frame(matrix(ncol = length(headers), nrow = 0))
colnames(result_table) <- headers

for (i in 1:nrow(payment_table)) {
  for (j in 1:nrow(tax_table)) {
    if (payment_table$ФИО[i] == tax_table$Налогоплатильщик[j]) {
      result_table <- rbind(result_table, c(tax_table[j,1:8], t_mounth, t_date, t_date, tax_table[j,12], payment_table$Полная.сумма.выплаты[i], tax_table[j, 14:15], payment_table$Полная.сумма.выплаты[i], tax_table[j, 17:21], t_date, payment_table[i, 9], payment_table[i, 9], tax_table[j, 25:26]))
    }
  }
}
write_xlsx(result_table, "PATH")
print(result_table)

# Преобразуем числовые колонки
df[] <- lapply(df, function(x) {
  if(is.numeric(x)) {
    format(x, decimal.mark = ",", na.encode = FALSE)
  } else {
    x
  }
})
