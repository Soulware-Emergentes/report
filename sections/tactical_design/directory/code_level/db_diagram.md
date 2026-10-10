El siguiente diagrama de base de datos muestra las tablas de Directory en la base de datos PostgreSQL de staff. Se elaboró en LucidChart a partir de las migraciones Flyway del servicio.

<img src="assets/tactical_design/directory/code_level/db_diagram/schema.png" alt="Diagrama de base de datos de directory" style="display: block; width: 100%; height: auto; margin: 0 auto;">

La tabla people guarda a las personas del directorio, con el nombre de usuario único y el hash de contraseña opcional. Las tablas groups y group_members guardan los grupos y la pertenencia de cada persona, con clave primaria compuesta y eliminación en cascada.
