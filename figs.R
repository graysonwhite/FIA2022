library(tidyverse)

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

ggsave("m333_on_map.png", width = 12, height = 6)

ggplot() + 
  geom_sf(data = FIESTAnalysis::ecomap %>% filter(PROVINCE == "M333"),
          fill = "forestgreen",
          color = "black") +
  geom_hex(mapping = aes()) + 
  theme_minimal()

ggsave("m333.png", width = 10, height = 6)


hex_grid <- st_make_grid(FIESTAnalysis::ecomap %>% filter(PROVINCE == "M333"),
                                n = c(15,15),
                                what = 'polygons',
                                square = FALSE,
                                flat_topped = TRUE) %>%
  st_as_sf() %>%
  mutate(area = st_area(.))

hex_grid_crop <- sf::st_intersection(hex_grid, FIESTAnalysis::ecomap %>% filter(PROVINCE == "M333"))

ggplot() + 
  geom_sf(data = hex_grid_crop,
          aes(fill = units::drop_units(area)),
          fill = "forestgreen",
          color = "darkgrey") +
  geom_sf(data = FIESTAnalysis::ecomap %>% filter(PROVINCE == "M333"),
          fill = NA, color = 'black') +
  theme_minimal()

ggsave("m333_hex.png", width = 10, height = 6)



