#script for question 5

library(dplyr)
library(ggplot2)

#importing data and checking structure
viriondata <- read_csv("question-5-data/Cui_etal2014.csv")
str(viriondata)
head(viriondata)
colnames(viriondata)

# Log data for linear modelling
logdata <- viriondata %>%
  mutate(log_V = log (`Virion volume (nm×nm×nm)`), log_L = log (`Genome length (kb)`))

model <- lm(log_V ~ log_L, data = viriondata)
summary(model)

#Q5D- Create the plot
ggplot(data = logdata, aes(x = log_L, y = log_V)) +
  geom_point() +              
  geom_smooth(method = "lm", color = "blue") +
  xlab("log [Genome length (kb)]") +               
  ylab("log [Virion volume (nm³)]") +             
  theme_bw()                                       


