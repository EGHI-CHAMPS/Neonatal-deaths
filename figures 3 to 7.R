library(ggplot2)
library(dplyr)

plot_data <- function(data, title, filename) {
  dat %>%
    ggplot(aes(x = reorder(value, rank, sum), y = n, group = Age.Group, fill = Age.Group)) +
    geom_col(position = "dodge", width = 0.8) +
    scale_y_continuous(expand = expansion(mult = c(0, .04))) +
    geom_text(aes(label = n), position = position_dodge(width = 0.8), cex = 3, vjust = -0.5) +
    labs(
      title = title,
      x = "Immediate and antecedent causes of death",
      y = "Number of deaths"
    ) +
    ggsave(filename, width = 7.8, height = 5.9, units = "in", dpi = 360)
}

figure_data <- list(
  list(icd_filter = 1, rank_limit = 6, title = "Immediate and antecedent causes of the death when underlying cause was congenital malformation N1 (N=118)", filename = "x1.jpg"),
  list(icd_filter = 4, rank_limit = 9, title = "Immediate and antecedent causes of death when underlying cause was complications of intrapartum event N4 (N=446)", filename = "x2.jpg"),
  list(icd_filter = 6, rank_limit = 7, title = "Immediate and antecedent causes of death when underlying cause was infection N6 (N=254)", filename = "x3.jpg"),
  list(icd_filter = 7, rank_limit = 6, title = "Immediate and antecedent causes of death when underlying cause of death was respiratory and cardiovascular disorders N7 (N=159)", filename = "x4.jpg"),
  list(icd_filter = 9, rank_limit = 6, title = "Immediate and antecedent causes of death when underlying cause was low birth weight and prematurity complications N9 (N=404)", filename = "x5.jpg")
)

for (fig in figure_data) {
  data <- process_data(dat.1, fig$icd_filter, fig$rank_limit)
  plot_data(data, fig$title, fig$filename)
}
