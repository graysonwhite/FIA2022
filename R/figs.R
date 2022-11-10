library(tidyverse)

# generate data for kNN plots
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

# kNN Fig 1
knn %>%
  ggplot(aes(x = x, y = y, color = which)) +
  geom_point(size = 4) +
  scale_color_manual(values = c("steelblue", "black", "goldenrod")) +
  theme_bw() +
  theme(legend.position = "none")
ggsave("figures/knn1.png", width = 10, height = 6)


knn2 <- knn %>%
  arrange(y) %>%
  mutate(which = c(rep("a", 6), rep("c", 4)))

# kNN Fig 2
knn2 %>%
  ggplot(aes(x = x, y = y, color = which)) +
  geom_point(size = 4) +
  scale_color_manual(values = c("steelblue", "goldenrod")) +
  theme_bw() + 
  theme(legend.position = "none")
ggsave("figures/knn2.png", width = 10, height = 6)

# M333 on states
ggplot() + 
  geom_sf(data = FIESTA::stunitco %>% 
            mutate(State = STATENM) %>%
            filter(State %in% c("Washington", "Oregon",
                                "Idaho", "Montana")),
          mapping = aes(fill = State, color = State)) +
  geom_sf(data = FIESTAnalysis::ecomap %>% filter(PROVINCE == "M333"),
          fill = "forestgreen",
          color = "black",
          alpha = 0.75) +
  scale_fill_manual(values = c("steelblue", "goldenrod", "maroon", "purple")) +
  scale_color_manual(values = c("steelblue", "goldenrod", "maroon", "purple")) +
  theme_minimal() +
  theme(legend.position = "bottom")

ggsave("figures/m333_on_map.png", width = 12, height = 6)

# M333 
ggplot() + 
  geom_sf(data = FIESTAnalysis::ecomap %>% filter(PROVINCE == "M333"),
          fill = "forestgreen",
          color = "black") +
  geom_hex(mapping = aes()) + 
  theme_minimal()

ggsave("figures/m333.png", width = 10, height = 6)

# Create grid of hexagons
hex_grid <- st_make_grid(FIESTAnalysis::ecomap %>% filter(PROVINCE == "M333"),
                                n = c(15,15),
                                what = 'polygons',
                                square = FALSE,
                                flat_topped = TRUE) %>%
  st_as_sf() %>%
  mutate(area = st_area(.))

hex_grid_crop <- sf::st_intersection(hex_grid, FIESTAnalysis::ecomap %>% filter(PROVINCE == "M333"))

# Hes grid on M333
ggplot() + 
  geom_sf(data = hex_grid_crop,
          aes(fill = units::drop_units(area)),
          fill = "forestgreen",
          color = "darkgrey") +
  geom_sf(data = FIESTAnalysis::ecomap %>% filter(PROVINCE == "M333"),
          fill = NA, color = 'black') +
  theme_minimal()

ggsave("figures/m333_hex.png", width = 10, height = 6)



