library(tidyverse)
set.seed(11)
x = rnorm(10, 4, 1)
y = rnorm(10, x + 1, 1)
knn <- data.frame(
  x = x,
  y = y
)

knn <- knn %>%
  arrange(y) %>%
  mutate(which = c(rep("a", 5), rep("b", 2), rep("c", 3)))

knn[6,] <- c(3.9, 4.36, "b")
knn[7,] <- c(4.5, 4.67, "b")

knn$x <- as.numeric(knn$x)
knn$y <- as.numeric(knn$y)

p1 <- knn %>%
  ggplot(aes(x = x, y = y, color = which)) +
  geom_point(size = 4) +
  scale_color_manual(values = c("steelblue", "black", "goldenrod")) +
  theme_bw() +
  theme(legend.position = "none")


knn2 <- knn %>%
  arrange(y) %>%
  mutate(which = c(rep("a", 6), rep("c", 4)))

p2 <- knn2 %>%
  ggplot(aes(x = x, y = y, color = which)) +
  geom_point(size = 4) +
  scale_color_manual(values = c("steelblue", "goldenrod")) +
  theme_bw() + 
  theme(legend.position = "none")

ggsave("knn1.png", p1, width = 10, height = 6)
ggsave("knn2.png", p2, width = 10, height = 6)

