Los prototipos interactivos de SGT simulan la navegación y las respuestas de las aplicaciones Android y web a partir de los mock-ups y los User Flow Diagrams. Permiten recorrer las tareas del agente de campo y de la asistente de gerencia general, reconocer las decisiones de cada proceso y revisar las alternativas ante errores antes de su implementación.

Las interacciones mantienen la organización definida en la arquitectura de información. En Android, Inicio y Enviados son los destinos principales, mientras que el registro avanza mediante pasos consecutivos con las acciones Volver y Continuar. En la web, la barra lateral organiza el acceso a Beneficiarios, Agentes de campo, Fichas, Terrenos y Mi cuenta. Los formularios, paneles y ventanas de confirmación conservan el contexto de la tarea y diferencian avanzar, cancelar y finalizar.

Los botones y enlaces conducen a estados que muestran el resultado de la acción. Los mensajes de validación se presentan junto a los campos, las confirmaciones indican qué ocurrió y los errores ofrecen una forma de corregir o reintentar. Las acciones de descarte y salida se distinguen de las acciones principales para reducir pérdidas involuntarias de información. El color se acompaña de títulos y etiquetas que permiten interpretar cada estado.

La selección de archivos, la comprobación de identidad, la transferencia de información y la verificación de integridad se representan mediante estados de interfaz. El prototipo permite revisar estos recorridos; su ejecución con archivos, servicios y datos reales corresponde a las aplicaciones implementadas.

**Aplicación móvil (Android): Agente de Campo**

El prototipo móvil corresponde a Marco Quispe Huamán, User Persona Agente de Campo. Comprende el acceso institucional, la recuperación de contraseña y el registro y envío de la medición de un terreno. La navegación inferior conserva Inicio y Enviados para separar el comienzo de una tarea de la consulta de su recepción en la web.

**Prototipo interactivo:** [Aplicación Android de SGT](https://www.figma.com/proto/BRCoSsU9rg30nFZ45MqYiv/PROTOTIPOS-EMERGENTES?node-id=350-5461&scaling=scale-down&content-scaling=fixed&page-id=350%3A622&starting-point-node-id=350%3A5497&show-proto-sidebar=1).

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/prototyping/FIGMA-PROTOTIPO-MOBILE.png" alt="Conexiones del prototipo Android de SGT entre acceso, recuperación, registro y consulta de terrenos enviados" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 150mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Conexiones de navegación e interacción del prototipo Android.</figcaption>
</figure>

**Acceso y recuperación de contraseña.** El recorrido comienza en la presentación de SGT y continúa hacia el formulario de acceso. Las credenciales válidas permiten llegar a Inicio; las incorrectas muestran un aviso y permiten volver a intentarlo. La recuperación enlaza el correo, la verificación del código, su reenvío y la definición de una nueva contraseña. Los estados de correo inválido, código incorrecto o vencido y contraseñas que no coinciden permiten comprobar cómo se orienta la corrección dentro de la misma tarea.

**Registro y envío del terreno.** Desde Inicio, el agente comienza un registro de cuatro pasos: datos del terreno, archivo de medición, vinculación del beneficiario y revisión. El prototipo diferencia los campos incompletos, el archivo adjunto y el archivo que supera los 20 MB. La consulta del DNI distingue la identidad confirmada, el documento no encontrado y la falta de conexión. Antes de enviar, el resumen reúne la información para que el agente pueda revisarla y volver al paso anterior si necesita corregirla.

**Resultado y seguimiento.** El envío muestra un estado de transferencia y una confirmación de recepción como Borrador en web. Desde Inicio y Enviados, el agente consulta el detalle del terreno recibido. Las alternativas de falta de conexión o error permiten reintentar o volver a revisión. Al salir del registro sin enviar, una confirmación permite seguir editando o descartar los datos. La aplicación no ofrece guardado de borradores locales ni una cola automática de pendientes; el borrador recibido se revisa y valida posteriormente en la web.

**Video de demostración en Microsoft Stream:** [Demostración de los prototipos Android y web](https://upcedupe-my.sharepoint.com/:v:/g/personal/u202310210_upc_edu_pe/IQBtG5oadjsDQ62zfPdxv4FNAeFjwB8qI9xASyOH8ayCvtw?e=nRaTCT&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D).
<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/prototyping/video-prototipo-mobile.png" alt="Captura del video del prototipo Android de SGT: selección del archivo de estación total" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 145mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Demostración del prototipo Android: selección del archivo de medición.</figcaption>
</figure>

{{page_break}}

**Aplicación web**

El prototipo web reúne los recorridos del agente de campo y de la asistente de gerencia general. El acceso conduce a las funciones correspondientes a cada rol: Terrenos para el agente y la vista general del mapa para la asistente. La navegación lateral mantiene las secciones del dominio y permite pasar de la consulta territorial al trabajo con terrenos y fichas.

**Prototipo interactivo:** [Aplicación web de SGT](https://www.figma.com/proto/BRCoSsU9rg30nFZ45MqYiv/PROTOTIPOS-EMERGENTES?node-id=387-2908&scaling=scale-down&content-scaling=fixed&page-id=350%3A621&starting-point-node-id=387%3A2908&show-proto-sidebar=1).

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/prototyping/FIGMA-PROTOTIPO-WEB.png" alt="Conexiones del prototipo web de SGT para el acceso y los recorridos de Agente de Campo y Asistente de Gerencia General" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 150mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Conexiones de navegación e interacción del prototipo web para ambos roles.</figcaption>
</figure>

**Agente de Campo**

El recorrido de Marco Quispe Huamán comienza con el acceso a Terrenos. Desde el listado puede crear un registro con el archivo de la estación total o mediante el ingreso manual de vértices. Los datos incompletos llevan a una respuesta de validación; cuando están completos, el agente guarda un borrador y revisa el perímetro antes de validar. Los terrenos enviados desde Android se incorporan a este mismo proceso de revisión de vértices.

Una vez validado el terreno, su detalle permite abrir Subir ficha. El prototipo representa la selección del PDF, el archivo listo para enviar y el rechazo de una copia inválida o dañada. La confirmación de carga conduce al seguimiento en Mis fichas, donde el agente reconoce el estado En revisión y puede consultar el resultado posterior. La recepción del documento y su aprobación son momentos distintos del proceso.

La interacción mantiene próximos el terreno, sus vértices y las fichas vinculadas. Las acciones de guardar, validar y subir identifican el resultado de cada paso; Cancelar permite abandonar el formulario y regresar al contexto de consulta.

**Asistente de Gerencia General**

El recorrido de Rocío Fernández Salas parte de la vista general y permite consultar beneficiarios, agentes y terrenos. En Fichas, los filtros localizan el documento que se revisará. Una búsqueda sin resultados permite ajustar los criterios; al iniciar la validación, el estado de integridad determina si se puede continuar con la comparación de datos o si la ficha queda Alterada y se bloquea su aprobación.

La revisión presenta los datos extraídos junto al PDF original para compararlos dentro de la misma vista. Si un valor puede corregirse con el documento, la asistente lo modifica y vuelve a revisar. Cuando los datos son correctos y completos, Aprobar ficha conduce a la confirmación y al estado Aprobada en la bandeja. Si falta evidencia o una diferencia no puede resolverse, Observar ficha solicita un motivo y deja el documento en estado Observada para su atención por el agente.

Los resultados distinguen la aprobación registrada, la corrección solicitada y el bloqueo por integridad. El aviso de aprobación comunica la notificación al sistema POI, mientras que la observación conserva el vínculo con el documento y explica qué requiere corrección. La vuelta a Fichas permite comprobar el estado resultante sin perder la referencia del registro evaluado.

**Acceso y gestión de cuenta.** Ambos roles disponen de solicitud de acceso institucional, recuperación de contraseña, edición de los datos permitidos de su cuenta y cierre de sesión. La solicitud queda pendiente de revisión institucional. La recuperación web utiliza un enlace recibido por correo, con estados de vencimiento y confirmación del cambio. Guardar cambios confirma la edición del perfil; Cerrar sesión termina el acceso, mientras que cerrar únicamente el panel conserva la sesión activa.

**Video de demostración en Microsoft Stream (ambos roles):** [Demostración de los prototipos Android y web](https://upcedupe-my.sharepoint.com/:v:/g/personal/u202310210_upc_edu_pe/IQBtG5oadjsDQ62zfPdxv4FNAeFjwB8qI9xASyOH8ayCvtw?e=nRaTCT&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D).

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/prototyping/video-prototipo-web.png" alt="Captura del video del prototipo web de SGT: consulta de beneficiarios" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 145mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">Demostración del prototipo web: consulta de beneficiarios.</figcaption>
</figure>
