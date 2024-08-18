library(ggplot2)
library(dplyr)

dat %>%
  ggplot(aes(x = "", y = prop, fill = prev)) +
  geom_bar(stat = "identity", width = 1) +
  geom_text(aes(x = 1.62, label = paste0(round(prop * 100), "%")),
            size = 4.7, color = "#34495E",
            position = position_stack(vjust = 0.5)) +
  coord_polar("y", start = 0) 