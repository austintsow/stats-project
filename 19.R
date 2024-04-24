library(ggplot2)

la_deaths <- read.csv("data/us_deaths.csv")
la_deaths$Date <- as.Date(la_deaths$Date, format="%Y-%m-%d")
#using as.numeric to convert date to int
la_deaths$DateNumeric <- as.numeric(la_deaths$Date - min(la_deaths$Date))

ggplot(la_deaths, aes(x=Date, y=Case)) +
  geom_line() +
  theme_minimal() +
  labs(x="Date", y="Cases", title="COVID-19 Cases Scatterplot in Los Angeles")

#find mean
mean_cases <- mean(la_deaths$Case)
print(paste("Mean of Cases:", mean_cases))

#find standard deviation
sd_cases <- sd(la_deaths$Case)
print(paste("Standard Deviation of Cases:", sd_cases))

#find correlation
correlation <- cor(la_deaths$DateNumeric, la_deaths$Case)
print(paste("Correlation between Date and Cases:", correlation))
