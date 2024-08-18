library(ggplot2)
library(dplyr)

dat %>%  
  ggplot(aes(y = reorder(value.x, n, sum), x = n, fill = Age.Group)) +
  geom_col() +
  labs(title = "Pathogens by age group", x = "Number of neonatal deaths") +
  facet_grid(type ~ ., scales = "free", space = 'free') 