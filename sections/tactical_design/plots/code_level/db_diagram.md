El siguiente diagrama de base de datos muestra las tablas de Plots en la base de datos PostgreSQL de sgt. Se elaboró en LucidChart a partir de las migraciones Flyway del servicio.

<img src="assets/tactical_design/plots/code_level/db_diagram/schema.png" alt="Diagrama de base de datos de plots" style="display: block; width: 100%; height: auto; margin: 0 auto;">

La tabla plots guarda una fila por terreno. El perímetro se almacena como polígono PostGIS en el sistema de referencia de su zona UTM, y la columna footprint, generada a partir de él, lo guarda en coordenadas geográficas WGS84 con un índice GIST para la búsqueda de terrenos que se intersecan. La restricción única sobre el tipo y el número de documento del titular respalda la regla de un terreno por beneficiario, y el índice sobre el ubigeo con text_pattern_ops atiende las consultas por prefijo de región.
