# scripts/01_explore.R
# Exploración mínima con here + tidyverse sobre los .rds de palmerpenguins

# Rutas a los datos (provenientes del repo clonado)
path_raw  <- here("data", "raw", "penguins_raw.rds")
path_proc <- here("data", "raw", "penguins.rds")

# Cargar .rds (no requiere paquetes extra)
penguins_raw  <- read_rds(path_raw)  %>% clean_names()
penguins_proc <- read_rds(path_proc) %>% clean_names()

# Tabla de ejemplo (conteo por especie y isla en la versión procesada)
tabla_resumen <- penguins_proc %>%
  count(species, island, name = "n") %>%
  arrange(species, island)

write_csv(
  tabla_resumen,
  # COMPLETAR: here()
)

# Gráfico de ejemplo (masa corporal vs largo del pico, coloreado por especie)
g <- ggplot(
  penguins_proc %>% filter(!is.na(bill_length_mm), !is.na(body_mass_g)),
  aes(x = bill_length_mm, y = body_mass_g, color = species)
) +
  geom_point(alpha = 0=.7) +
  labs(
    title = "Penguins (procesados): masa corporal vs. largo del pico",
    x = "Largo del pico (mm)",
    y = "Masa corporal (g)",
    color = "Especie"
  )

ggsave(
  # COMPLETAR: filename = here(),
  plot = g, width = 7, height = 4, dpi = 300
)
