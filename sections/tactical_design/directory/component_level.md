El siguiente diagrama de componentes del modelo C4 muestra los componentes de Directory dentro de la API de Staff y los contenedores con los que se comunican. Se elaboró en Structurizr, en la vista Componentes-Directory del workspace de la solución.

<img src="assets/tactical_design/directory/component_level/components.png" alt="Diagrama de componentes de Directory" style="display: block; width: 100%; height: auto; margin: 0 auto;">

PersonController atiende las consultas de la API de SGT, y DirectoryApiService atiende a los componentes de Identity Provider dentro del mismo servicio. Ambos usan los servicios de consulta, que leen la base de datos de Staff con proyecciones JDBC.
