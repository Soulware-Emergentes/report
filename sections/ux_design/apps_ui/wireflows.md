#### Aplicación móvil (Android) — Agente de Campo

Los siguientes wireflows corresponden a Marco Quispe Huamán, el User Persona Agente de Campo. Su trabajo exige registrar la medición de un terreno y conservarla aun cuando la conectividad sea limitada. Se presentan tres objetivos dentro del alcance de la aplicación móvil: ingresar al sistema, recuperar el acceso y registrar y enviar un terreno. El primero se relaciona con la User Story SGT-10; el tercero desarrolla SGT-2 a partir de las pantallas propuestas. La recuperación de contraseña es una ruta de apoyo necesaria para que el agente pueda volver a su tarea.

Antes de diagramar cada objetivo se establece su Task Flow como secuencia de acciones. En las figuras, las flechas continuas representan el recorrido principal y las discontinuas llevan a una respuesta alternativa. Cada cambio visible de la interfaz se muestra con un wireframe completo, incluidos la barra de estado y el indicador de gestos de Android. Así es posible leer tanto la acción del agente como la respuesta del sistema, sin inferir un estado que no aparece en la pantalla.

{{page_break}}

##### WF-01 · Acceder al espacio de trabajo

**User goal.** Como agente de campo, quiero ingresar con mis credenciales institucionales para registrar terrenos desde mi cuenta.

**Task Flow.** Abrir la aplicación → ingresar correo y contraseña → pulsar «Ingresar» → acceder a Inicio.

El flujo comienza con la pantalla de presentación y continúa con el formulario de acceso. El siguiente wireframe muestra las credenciales completas antes de la acción; la ruta principal termina en Inicio, donde «Registrar terreno» es la tarea destacada. Si las credenciales no coinciden, una flecha discontinua conduce a una pantalla de error completa. El mensaje permite corregir e intentar otra vez sin señalar si falló el correo o la contraseña, de acuerdo con el criterio de SGT-10.

<figure style="margin: 10px 0 14px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-mobile/wireflows/wireflow-acceso-agente-campo.png" alt="Wireflow de acceso: splash, inicio de sesión, credenciales completas e Inicio; ruta alternativa de credenciales incorrectas" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 145mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">WF-01. Acceso institucional y respuesta ante credenciales incorrectas.</figcaption>
</figure>

{{page_break}}

##### WF-02 · Recuperar el acceso a la cuenta

**User goal.** Como agente de campo, quiero restablecer mi contraseña cuando la olvide para volver a ingresar a la aplicación y continuar mi trabajo.

**Task Flow.** Seleccionar «¿Olvidó su contraseña?» → introducir el correo → solicitar el código → verificarlo → crear una nueva contraseña → volver al inicio de sesión.

La ruta principal enlaza el formulario de acceso con la solicitud del código, su verificación, la creación de una nueva contraseña y la confirmación del cambio. La ruta alternativa parte de la solicitud del código: cuando el correo no tiene un formato válido, se muestra otro wireframe con el campo y la indicación para corregirlo. La confirmación final incluye «Iniciar sesión», por lo que el agente conoce el siguiente paso y no queda en una pantalla sin salida.

<figure style="margin: 10px 0 14px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-mobile/wireflows/wireflow-recuperacion-acceso.png" alt="Wireflow de recuperación: correo, código de verificación, nueva contraseña y confirmación; ruta alternativa de correo no válido" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 145mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">WF-02. Recuperación de contraseña y corrección de un correo no válido.</figcaption>
</figure>

{{page_break}}

##### WF-03 · Registrar y enviar un terreno medido

**User goal.** Como agente de campo, quiero cargar la medición de la estación total y vincular el terreno con su beneficiario para enviarlo a la web sin perder la información capturada en campo.

**Task Flow.** Empezar el registro → completar código, fecha y referencia de ubicación → seleccionar el archivo de la estación total → comprobar el archivo adjunto → validar el DNI → revisar los datos → enviar el terreno.

La ruta principal sigue los cuatro pasos visibles del formulario móvil. El archivo por seleccionar y el archivo adjunto son wireframes distintos, porque la selección cambia el estado de la pantalla. Tras validar el DNI, el agente revisa en un resumen el código, la medición, el archivo y el beneficiario antes de enviar. La confirmación indica que el registro llegó a la web para su revisión; no equivale a la aprobación definitiva del terreno. Esta propuesta desarrolla el envío del archivo previsto en SGT-2 e incorpora la vinculación y revisión que muestran los wireframes actuales.

La primera ruta alternativa representa «DNI no encontrado» con una pantalla completa que explica el problema y permite volver a validar. La segunda se produce al enviar sin señal: el estado «Pendiente de envío» comunica que el terreno y el archivo quedaron guardados en el teléfono y ofrece reintentar. Así, la falta de conectividad no se interpreta como pérdida de la medición.

<figure style="margin: 10px 0 14px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-mobile/wireflows/wireflow-registro-terreno.png" alt="Wireflow de registro: datos del terreno, archivo, beneficiario, revisión y envío; estados alternativos de DNI no encontrado y falta de conexión" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 145mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">WF-03. Registro y envío de un terreno con respuestas ante DNI no encontrado y falta de conexión.</figcaption>
</figure>

En los tres diagramas, los títulos, números de paso, etiquetas de las flechas y mensajes de estado expresan el recorrido con palabras. Las acciones principales mantienen una posición reconocible y los errores explican cómo continuar. Esta consistencia apoya la lectura en una pantalla pequeña y evita que el agente deba interpretar el flujo únicamente por el color o por la forma de las flechas.

{{page_break}}

**Aplicación web: Agente de Campo y Asistente de Gerencia General**

Los wireflows de la aplicación web cubren las tareas que el móvil deja fuera: validar el terreno que llegó como borrador, subir la ficha firmada y validarla contra su PDF. Corresponden a los dos User Persona del proyecto, Marco Quispe Huamán como Agente de Campo y Rocío Fernández Salas como Asistente de Gerencia General, y se usan los mismos wireframes presentados en la sección anterior. Se mantienen las convenciones de los diagramas móviles: las flechas continuas marcan el recorrido principal, las discontinuas el camino de corrección o la respuesta alternativa, y los rombos las decisiones del usuario o del sistema. Cada pantalla lleva su número de paso y cada flecha el nombre de la acción que la dispara.

{{page_break}}

**WF-04 · Registrar un terreno y subir su ficha**

**User goal.** Como agente de campo, quiero dejar registrado el perímetro del terreno y subir la ficha de evaluación firmada para que la asistente pueda validarla sin que nadie transcriba los datos.

**User persona.** Marco Quispe Huamán, Agente de Campo.

**Task Flow.** Iniciar sesión → abrir Terrenos → crear el terreno con sus vértices → guardar el borrador → validar los vértices → abrir el detalle del terreno → subir la ficha en PDF → consultar Mis fichas.

El agente inicia sesión y llega a la tabla de terrenos. Con Crear terreno abre el modal, completa el DNI del beneficiario y registra los vértices del perímetro, ya sea cargando el archivo de la estación total o escribiéndolos a mano. Si falta el DNI o hay menos de 3 vértices, el modal marca los campos y el agente los corrige sin salir de él. Al guardar, el terreno queda como borrador y pasa a Validar terreno, donde el agente revisa cada vértice y, si uno está mal leído, edita solo esa fila. Una vez validado, el detalle del terreno muestra sus vértices y el botón Subir ficha. El modal de subida exige un PDF legible y completo. Si no lo es, el agente vuelve a cargarlo, y si lo es, la ficha aparece en Mis fichas con el estado En revisión. La primera decisión del recorrido corresponde al inicio de sesión de SGT-10, el borrador y su validación a SGT-2 y la subida de la ficha a SGT-3.

<figure style="margin: 10px 0 14px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/wireflows/wireflow-terreno-ficha-agente.png" alt="Wireflow web del agente: inicio de sesión, terrenos, crear terreno, validar terreno, detalle, subir ficha y Mis fichas, con caminos de corrección" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 145mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">WF-04. Registro del terreno por sus vértices y subida de la ficha.</figcaption>
</figure>

{{page_break}}

**WF-05 · Validar una ficha contra su documento**

**User goal.** Como asistente de gerencia general, quiero comparar los datos que extrajo la IA con el PDF original para aprobar la ficha con la seguridad de que el documento no fue alterado.

**User persona.** Rocío Fernández Salas, Asistente de Gerencia General.

**Task Flow.** Iniciar sesión → abrir Fichas → elegir una ficha en revisión → pulsar Validar → revisar la integridad del PDF → comparar los datos extraídos con el documento → aprobar u observar la ficha.

Después del inicio de sesión, la asistente llega a la vista general y abre Fichas, donde filtra las que están en revisión. Al pulsar Validar entra a la pantalla de validación. La primera decisión la toma el sistema: compara el hash del PDF con el que se guardó al subirlo. Si no coincide, la ficha queda marcada como Alterada y no puede aprobarse. Si coincide, la asistente compara campo por campo los datos de la IA con el documento, que aparecen lado a lado. Cuando todo coincide, aprueba la ficha y el dato se consolida en el seguimiento del PEI y del POI con el registro de quién aprobó y cuándo. Si encuentra una diferencia que no puede resolver, observa la ficha y esta vuelve al agente. El recorrido desarrolla SGT-4 en la búsqueda, SGT-5 en la revisión de campos críticos y SGT-6 en la verificación de integridad.

<figure style="margin: 10px 0 14px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/wireflows/wireflow-validar-ficha-asistente.png" alt="Wireflow web de la asistente: inicio de sesión, vista general, fichas y validación, con decisiones de integridad del PDF y coincidencia de datos" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 145mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">WF-05. Validación de una ficha con verificación de integridad y resultado aprobado, observado o alterado.</figcaption>
</figure>

{{page_break}}

**WF-06 · Gestionar el acceso a la cuenta**

**User goal.** Como usuario de SGT, quiero solicitar mi cuenta, recuperar mi contraseña cuando la olvide y ajustar mis datos para mantener el acceso al sistema sin depender de terceros más allá de lo necesario.

**User persona.** Marco Quispe Huamán, Agente de Campo, y Rocío Fernández Salas, Asistente de Gerencia General.

**Task Flow.** Solicitud de acceso: pulsar Solicite acceso → completar los datos → enviar la solicitud. Recuperación: pulsar ¿Olvidó su contraseña? → indicar el DNI o el correo → recibir el enlace. Configuración: ingresar → abrir el menú de cuenta → editar los datos → guardar los cambios.

Los tres recorridos parten del inicio de sesión. En el primero, el usuario completa la solicitud y, si los datos están completos y son válidos, la solicitud llega a la Oficina de Tecnologías, que habilita la cuenta. Si falta algún dato, el formulario lo señala. En el segundo, el sistema envía el enlace de restablecimiento solo si el DNI o el correo están registrados, y si no lo están, muestra un aviso sin revelar qué cuentas existen. En el tercero, el usuario entra a Configuración de cuenta desde el menú de la cuenta y guarda los cambios cuando son válidos. Desde la misma pantalla puede cerrar sesión. Los recorridos se relacionan con SGT-10 y SGT-11.

<figure style="margin: 10px 0 14px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/wireflows/wireflow-cuenta.png" alt="Wireflow web de cuenta: solicitud de acceso, recuperación de contraseña y configuración, cada uno desde el inicio de sesión" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 145mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">WF-06. Solicitud de acceso, recuperación de contraseña y configuración de la cuenta.</figcaption>
</figure>

Los tres wireflows web comparten las convenciones de los móviles, de modo que el lector compara ambas aplicaciones con la misma clave de lectura. Ninguna decisión deja al usuario sin salida: cada camino discontinuo regresa a la pantalla donde puede corregir o termina en un estado nombrado, como En revisión, Observada o Alterada, que el otro rol también ve.
