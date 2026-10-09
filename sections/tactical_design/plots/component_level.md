El siguiente diagrama de componentes del modelo C4 muestra los componentes de Plots dentro de la API de SGT y los contenedores con los que se comunican. Se elaboró en Structurizr, en la vista Componentes-Plots del workspace de la solución.

<img src="assets/tactical_design/plots/component_level/components.png" alt="Diagrama de componentes de Plots" style="display: block; width: 100%; height: auto; margin: 0 auto;">

PlotController recibe las solicitudes de la aplicación móvil. PlotCommandService carga los terrenos vecinos con JpaPlotRepositoryAdapter, mide la superposición con JtsPlotGeometry y guarda el terreno nuevo. Las consultas se resuelven con JdbcPlotProjection sobre la base de datos de SGT con PostGIS.
