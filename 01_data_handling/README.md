# 📂 01_data_handling/

This module focuses on basic data manipulation using the `tidyverse` package in R.  
You'll work with the **Gapminder** dataset to learn how to read, clean, and transform real-world data.

---

## Topics Covered

- Reading data using `read_csv()`
- Selecting and filtering specific columns (`select()`, `filter()`)
- Sorting data (`arrange()`)
- Creating new variables (`mutate()`)
- Grouping and summarizing (`group_by()`, `summarise()`)

---

## Dataset Used
Gapminder data (via gapminder package)

---

## Output

- `processed/gapminder_gdp.csv`: Dataset with newly computed GDP column
- `processed/avg_life_by_continent.csv`: Summary of average life expectancy by continent
- `life_expectancy_india.png`: Plot visualization of Life Expectancy in India

---

## 📁 File Structure
| File                    | Description                                 |
|-------------------------|---------------------------------------------|
| `01_data_handling.R`    | Script for data transformation and export   |
| `processed/`            | Folder with CSV outputs                     |
| `life_expectancy_india.png`            | Plot image                                  |
