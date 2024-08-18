library(ggplot2)
library(dplyr)

dat %>%
  ggplot(aes(y = reorder(rec, n, sum), x = n, fill = age.cat)) +
  geom_col() +
  labs(x = "Number of deaths", y = "Cause of death", title = "Recommendations for preventing deaths") 