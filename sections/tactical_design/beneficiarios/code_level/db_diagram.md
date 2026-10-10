El siguiente diagrama de base de datos muestra las tablas de Beneficiarios en la base de datos PostgreSQL de beneficiarios. Se elaboró en LucidChart a partir de las migraciones Flyway del servicio.

<img src="assets/tactical_design/beneficiarios/code_level/db_diagram/schema.png" alt="Diagrama de base de datos de beneficiarios" style="display: block; width: 80%; height: auto; margin: 0 auto;">

La tabla beneficiaries guarda una fila por beneficiario. La restricción única sobre el tipo y el número de documento respalda que ningún par de beneficiarios comparta documento, y las restricciones CHECK repiten las reglas del dominio: el tipo es uno de los tres conocidos, el número tiene el formato de su tipo y el ubigeo tiene seis dígitos.
