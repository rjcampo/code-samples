library(tidyverse)
library(AER)
library(stargazer)

PATH <- "C:/Users/RichardCampo/Documents/GitHub/code-samples"
setwd(PATH)

df_acs <- read.csv("acs2022.csv")

ggplot(df_acs, aes(x = EDUCDC, y = INCWAGE_LOG)) +
  geom_point(color = "black", alpha = 0.5) +
  geom_smooth(method = "lm", color = "red") +
  labs(
    x = "Years of Education",
    y = "Log Income",
    title = "Relationship between Education Level and ln(Income)"
    )

predictors <- c(
  "EDUCDC", "FEMALE", "AGE", "AGESQ", "WHITE", "BLACK", "HISPANIC", "MARRIED", 
  "NCHILD", "VET", "HSDIP", "COLDIP", "HSDIP-EDUCDC", "COLDIP-EDUCDC"
  )

formula <- as.formula(paste("INCWAGE_LOG ~", paste(predictors, collapse = "+")))

model <- lm(formula, data = df_acs)

stargazer(model, type = "text")
