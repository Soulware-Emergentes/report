El siguiente diagrama de clases UML muestra la capa de dominio de Plots, junto con el documento legal que toma del lenguaje publicado de People. Se elaboró en LucidChart.

<img src="assets/tactical_design/plots/code_level/class_diagram/domain.png" alt="Diagrama de clases de la capa de dominio de plots" style="display: block; width: 100%; height: auto; margin: 0 auto;">

Plot compone su identidad, su perímetro y su ubigeo, y referencia a su titular por el documento legal. PlotBoundary compone entre tres y muchos vértices SurveyPoint y la zona UTM en que se midieron. La regla de superposición se apoya en PlotGeometry, que devuelve un SharedArea, y en la tolerancia OverlapTolerance que el agregado mantiene como constante.
