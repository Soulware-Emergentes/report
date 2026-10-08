El siguiente diagrama de componentes del modelo C4 muestra los componentes de Planning dentro de la API de POI y los contenedores con los que se comunican. Se elaboró en Structurizr, en la vista Componentes-Planning del workspace de la solución.

<img src="assets/tactical_design/planning/component_level/components.png" alt="Diagrama de componentes de Planning" style="display: block; width: 100%; height: auto; margin: 0 auto;">

PlanController atiende a la aplicación web, y TaskController atiende tanto a la aplicación web como a la API de SGT, que registra y revisa las entregas de las tareas. Los servicios de comandos aplican las reglas del modelo de dominio y guardan los agregados con los adaptadores JPA; los servicios de consulta leen con proyecciones JDBC. Los adaptadores JPA publican los eventos de las tareas, y sus consumidores envían al servicio de comandos de planes las tareas que se definen y se completan, para que el plan lleve su avance.
