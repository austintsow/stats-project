library(ggplot2)

us_deaths <- read.csv("data/us_deaths.csv")
us_deaths$Date <- as.Date(us_deaths$Date, format="%Y-%m-%d")

la_deaths <- subset(us_deaths, Admin2 == "Los Angeles")
la_deaths$DateNumeric <- as.numeric(la_deaths$Date - min(la_deaths$Date))

# plotting just LA data
ggplot(la_deaths, aes(x=Date, y=Case)) +
  geom_line() +
  theme_minimal() +
  labs(x="Date", y="Cases", title="COVID-19 Cases Scatterplot in Los Angeles")

# la mean
mean_la_cases <- mean(la_deaths$Case, na.rm = TRUE)
print(paste("Mean of LA Cases:", mean_la_cases))

# la sd
sd_la_cases <- sd(la_deaths$Case, na.rm = TRUE)
print(paste("Standard Deviation of LA Cases:", sd_la_cases))

# la correlation
correlation_la <- cor(la_deaths$DateNumeric, la_deaths$Case, use="complete.obs")
print(paste("Correlation between Date and LA Cases:", correlation_la))

# calculate us mean
mean_us_deaths <- mean(us_deaths$Case, na.rm = TRUE)
print(paste("Mean of US Deaths:", mean_us_deaths))
