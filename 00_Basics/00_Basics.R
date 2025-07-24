# 00_Basics.R
# Description: Foundations of R for Bioinformatics
# Covers: Basic syntax, tidyverse operations, and ggplot2 visualization

# ────────────────────────────────────────────────
# Section 1: Basic R - Variables, Vectors, and Data Frames
# ────────────────────────────────────────────────

# Variable assignment
gene <- "BRCA1"
pi <- 3.14

# Create vectors
genes <- c("BRCA1", "TP53", "EGFR")
expression <- c(12.5, 7.3, 15.8)

# Create a data frame
gene_data <- data.frame(Gene = genes, Expression = expression)

# Accessing elements
gene_data$Gene         # Access column
gene_data[1, ]         # First row
gene_data[gene_data$Expression > 10, ]  # Filter condition

# Vector and data frame exercise
gene_ids <- c("G1", "G2", "G3")
counts <- c(100, 200, 150)
count_data <- data.frame(GeneID = gene_ids, Count = counts)

# View data
print(count_data)

# ────────────────────────────────────────────────
# Section 2: Tidyverse - Data Manipulation
# ────────────────────────────────────────────────

# Load tidyverse
library(tidyverse)

# Read Gapminder dataset
data <- read_csv("https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv")

# Filter rows with life expectancy over 70
result <- data %>%
  filter(lifeExp > 70) %>%
  select(country, year) %>%
  arrange(year)

# View top rows
head(result)

# Count how many rows matched
nrow(result)

# ────────────────────────────────────────────────
# Section 3: ggplot2 - Data Visualization
# ────────────────────────────────────────────────
# Load libraries
library(ggplot2)

# Filter data for the year 2007
data_2007 <- subset(data, year == 2007)

# Create a scatter plot of GDP vs Life Expectancy
p <- ggplot(data_2007, aes(x = gdpPercap, y = lifeExp, color = continent)) +
# Plot each country as a point:
# - size = 3 makes the points larger and easier to see
# - alpha = 0.8 adds slight transparency to help overlapping points remain visible
  geom_point(size = 3,alpha = 0.8) +
# Use log scale for better visualization of GDP spread
  scale_x_log10() +
  theme_minimal() +
  labs(
    title = "GDP per Capita vs Life Expectancy",
    x = "GDP per Capita (log scale)",
    y = "Life Expectancy",
    color = "Continent"
  )

# Print plot
print(p)

# Save the plot to file
ggsave("life_expectancy_vs_gdp.png", plot = p, width = 8, height = 5)

# ────────────────────────────────────────────────
# End of Script

