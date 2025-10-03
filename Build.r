# Установка с GitHub
if (!require("devtools")) install.packages("devtools")
devtools::install_github("DesktopDeployR/DesktopDeployR")

library(DesktopDeployR)

build_app(
  appName = "MyShinyApp",
  appDir = getwd(),
  appVersion = "1.0.0",
  includeR = TRUE,
  includeChrome = TRUE,
  includePandoc = TRUE,
  privilege = "user" # или "admin"
)
