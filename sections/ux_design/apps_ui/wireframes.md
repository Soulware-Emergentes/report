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
