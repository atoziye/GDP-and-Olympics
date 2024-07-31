# Load packages
library(tidyverse)
library(cowplot)
library(colorspace)
library(ggrepel)

# Load data
medalsgdp <- read.csv("~/GDP.csv")

# Create country highlights (these are the labels that will appear next to selected points on the plot)
country_highlight <- c(
  "China", "United States", "Great Britain", "Japan", "Germany", "Russia", "Australia", "Italy", "Brazil", "South Korea", "Canada", "Jamaica", "India", "France", "Spain", "Saudi Arabia", "Netherlands", "Samoa", "Grenada", "San Marino", "Burundi", "Bahamas", "Georgia", "Mongolia", "Fiji", "Mexico", "Kenya", "New Zealand", "Ukraine"
)

medalsgdp <- medalsgdp %>%
  mutate(
    label = ifelse(Country_Name %in% country_highlight, Country_Name, "")
  ) # this creates a new column called "label", which will be filled with the country names selected in the previous line (and only for those countries)

# Select region colours (will make the points differently coloured depending on Olympic region [Africa, Asia, Europe, etc.])
region_cols <- c("#FF595E", "#FF924C", "#FFCA3A", "#8AC926", "#1982C4", "#6A4C93", "grey")

## Plot GDP by medal graph
gdpxmedals <- ggplot(medalsgdp, aes(2024_GDP, Last_5_Medal_Count)) +
  geom_smooth(
    aes(color = "y ~ x", fill = "y ~ x"),
    method = "loess", 
    formula = y~x, 
    se = FALSE, 
    fullrange = TRUE 
  ) +
  geom_point(
    aes(color = Region, fill = Region),
    size = 4.5, alpha = 0.5, 
    shape = 21 
  ) +
  geom_text_repel(
    aes(label = label),
    color = "black",
    size = 9/.pt, 
    point.padding = 0.1, 
    box.padding = 0.6,
    min.segment.length = 0,
    max.overlaps = 1000,
    seed = 7654
  ) +
  scale_color_manual(
    name = NULL, 
    values = darken(region_cols, 0.3) 
  ) +
  scale_fill_manual(
    name = NULL,
    values = region_cols
  ) +
  scale_x_log10(
    name = "GDP (current USD, billions)"
  ) +
  scale_y_log10(
    name = "Total number of Olympic medals (last 5 Games combined)",
    limits = c(1, 1e3)
  ) +
  guides(
    color = guide_legend(
      nrow = 1,
      override.aes = list(
        linetype = c(rep(0, 6), 1), 
        shape = c(rep(21, 6), NA)
      )
    )
  ) +
  theme_minimal() +
  theme(
    legend.position = "top",
    legend.justification = "center",
    legend.text = element_text(size = 9),
    legend.box.spacing = unit(0, "pt"),
    axis.title.x = element_text(margin = margin(t = 20)),
    axis.title.y = element_text(margin = margin(r = 20, b = 10))
  )


## Plot GDP per capita by medals graph

# Country highlights
country_highlight2 <- c(
  "China", "United States", "Great Britain", "Japan", "Germany", "Russia", "Australia", "Italy", "Brazil", "South Korea", "Canada", "Jamaica", "India", "France", "Spain", "Saudi Arabia", "Netherlands", "Samoa", "Grenada", "San Marino", "Burundi", "Bahamas", "Georgia", "Mongolia", "Fiji", "Mexico", "Kenya", "New Zealand", "Ukraine", "Ethiopia", "Nigeria", "Uzbekistan", "Egypt", "Iran", "Indonesia", "Afghanistan", "Ireland", "Norway", "Switzerland", "Singapore", "Iceland", "Denmark", "Qatar"
)

medalsgdp <- medalsgdp %>%
  mutate(
    label2 = ifelse(Country_Name %in% country_highlight2, Country_Name, "")
  )

# Plot
# colors
region_cols <- c("#FF595E", "#FF924C", "#FFCA3A", "#8AC926", "#1982C4", "#6A4C93", "grey")

## GDP ##
gdppcxmedals <- ggplot(medalsgdp, aes(X2024_GDP_per_capita, Last_5_Medal_Count)) +
  geom_smooth(
    aes(color = "y ~ x", fill = "y ~ x"),
    method = "loess", 
    formula = y~x, 
    se = FALSE, 
    fullrange = TRUE 
  ) +
  geom_point(
    aes(color = Region, fill = Region),
    size = 4.5, alpha = 0.5, 
    shape = 21 
  ) +
  geom_text_repel(
    aes(label = label2),
    color = "black",
    size = 9/.pt, 
    point.padding = 0.1, 
    box.padding = 0.6,
    min.segment.length = 0,
    max.overlaps = 1000,
    seed = 7654
  ) +
  scale_color_manual(
    name = NULL, 
    values = darken(region_cols, 0.3) 
  ) +
  scale_fill_manual(
    name = NULL,
    values = region_cols
  ) +
  scale_x_log10(
    name = "GDP per capita (current USD)",
    labels = scales::comma_format()
  ) +
  scale_y_log10(
    name = "Total number of Olympic medals",
    limits = c(0.5, 1e3)
  ) +
  guides(
    color = guide_legend(
      nrow = 1,
      override.aes = list(
        linetype = c(rep(0, 6), 1), 
        shape = c(rep(21, 6), NA)
      )
    )
  ) +
  theme_minimal() +
  theme(
    legend.position = "top",
    legend.justification = "center",
    legend.text = element_text(size = 9),
    legend.box.spacing = unit(0, "pt"),
    axis.title.x = element_text(margin = margin(t = 20)),
    axis.title.y = element_text(margin = margin(r = 20, b = 10))
  )


