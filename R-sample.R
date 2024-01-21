library(tidyverse)
library(AER)
library(stargazer)

# Set the working directory to the path
PATH <- "C:/Users/RichardCampo/Documents/GitHub/code-samples"
setwd(PATH)

# Read the CSV file
df_acs <- read.csv("acs2022.csv")

# Plotting the regression using ggplot2
ggplot(df_acs, aes(x = EDUCDC, y = INCWAGE_LOG)) +
  geom_point(color = "black", alpha = 0.5) +
  geom_smooth(method = "lm", color = "red") +
  labs(x = "Years of Education", y = "Log Income", title = "Relationship between Education Level and ln(Income)")

# Multiple linear regression using AER and stargazer
predictors <- c("EDUCDC", "FEMALE", "AGE", "AGESQ", "WHITE", "BLACK", "HISPANIC", 
                "MARRIED", "NCHILD", "VET", "HSDIP", "COLDIP", "HSDIP-EDUCDC", "COLDIP-EDUCDC")

# Create a formula for the model
formula <- as.formula(paste("INCWAGE_LOG ~", paste(predictors, collapse = "+")))

# Fit the model
model <- lm(formula, data = df_acs)

# Display model summary using stargazer
stargazer(model, type = "text")
