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
