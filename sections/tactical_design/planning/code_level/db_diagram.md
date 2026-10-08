El siguiente diagrama de base de datos muestra las tablas de Planning en la base de datos PostgreSQL de poi. Se elaboró en LucidChart a partir de las migraciones Flyway del servicio.

<img src="assets/tactical_design/planning/code_level/db_diagram/schema.png" alt="Diagrama de base de datos de planning" style="display: block; width: 100%; height: auto; margin: 0 auto;">

Las tablas plans, objectives y activities guardan el agregado Plan, cada una con una clave foránea hacia su padre y un código único. La tabla tasks guarda el agregado Task con una clave foránea hacia su actividad; la columna kind indica el tipo de tarea, y las restricciones CHECK exigen que una tarea pendiente no tenga entrega, que una entrega traiga su fecha de ejecución y que una tarea de seguimiento indique a su beneficiario. El índice sobre la actividad y el estado atiende la consulta de tareas pendientes.
