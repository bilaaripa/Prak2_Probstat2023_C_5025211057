# ------------ NO 4 ---------------

# Install packages if needed
# install.packages("readr")
# install.packages("multcompView")
# install.packages("dplyr")

library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

data_url <- "https://drive.google.com/uc?export=download&id=1pICtCrf61DRU86LDPQDJmcKiUMVt9ht4"
GLASSTEMPLIGHT <- readr::read_csv(data_url)

head(GLASSTEMPLIGHT)

str(GLASSTEMPLIGHT)

# 4a 
ggplot(data = GLASSTEMPLIGHT, aes(x = Temp, y = Light)) +
  geom_point() +
  facet_grid(.~Glass, labeller = label_both)

# 4b 
GLASSTEMPLIGHT$Glass <- as.factor(GLASSTEMPLIGHT$Glass)
GLASSTEMPLIGHT$Temp_Factor <- as.factor(GLASSTEMPLIGHT$Temp)

str(GLASSTEMPLIGHT)

anova <- aov(Light ~ Glass * Temp_Factor, data = GLASSTEMPLIGHT)
summary(anova)

# 4c
data_summary <- GLASSTEMPLIGHT %>%
  group_by(Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))

# Print the summary statistics
print(data_summary)
