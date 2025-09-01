# scripts/00_setup.R
# Configura un entorno reproducible con renv + pacman y congela versiones (snapshot)

# 1) renv: librería por proyecto + lockfile
install.packages("renv")
renv::init(force = TRUE)          # inicializa/activa renv en el proyecto

# 2) pacman: instala si falta y carga paquetes en una sola llamada
install.packages("pacman")
pacman::p_load(
  here,       # rutas robustas desde la raíz del proyecto (.Rproj)
  tidyverse,  # dplyr, ggplot2, readr, etc.
  janitor,
  readr
)

# 3) Congelar versiones exactas de paquetes en renv.lock
renv::snapshot(prompt = FALSE)
