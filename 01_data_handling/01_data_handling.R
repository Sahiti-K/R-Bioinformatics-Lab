# 01_data_handling.R
# Basic data handling with the Gapminder dataset

# Install required packages (only if not already installed)
packages <- c("tidyverse", "gapminder", "here")
installed <- packages %in% rownames(installed.packages())
if (any(!installed)) install.packages(packages[!installed])

# Load libraries
library(tidyverse)
library(gapminder)
library(here)

# View structure and sample of the dataset
str(gapminder)
summary(gapminder)
head(gapminder)

# Select key columns
life_expectancy <- gapminder %>%
  select(country, year, lifeExp)

head(life_expectancy)

# Sort by life expectancy (highest first)
sorted_lifeExp <- gapminder %>%
  arrange(desc(lifeExp))

head(sorted_lifeExp, 5)

# Create new GDP column
gapminder_gdp <- gapminder %>%
  mutate(gdp = pop * gdpPercap)

head(gapminder_gdp)

# Create folder if it doesn't exist
if (!dir.exists(here("processed"))) {
  dir.create(here("processed"))
}

# Save enriched dataset
write_csv(gapminder_gdp, here("processed", "gapminder_gdp.csv"))

# Calculate average life expectancy by continent
avg_life_by_continent <- gapminder %>%
  group_by(continent) %>%
  summarise(avg_lifeExp = mean(lifeExp), .groups = "drop")

print(avg_life_by_continent)

# Save summary table
write_csv(avg_life_by_continent, here("processed", "avg_life_by_continent.csv"))

# Filter data for India
india_data <- gapminder %>% filter(country == "India")
print(india_data)

# Countries with life expectancy > 80 in 2007
high_lifeExp_2007 <- gapminder %>%
  filter(year == 2007, lifeExp > 80) %>%
  arrange(desc(lifeExp))

print(high_lifeExp_2007)

# Extract records only for India
india_data <- gapminder %>% filter(country == "India")

# View the filtered data
print(india_data)

# Plot life expectancy over time for India
india_lifeExp_plot <- ggplot(india_data, aes(x = year, y = lifeExp)) +
  geom_line(color = "steelblue", linewidth = 1.2) +
  geom_point(color = "darkorange", size = 2) +
  labs(
    title = "Life Expectancy in India (1952–2007)",
    x = "Year",
    y = "Life Expectancy"
  ) +
  theme_minimal()

print(india_lifeExp_plot)

# Save the plot
ggsave("outputs/life_expectancy_india.png", india_lifeExp_plot, width = 7, height = 5
       
