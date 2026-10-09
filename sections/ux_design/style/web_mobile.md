Esta sección fija los estándares visuales y de interacción de las dos aplicaciones de SGT: la aplicación web responsive y la aplicación móvil nativa. Ambas se construyen sobre los tokens, estilos y componentes de la guía general, de modo que comparten paleta, tipografía, espaciado y componentes base, y aquí solo se describe lo que es propio de cada plataforma. No se nombra ningún framework de desarrollo, porque esa decisión técnica corresponde a la etapa de implementación y no al diseño de la interfaz.

**Nota**: las pantallas e ilustraciones de esta sección son estilos referenciales y solo ilustrativos. Muestran cómo se aplican los tokens y componentes definidos, y no constituyen el diseño final de la aplicación, que se presenta en las secciones de Applications Wireframes y Applications Mockups

**Aplicación web**  
La web la usan la asistente de gerencia general y el agente de campo. La asistente trabaja en computadoras de escritorio y portátiles con Windows, y ambas personas usan Chrome, con Edge en el caso de la asistente. Por eso el diseño es prioritariamente de escritorio y portátil, y se adapta hacia anchos menores con las siguientes reglas:
- Desde 1280 px de ancho, la barra lateral se muestra expandida y las secciones se abren junto al mapa.
- De 1024 a 1279 px, la barra lateral se colapsa por defecto y el panel de una sección se abre encima del mapa en lugar de desplazarlo.
- De 768 a 1023 px, las secciones se abren en vista completa con el mapa oculto, y los modales ocupan hasta el 90 % del ancho.
- Por debajo de 768 px no es un objetivo de diseño, porque el trabajo en campo se cubre con la aplicación móvil.

La pantalla principal de la web es un mapa interactivo a pantalla completa. La barra lateral da acceso a las secciones Beneficiarios, Agentes de campo, Fichas y Terrenos, y el contenido de cada sección se muestra de tres maneras según el espacio que necesita: con el mapa a pantalla completa y la barra colapsada, con la sección abierta y el mapa desplazado hacia la derecha, o en vista completa con el mapa oculto, como ocurre con las tablas y con la validación.

<img src="./assets/ux_design/style/web_mobile/layout-estados-mapa.png" alt="Estados de la pantalla del mapa" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 90mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

Al pulsar un terreno en el mapa se abre un popup con los datos del terreno, es decir, el DNI del beneficiario y el área estimada, un desplegable con los vértices de su perímetro y otro con sus fichas. Los vértices también se marcan numerados sobre el polígono del mapa. Cada ficha muestra su código, el DNI del agente, la fecha de llenado y la fecha de validación, y mientras esté pendiente incluye la acción Validar. El popup usa la superficie elevada de la guía general.

<img src="./assets/ux_design/style/web_mobile/popup-terreno.png" alt="Popup de terreno sobre el mapa" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 110mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

Dos modales cubren la creación y la carga de datos. El modal de creación de terreno se usa tanto para crear un terreno desde la web como para validar los terrenos precargados desde el archivo de la estación total, que llegan con sus vértices ya leídos del archivo. Como un terreno es un polígono y no un punto, el modal no pide un par de coordenadas sino la lista de vértices del perímetro, cada uno con su Este y su Norte en UTM. La lista se carga desde el archivo de la estación total o se ingresa a mano, se puede corregir vértice por vértice, y el área se calcula a partir de ella. El modal de subida de ficha permite al agente de campo subir la ficha digitalizada con su código, su fecha de llenado y el terreno vinculado, ya sea arrastrando el PDF o seleccionándolo, y también se abre desde el detalle del terreno. Cuando un modal bloquea la pantalla, se coloca sobre un fondo oscuro translúcido que lo separa del mapa.

<img src="./assets/ux_design/style/web_mobile/modales.png" alt="Modales de creación de terreno y de subida de ficha" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 130mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

Las secciones de consulta, que son Beneficiarios, Agentes de campo y Fichas, usan una grilla de búsqueda. Tiene filtros combinables, un botón Buscar y un botón Limpiar filtros, y presenta los resultados en una tabla donde el estado se muestra con el Status chip y la acción disponible aparece en la última columna. Las fichas y los borradores se presentan siempre como filas de tabla, nunca como tarjetas.

<img src="./assets/ux_design/style/web_mobile/grilla-busqueda.png" alt="Grilla de búsqueda de fichas" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 90mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

En la sección de terrenos, el agente de campo ve todos los terrenos, salvo los borradores de otros agentes: de esos solo ve los que él guardó. La tabla tiene una columna Estado y una columna Acciones, donde puede validar los borradores que guardó, y la sección incluye el botón para crear terrenos.

<img src="./assets/ux_design/style/web_mobile/tabla-terrenos.png" alt="Tabla de terrenos del agente de campo" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 70mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

La validación de una ficha se hace en una pantalla dividida. A la izquierda están los datos que extrajo la inteligencia artificial, que la asistente puede confirmar o corregir, y a la derecha el documento original, para compararlos sin cambiar de pantalla. Arriba se muestra el resultado de la verificación de integridad del documento, junto a las acciones se explica que al aprobar se envían los datos al sistema POI, y Aprobar ficha es la única acción principal.

<img src="./assets/ux_design/style/web_mobile/validacion-ficha.png" alt="Pantalla de validación de una ficha" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 140mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

El mapa lo proporciona una biblioteca de mapas, por lo que SGT no define el mapa base ni sus controles estándar. Lo que sí define es cómo se dibujan los terrenos sobre él. Los terrenos se dibujan con contorno y relleno translúcido para distinguirse sobre la imagen satelital, y cada estado repite el lenguaje de color del resto de la guía, con gris para el borrador, verde para el validado y blanco para el terreno seleccionado. El borrador además lleva línea discontinua, para no depender solo del color. La ilustración muestra una disposición de referencia de los controles, la lectura de coordenadas y la leyenda: los controles en la esquina superior derecha y las coordenadas y la leyenda abajo, siempre sobre superficies propias, porque ningún texto se coloca directamente sobre la imagen del mapa. La apariencia exacta de los controles depende de la biblioteca que se adopte.

<img src="./assets/ux_design/style/web_mobile/mapa-controles.png" alt="Controles, coordenadas y leyenda del mapa" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 110mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

Los colores con los que se dibujan los terrenos se definen como tokens que amplían los de la guía general, para que el mapa y las tablas usen el mismo lenguaje de estados, y se entregan a la biblioteca como opciones de estilo de cada terreno.

<img src="./assets/ux_design/style/web_mobile/mapa-tokens.png" alt="Tokens de color del mapa" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 50mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

Reglas de interacción de la web:
- Todos los elementos interactivos muestran el estado Focus de 2 px al navegarse con teclado, y las tablas y los modales se pueden recorrer sin usar el mouse.
- Los modales se cierran con la X, con Cancelar o con la tecla Escape.
- Las acciones que rechazan o descartan usan el botón Danger y piden confirmación antes de ejecutarse.
- El resultado de una acción, como subir una ficha o aprobarla, se comunica con una alerta que indica qué ocurrió y qué sigue.

**Aplicación móvil**  
La aplicación móvil es nativa para Android. Roboto, la tipografía de la guía general, es además la fuente del sistema en Android, por lo que la interfaz mantiene la misma voz tipográfica que la web.

La aplicación tiene una sola tarea: enviar a la web, como borrador, el archivo que genera la estación total al medir un terreno. Así el agente ya no debe llevar las coordenadas anotadas a la oficina para digitalizarlas, sino que encuentra el terreno como borrador en la web. Por ser una herramienta poco invasiva para el trabajo de campo, la interfaz es de una sola columna, con pocos pasos y una sola acción principal por pantalla.

El flujo pasa por seis pantallas: elegir el archivo, revisarlo antes de enviarlo, el envío con su avance, y los tres resultados posibles, que son enviado, pendiente de envío y error de envío. El estado pendiente responde a la necesidad del agente de que su registro no se pierda aunque no haya señal: el archivo queda guardado en el teléfono y se envía solo cuando vuelve la conexión.

<img src="./assets/ux_design/style/web_mobile/movil-envio-1.png" alt="Pantallas móviles para elegir, revisar y enviar el archivo" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 110mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

<img src="./assets/ux_design/style/web_mobile/movil-envio-2.png" alt="Pantallas móviles de resultado del envío: enviado, pendiente y error" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 110mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">

Reglas de diseño de la aplicación móvil:
- Los márgenes laterales son de 16 px y los objetivos táctiles miden al menos 44 px; los botones de la guía general miden 48 px de alto.
- El texto base mide 16 px como mínimo, y los mensajes de resultado usan las alertas de la guía general, siempre con título y una indicación de qué hacer.
- Se respetan la barra de estado y la barra de gestos del sistema, y la navegación hacia atrás usa el gesto del sistema.
- Ninguna pantalla depende de la conexión para mostrarse: el envío es lo único que la requiere, y cuando falla el archivo se conserva.
