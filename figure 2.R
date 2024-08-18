library(ggplot2)
library(dplyr)

dat %>%
  ggplot(aes(x = age.label, y = prop, fill = cat)) +
  geom_col(position = "stack") +
  geom_text(
    color = "black",
    size = 3.5,
    position = position_stack(vjust = 0.5),
    aes(label = prop.label)
  ) +
  labs(x = "Age categories", y = "Percentage of enrolled deaths") +
  scale_y_continuous(expand = c(0, 0), labels = scales::percent, limits = c(0, 1)) +
  scale_x_discrete(expand = c(0, 0))