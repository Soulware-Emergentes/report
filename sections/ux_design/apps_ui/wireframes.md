**Aplicación móvil (Android)**

Los wireframes de la aplicación móvil de SGT se elaboraron en Figma para el agente de campo. Esta propuesta concentra en el teléfono el registro de la medición de un terreno y el envío del archivo generado por la estación total. La aceptación posterior del terreno y la carga de fichas escaneadas corresponden a la aplicación web y se documentan por separado. Las cuatro láminas siguientes agrupan las pantallas por tarea y estado para que puedan leerse sin perder la continuidad del proceso.

El acceso presenta primero la identidad de SGT, después el inicio de sesión y, como ruta de apoyo, la recuperación de contraseña mediante correo, código de verificación y creación de una nueva clave. Cada pantalla prioriza un título, campos con etiquetas persistentes y una acción principal. La confirmación final indica el siguiente paso en vez de dejar al usuario ante un estado sin salida. Esta secuencia aplica jerarquía visual, consistencia en los controles y prevención de errores desde el primer contacto con la aplicación.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-mobile/wireframe/mobile-wireframes-acceso-recuperacion.png" alt="Seis wireframes móviles de SGT: presentación, inicio de sesión y recuperación de contraseña con código, nueva clave y confirmación" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 180mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Acceso y recuperación de contraseña en la aplicación móvil.</figcaption>
</figure>

La pantalla Inicio agrupa dos destinos reconocibles: Registrar terreno como tarea principal y Mis terrenos para retomar o consultar registros. El registro avanza en cuatro pasos visibles. Primero se solicitan el código, la fecha de medición y una referencia de ubicación; luego se selecciona el archivo de la estación total y se muestra un estado distinto cuando ya está adjunto. La barra de progreso, el título de cada paso y el botón Continuar permiten saber dónde está el agente y qué falta. Guardar borrador aparece como acción secundaria y no compite visualmente con el avance.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-mobile/wireframe/mobile-wireframes-registro-terreno-archivo.png" alt="Cuatro wireframes móviles: Inicio, datos del terreno, archivo de estación total por seleccionar y archivo adjunto" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 112mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Inicio, datos del terreno y selección del archivo de medición.</figcaption>
</figure>

La vinculación del beneficiario utiliza el DNI antes del envío. El estado «DNI no encontrado» explica el problema junto al campo y ofrece Volver a validar; no presenta el error únicamente mediante un color. Cuando la identidad se confirma, una tarjeta muestra el resultado y permite cambiar el DNI antes de seguir. La revisión reúne código, fecha, archivo y beneficiario para comprobarlos antes de Enviar terreno. La confirmación comunica que el registro llegó a la web y quedó en revisión; no representa la aprobación final del terreno.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-mobile/wireframe/mobile-wireframes-validacion-envio.png" alt="Cuatro wireframes móviles: DNI no encontrado, beneficiario validado, revisión del registro y confirmación del envío" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 112mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Validación del beneficiario, revisión y resultado del envío.</figcaption>
</figure>

Mis terrenos separa los registros pendientes de los enviados mediante pestañas. Cada tarjeta expresa su estado con palabras y, cuando el terreno ya tiene código, lo muestra para facilitar la consulta. La pantalla «Pendiente de envío» hace visible una interrupción de conectividad y ofrece Reintentar ahora o Volver a pendientes. Así se distinguen la consulta, la recuperación de la tarea y los resultados sin depender solo del contraste cromático. La navegación inferior mantiene Inicio y Mis terrenos como destinos estables, mientras que el contenido de cada pantalla sigue un orden vertical de título, información y acción.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-mobile/wireframe/mobile-wireframes-seguimiento-conectividad.png" alt="Tres wireframes móviles: terrenos pendientes, terrenos enviados en revisión y estado pendiente de envío por falta de conexión" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 112mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Consulta de registros y estado de conectividad.</figcaption>
</figure>

En conjunto, la propuesta aplica una arquitectura de información orientada a tareas: acceso, registro guiado, validación previa y seguimiento. La composición de una columna, las etiquetas visibles, los textos de ayuda, la diferencia entre acciones principales y secundarias y los estados descritos con palabras favorecen la lectura en una pantalla pequeña y el uso por agentes con distintas condiciones de visión o familiaridad digital. Las áreas táctiles, el contraste y la tipografía siguen las reglas definidas en la guía de estilos de SGT; las barras de estado y de gestos respetan las convenciones de Android.

{{page_break}}

**Aplicación web**

Los wireframes de la aplicación web se elaboraron en Figma para los dos usuarios del sistema: el agente de campo, que crea y valida terrenos y sube las fichas, y la asistente de gerencia general, que valida esas fichas contra su PDF. Todas las pantallas comparten el mismo esquema. Una barra lateral da acceso a Beneficiarios, Agentes de campo, Fichas y Terrenos, y el mapa queda siempre de fondo. Las secciones se abren junto al mapa o a pantalla completa según el espacio que necesitan, y cada panel lleva los botones para colapsarlo y cerrarlo. Las pantallas se presentan en el orden en que se usan, desde el acceso hasta el trabajo de cada rol.

**Inicio de sesión**

Pantalla de acceso dividida en dos zonas. A la izquierda va la identidad de SGT con una frase que resume su propósito, y a la derecha el formulario con usuario o DNI, contraseña y el botón Iniciar sesión. Debajo están los enlaces para recuperar la contraseña y para solicitar acceso. El texto de apoyo aclara que lo que el usuario ve después depende del rol que tiene asignado.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-inicio-sesion.png" alt="Wireframe web de inicio de sesión con usuario o DNI, contraseña y enlaces de recuperación y solicitud de acceso" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Inicio de sesión con credenciales institucionales.</figcaption>
</figure>

**Solicitar acceso**

SGT es de uso interno, así que no hay registro libre. Esta pantalla recoge el DNI, los nombres y apellidos, el correo institucional y la oficina zonal, y envía la solicitud a la Oficina de Tecnologías, que habilita la cuenta tras verificar los datos. El texto de apoyo lo explica para que el usuario no espere un acceso inmediato.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-registro.png" alt="Wireframe web de solicitud de acceso con DNI, nombres, correo institucional y oficina zonal" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Solicitud de acceso revisada por la Oficina de Tecnologías.</figcaption>
</figure>

**Recuperar contraseña**

El usuario indica su DNI o su correo institucional y recibe un enlace para restablecer la contraseña. La pantalla muestra el estado Enlace enviado con el plazo de vencimiento del enlace y ofrece volver al inicio de sesión, de modo que el usuario sabe qué hacer a continuación.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-recuperar-contrasena.png" alt="Wireframe web de recuperación de contraseña con el aviso de enlace enviado" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Recuperación de contraseña con confirmación del envío.</figcaption>
</figure>

**Vista general (mapa)**

Es el punto de partida después de iniciar sesión. El mapa ocupa toda la pantalla y dibuja cada terreno como un polígono. La barra lateral queda colapsada en iconos, los controles de capas, zoom y centrado están a la derecha, y la leyenda distingue los terrenos validados, los borradores y el seleccionado. La barra inferior muestra la posición del cursor y la escala.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-vista-general.png" alt="Wireframe web del mapa a pantalla completa con terrenos dibujados como polígonos, controles y leyenda" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Mapa de terrenos como vista principal.</figcaption>
</figure>

**Beneficiarios**

Panel abierto junto al mapa para buscar beneficiarios por DNI o nombre. La tabla muestra el DNI, los nombres y apellidos, la zona, el número de terrenos y el estado de cada beneficiario, con paginación al pie. El mapa sigue visible a la derecha y señala la zona y los terrenos que están en vista.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-beneficiarios.png" alt="Wireframe web de la sección Beneficiarios con filtros, tabla paginada y mapa a la derecha" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Búsqueda de beneficiarios con el mapa desplazado.</figcaption>
</figure>

**Agentes de campo**

Sigue el mismo patrón que Beneficiarios. Se filtra por DNI del agente y por zona, y la tabla indica cuántas fichas registró cada agente en el mes y si está en campo, activo o sin reportar. Repetir la estructura reduce lo que el usuario tiene que aprender de una sección a otra.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-agentes-campo.png" alt="Wireframe web de la sección Agentes de campo con filtros por DNI y zona y tabla de agentes" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Consulta de agentes de campo por DNI y zona.</figcaption>
</figure>

**Fichas (asistente de gerencia general)**

Vista a pantalla completa porque la tabla necesita todo el ancho. Se filtra por código de ficha, DNI del agente y estado, y cada fila muestra las fechas de llenado y de validación, el terreno vinculado y el estado escrito en un chip. Las fichas en revisión u observadas llevan el botón Validar, que abre la pantalla de validación.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-fichas.png" alt="Wireframe web de la tabla de fichas con filtros, estados y botón Validar en las fichas pendientes" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Bandeja de fichas con acceso a la validación.</figcaption>
</figure>

**Validar ficha**

Es la pantalla central de la asistente. Arriba, una alerta confirma que el PDF no cambió desde que se subió. Debajo, la pantalla se divide en dos columnas: a la izquierda los datos que extrajo la IA, cada uno editable, y a la derecha el documento original con la línea correspondiente resaltada. Así la asistente compara dato y documento sin cambiar de pantalla. Si corrige un valor, el campo lo indica. Un aviso explica que al aprobar se notifica al sistema del POI y se registra quién aprobó y cuándo. Las acciones son Volver, Observar ficha y Aprobar ficha.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-validar-ficha.png" alt="Wireframe web de validación de ficha con alerta de integridad, datos extraídos por la IA y PDF original lado a lado" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Validación de la ficha: datos de la IA frente al documento original.</figcaption>
</figure>

**Terrenos (asistente de gerencia general)**

Tabla de solo consulta con el código, el DNI del beneficiario, el número de vértices del perímetro, la fecha de actualización y el estado de cada terreno. La asistente no crea ni valida terrenos, por eso esta vista no tiene acciones y solo muestra los terrenos validados.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-terrenos-asistente.png" alt="Wireframe web de la tabla de terrenos de solo consulta con la columna de vértices" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Consulta de terrenos validados.</figcaption>
</figure>

**Detalle de terreno (asistente de gerencia general)**

Al pulsar un terreno en el mapa se abre un popup con el DNI del beneficiario, el área estimada y dos desplegables. El de vértices permanece cerrado, porque a la asistente le interesan las fichas, pero los vértices quedan numerados sobre el polígono del mapa. El de fichas lista las fichas del terreno con su estado y el botón Validar en la que está pendiente, lo que ofrece un segundo camino hacia la validación.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-detalle-terreno-asistente.png" alt="Wireframe web del popup de terreno con área, vértices plegados, fichas y vértices numerados en el mapa" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Detalle de terreno desde el mapa, vista de la asistente.</figcaption>
</figure>

**Terrenos (agente de campo)**

La misma tabla, pero con las acciones del agente. El botón Crear terreno queda arriba a la derecha, y los borradores que el agente guardó muestran el botón Validar. El agente ve todos los terrenos validados, pero solo sus propios borradores.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-terrenos-agente.png" alt="Wireframe web de la tabla de terrenos del agente con el botón Crear terreno y Validar en un borrador" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Tabla de terrenos con las acciones del agente de campo.</figcaption>
</figure>

**Crear terreno**

Un terreno no se ubica con un solo punto: su perímetro es un polígono. Por eso el modal tiene dos columnas. A la izquierda van el código, que se asigna automáticamente, el DNI y el nombre del beneficiario, el área, que se calcula a partir de los vértices, y una vista previa del perímetro. A la derecha está la lista de vértices. El agente puede cargar el archivo de la estación total o escribir cada vértice a mano con su Este y su Norte en coordenadas UTM, agregarlos y quitarlos. La vista previa avisa desde el inicio que se necesitan al menos 3 vértices para dibujar el perímetro.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-crear-terreno.png" alt="Wireframe web del modal Crear terreno con datos del beneficiario, carga del archivo de la estación total y tabla de vértices vacía" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Creación de un terreno a partir de la lista de vértices de su perímetro.</figcaption>
</figure>

**Validar terreno**

Cuando el agente envió la medición desde el móvil, el terreno llega como borrador con los vértices ya leídos del archivo. El modal muestra el nombre del archivo y cuántos vértices tiene, la tabla en modo lectura y el polígono dibujado con sus vértices numerados. Si un punto tiene un error de lectura, el agente edita solo esa fila, como ocurre en el vértice 4, sin volver a capturar el resto. El área se recalcula con cada cambio.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-validar-terreno.png" alt="Wireframe web del modal Validar terreno con el archivo cargado, seis vértices, un vértice en edición y la vista previa del polígono" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Validación de un terreno precargado y corrección puntual de un vértice.</figcaption>
</figure>

**Detalle de terreno (agente de campo)**

En la vista del agente el desplegable de vértices se abre y muestra la tabla con el número y las coordenadas Este y Norte de cada punto, mientras el polígono del mapa los numera en el mismo orden. Debajo están las fichas del terreno y el botón Subir ficha, que abre el modal con el terreno ya vinculado.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-detalle-terreno-agente.png" alt="Wireframe web del popup de terreno con la tabla de vértices desplegada, fichas y botón Subir ficha" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Detalle de terreno con sus vértices, vista del agente.</figcaption>
</figure>

**Subir ficha**

Modal con el código de la ficha, la fecha de llenado y el terreno vinculado, en el orden en que el agente los encuentra en el documento físico. La zona de carga acepta el PDF arrastrado o seleccionado desde el equipo. Al subirlo, el sistema guarda el PDF sin modificar y su hash, que después permite comprobar su integridad.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-subir-ficha.png" alt="Wireframe web del modal Subir ficha con código, fecha, terreno vinculado y zona de carga del PDF" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Subida de la ficha digitalizada.</figcaption>
</figure>

**Mis fichas**

El agente consulta las fichas que subió con los mismos filtros que usa la asistente. El estado de cada ficha le dice si sigue en revisión, si fue aprobada o si fue observada y debe corregirse, sin tener que llamar a la sede.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-mis-fichas.png" alt="Wireframe web de Mis fichas con filtros y tabla de fichas subidas por el agente" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Seguimiento de las fichas subidas por el agente.</figcaption>
</figure>

**Configuración de cuenta**

Agrupa los datos del usuario en tres bloques: Cuenta, con el correo, el área y el teléfono; Seguridad, con la contraseña, la verificación en dos pasos y las sesiones activas; y Preferencias, con el idioma, las notificaciones y la zona horaria. Desde aquí también se cierra la sesión.

<figure style="margin: 12px 0 18px; break-inside: avoid; page-break-inside: avoid; text-align: center;">
  <img src="./assets/ux_design/applications-design/app-web/wireframe/web-configuracion-cuenta.png" alt="Wireframe web de configuración de cuenta con bloques de cuenta, seguridad y preferencias" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Configuración de la cuenta y cierre de sesión.</figcaption>
</figure>

En conjunto, los wireframes web aplican tres decisiones constantes. El mapa es el fondo del trabajo y no una sección más. Las tablas comparten filtros, columnas y paginación en todas las secciones. Los estados de fichas y terrenos se escriben siempre con palabras. Las diferencias entre roles se resuelven con las acciones visibles en cada pantalla y no con pantallas distintas, de modo que el agente y la asistente reconocen el mismo sistema aunque cada uno trabaje en una parte del proceso.
