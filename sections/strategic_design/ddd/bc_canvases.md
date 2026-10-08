Como parte del análisis de los contextos identificados se desarrolló su canvas respectivo.

En primer lugar se analizó el contexto SGT. Este contexto es el CORE del sistema e interactúa directamente con las aplicaciones web y móvil, proporcionando los endpoints de terrenos y fichas. Internamente se divide en los módulos Monitoring, Plots y People, y se comunica con los contextos de Beneficiarios, POI, Staff y el modelo de IA.

<img src="assets/strategic_design/ddd/bc_canvases/sgp.jpg" alt="Contexto SGT" style="display: block; width: 90%; height: auto; margin: 0 auto;">

Luego se analizó el contexto de Beneficiarios, que representa el registro institucional de beneficiarios. Su único propósito dentro del sistema es proporcionar la información de los beneficiarios a partir de su documento legal. Se comunica con el contexto SGT.

<img src="assets/strategic_design/ddd/bc_canvases/beneficiarios.jpg" alt="Contexto Beneficiarios" style="display: block; width: 90%; height: auto; margin: 0 auto;">

{{page_break}}

A su vez se analizó el contexto de POI. Mantiene los planes, objetivos, actividades y tareas del Plan Operativo Institucional, y registra la entrega de cada tarea y su revisión. Recibe de SGT las entregas de las fichas enviadas y el resultado de su revisión por los asistentes de Gerencia General.

<img src="assets/strategic_design/ddd/bc_canvases/poi.jpg" alt="Contexto POI" style="display: block; width: 90%; height: auto; margin: 0 auto;">

El contexto de Staff reúne el directorio del personal y el proveedor de identidad de la organización. Autentica a las personas que usan las aplicaciones, decide qué roles tienen en cada API según los grupos del directorio a los que pertenecen, y emite los tokens de servicio con los que SGT llama a los demás contextos.

<img src="assets/strategic_design/ddd/bc_canvases/staff.jpg" alt="Contexto Staff" style="display: block; width: 90%; height: auto; margin: 0 auto;">

Finalmente, el contexto de IA es una mejora planificada al proceso actual. Es meramente tecnológico y busca reducir la carga operativa de Gerencia General. Tiene como propósito analizar las fichas, extraer su información relevante y permitir su validación con Gerencia General.

<img src="assets/strategic_design/ddd/bc_canvases/ia.jpg" alt="Contexto IA" style="display: block; width: 90%; height: auto; margin: 0 auto;">
