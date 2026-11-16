Los user flows de SGT describen los recorridos que permiten al agente de campo y a la asistente de gerencia general alcanzar sus objetivos en las aplicaciones. Cada recorrido relaciona las pantallas con las decisiones del sistema, el resultado esperado y las alternativas de corrección o salida.

Las cápsulas representan inicios, resultados y referencias de continuidad; los rombos expresan condiciones y los mock-ups muestran los estados de la interfaz. Las flechas continuas en teal indican el recorrido principal y las discontinuas en rojo señalan errores, reintentos o salidas alternativas. Las etiquetas indican qué acción o condición produce cada transición.

**Aplicación móvil (Android): Agente de Campo**

User Persona: Marco Quispe Huamán. La aplicación permite ingresar al espacio de trabajo, recuperar el acceso y enviar la medición de un terreno a la web. Los recorridos corresponden a los wireflows WF-01, WF-02 y WF-03; el registro actual requiere conexión para validar el DNI y enviar, y no ofrece guardado de borradores locales.

{{page_break}}

**UF-01. Acceder al espacio de trabajo**

**User goal.** Como agente de campo, quiero ingresar con mis credenciales institucionales para registrar terrenos desde mi cuenta.

**Explicación:** El agente abre la aplicación e ingresa con el correo y la contraseña de su cuenta institucional. Si las credenciales son válidas, llega a Inicio. Si son incorrectas, el sistema presenta un aviso y permite corregirlas y reintentar. La opción de contraseña olvidada conduce a UF-02.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-mobile/user-flows/uf-m01-diagrama.png" alt="User flow de SGT: UF-01. Acceso institucional" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-01. Acceso institucional.</figcaption>
</figure>

{{page_break}}

**UF-02. Recuperar el acceso a la cuenta**

**User goal.** Como agente de campo, quiero restablecer mi contraseña para recuperar el acceso a mi cuenta.

**Explicación:** Desde Inicio de sesión, el agente selecciona ¿Olvidó su contraseña?, escribe el correo asociado a su cuenta y solicita el código. Si el formato es válido, continúa con la verificación; de lo contrario, corrige el campo. Un código correcto y vigente permite avanzar a la referencia A. Si el código es incorrecto o venció, puede corregirlo o solicitar otro; el estado de reenvío regresa a la verificación.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-mobile/user-flows/uf-m02a-diagrama.png" alt="User flow de SGT: UF-02A. Correo y verificación del código" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-02A. Correo y verificación del código.</figcaption>
</figure>

{{page_break}}

**Explicación:** La referencia A continúa con la creación y confirmación de la nueva contraseña. Si ambas coinciden, el sistema guarda el cambio y permite volver al inicio de sesión. Si difieren, el agente corrige los campos antes de guardar. La confirmación del cambio deja disponible el acceso con la nueva clave.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-mobile/user-flows/uf-m02b-diagrama.png" alt="User flow de SGT: UF-02B. Nueva contraseña y retorno al acceso" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-02B. Nueva contraseña y retorno al acceso.</figcaption>
</figure>

{{page_break}}

**UF-03. Registrar, enviar y consultar un terreno**

**User goal.** Como agente de campo, quiero registrar la medición de un terreno, vincular al beneficiario y enviarla a la web para comprobar su recepción.

**Explicación:** Con la sesión iniciada, el agente comienza el registro desde Inicio y completa los datos del terreno. Los campos incompletos conducen a su corrección antes de avanzar. Luego selecciona el archivo de medición; si supera los 20 MB, elige otro. Con los datos y el archivo válidos, la referencia B continúa con la vinculación del beneficiario.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-mobile/user-flows/uf-m03a-diagrama.png" alt="User flow de SGT: UF-03A. Datos del terreno y archivo de medición" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-03A. Datos del terreno y archivo de medición.</figcaption>
</figure>

{{page_break}}

**Explicación:** Desde B, el agente ingresa el DNI y solicita validarlo. Con conexión y un beneficiario registrado, revisa la identidad y el resumen antes de enviar. Un DNI no encontrado exige corregirlo; la falta de conexión permite reintentar la consulta. La referencia C inicia el envío. Si intenta salir, puede seguir editando o confirmar la salida y descartar los datos. R permite regresar a esta revisión desde un error de envío.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-mobile/user-flows/uf-m03b-diagrama.png" alt="User flow de SGT: UF-03B. Beneficiario, revisión y salida del registro" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-03B. Beneficiario, revisión y salida del registro.</figcaption>
</figure>

{{page_break}}

**Explicación:** Desde C, la aplicación transfiere el registro. Solo una recepción confirmada conduce a Terreno enviado; después, el agente abre Inicio, Enviados y el detalle para comprobar el Borrador en web. Si falta conexión o la transferencia falla, puede reintentar o regresar mediante R a la revisión. No se genera un borrador local ni una cola automática de envíos pendientes. La validación de los vértices se realiza posteriormente en la web.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-mobile/user-flows/uf-m03c-diagrama.png" alt="User flow de SGT: UF-03C. Envío y consulta de la recepción" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-03C. Envío y consulta de la recepción.</figcaption>
</figure>

{{page_break}}

**Aplicación web: Agente de Campo**

User Persona: Marco Quispe Huamán. El agente registra y valida terrenos, carga las fichas firmadas y consulta su estado. El acceso institucional y la gestión de cuenta acompañan estas tareas.

**UF-W01. Acceder a las funciones del rol**

**User goal.** Como agente de campo, quiero iniciar sesión con mis credenciales institucionales para acceder a las funciones asignadas a mi rol.

**Explicación:** El usuario ingresa sus credenciales y solicita iniciar sesión. Si son válidas, el sistema identifica el rol: el agente accede a Terrenos y la asistente a la vista general del mapa. En este segmento, el recorrido termina con las funciones de campo disponibles. Las credenciales incorrectas producen un aviso general y permiten corregir y reintentar.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/user-flows/uf-w01-diagrama.png" alt="User flow de SGT: UF-W01. Acceso según el rol" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-W01. Acceso según el rol.</figcaption>
</figure>

{{page_break}}

**UF-W02. Solicitar acceso institucional**

**User goal.** Como agente de campo, quiero enviar mis datos a la Oficina de Tecnologías para solicitar una cuenta institucional.

**Explicación:** El usuario selecciona Solicite acceso, completa sus datos y envía la solicitud. Los campos incompletos o con formato inválido se corrigen antes de reenviar. La confirmación deja la solicitud pendiente de revisión por la Oficina de Tecnologías; la cuenta todavía no está habilitada.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/user-flows/uf-w02-diagrama.png" alt="User flow de SGT: UF-W02. Solicitud y revisión de datos" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-W02. Solicitud y revisión de datos.</figcaption>
</figure>

{{page_break}}

**UF-W03. Recuperar la contraseña**

**User goal.** Como agente de campo, quiero restablecer mi contraseña para recuperar el acceso a mi cuenta institucional.

**Explicación:** Desde Inicio de sesión, el usuario selecciona ¿Olvidó su contraseña? y solicita el restablecimiento con su DNI o correo registrado. La confirmación conserva el mismo mensaje exista o no la cuenta. Si los datos están registrados, recibe un enlace: cuando está vigente, abre Nueva contraseña y continúa en A; si venció o ya fue utilizado, solicita otro.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/user-flows/uf-w03a-diagrama.png" alt="User flow de SGT: UF-W03A. Solicitud del enlace de recuperación" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-W03A. Solicitud del enlace de recuperación.</figcaption>
</figure>

{{page_break}}

**Explicación:** Desde A, el usuario escribe y confirma la nueva clave. Si ambas entradas son válidas y coinciden, guarda el cambio y vuelve al inicio de sesión. Si difieren, corrige los valores y vuelve a guardar. Para acceder a las funciones del sistema debe iniciar sesión con la contraseña actualizada.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/user-flows/uf-w03b-diagrama.png" alt="User flow de SGT: UF-W03B. Definición de la nueva contraseña" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-W03B. Definición de la nueva contraseña.</figcaption>
</figure>

{{page_break}}

**UF-W04. Registrar y validar un terreno**

**User goal.** Como agente de campo, quiero registrar el perímetro y comprobar sus vértices para dejar el terreno validado y habilitar la carga de su ficha.

**Explicación:** Con su sesión iniciada, el agente abre Terrenos y crea un registro con el archivo de medición o con vértices ingresados manualmente. Si falta el DNI o no hay al menos tres vértices completos, corrige el formulario. Después guarda el borrador, revisa los puntos y valida el terreno. Cuando el borrador procede de Android, selecciona Validar en el listado y continúa en el paso 05 del diagrama. El resultado habilita la carga de la ficha.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/user-flows/uf-w04-diagrama.png" alt="User flow de SGT: UF-W04. Registro y validación del perímetro" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-W04. Registro y validación del perímetro.</figcaption>
</figure>

{{page_break}}

**UF-W05. Subir la ficha firmada y consultar su estado**

**User goal.** Como agente de campo, quiero subir la ficha de evaluación firmada en PDF para vincularla al terreno y consultar su estado.

**Explicación:** Desde el detalle de un terreno validado, el agente abre Subir ficha, completa los datos y adjunta el PDF. Un archivo inválido o dañado produce un aviso y permite seleccionar otra copia. Con un PDF válido, confirma la carga y consulta Mis fichas. La recepción deja el documento vinculado al terreno y en estado En revisión, a la espera de la evaluación de gerencia.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/user-flows/uf-w05-diagrama.png" alt="User flow de SGT: UF-W05. Carga del PDF y seguimiento" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-W05. Carga del PDF y seguimiento.</figcaption>
</figure>

{{page_break}}

**UF-W07. Actualizar los datos de la cuenta**

**User goal.** Como agente de campo, quiero actualizar mis datos de contacto para mantener vigente la información de mi cuenta institucional.

**Explicación:** El usuario abre Mi cuenta, selecciona Editar perfil y modifica los datos permitidos. Guardar cambios produce la confirmación de actualización. Si cierra antes de guardar, vuelve al mapa sin registrar la edición. La identidad, el rol y el área institucional se conservan como información de consulta.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/user-flows/uf-w07-diagrama.png" alt="User flow de SGT: UF-W07. Edición y guardado del perfil" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-W07. Edición y guardado del perfil.</figcaption>
</figure>

{{page_break}}

**UF-W08. Cerrar la sesión**

**User goal.** Como agente de campo, quiero cerrar mi sesión para impedir que otra persona utilice el sistema con mis credenciales.

**Explicación:** Desde Mi cuenta, el usuario selecciona Cerrar sesión. El sistema termina la sesión y muestra el formulario de acceso; volver a trabajar requiere ingresar las credenciales. Cerrar únicamente el panel con la X regresa al mapa y conserva la sesión activa.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/user-flows/uf-w08-diagrama.png" alt="User flow de SGT: UF-W08. Cierre de sesión y cierre del panel" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-W08. Cierre de sesión y cierre del panel.</figcaption>
</figure>

{{page_break}}

**Aplicación web: Asistente de Gerencia General**

User Persona: Rocío Fernández Salas. La asistente consulta las fichas, verifica la integridad de los documentos y contrasta los datos extraídos antes de aprobar u observar. La vista general permite acceder a las consultas territoriales y a la revisión.

**UF-W01. Acceder a las funciones del rol**

**User goal.** Como asistente de gerencia general, quiero iniciar sesión con mis credenciales institucionales para acceder a las funciones asignadas a mi rol.

**Explicación:** El usuario ingresa sus credenciales y solicita iniciar sesión. Si son válidas, el sistema identifica el rol: el agente accede a Terrenos y la asistente a la vista general del mapa. En este segmento, el recorrido termina con las funciones de gerencia disponibles. Las credenciales incorrectas producen un aviso general y permiten corregir y reintentar.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/user-flows/uf-w01-diagrama.png" alt="User flow de SGT: UF-W01. Acceso según el rol" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-W01. Acceso según el rol.</figcaption>
</figure>

{{page_break}}

**UF-W02. Solicitar acceso institucional**

**User goal.** Como asistente de gerencia general, quiero enviar mis datos a la Oficina de Tecnologías para solicitar una cuenta institucional.

**Explicación:** El usuario selecciona Solicite acceso, completa sus datos y envía la solicitud. Los campos incompletos o con formato inválido se corrigen antes de reenviar. La confirmación deja la solicitud pendiente de revisión por la Oficina de Tecnologías; la cuenta todavía no está habilitada.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/user-flows/uf-w02-diagrama.png" alt="User flow de SGT: UF-W02. Solicitud y revisión de datos" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-W02. Solicitud y revisión de datos.</figcaption>
</figure>

{{page_break}}

**UF-W03. Recuperar la contraseña**

**User goal.** Como asistente de gerencia general, quiero restablecer mi contraseña para recuperar el acceso a mi cuenta institucional.

**Explicación:** Desde Inicio de sesión, el usuario selecciona ¿Olvidó su contraseña? y solicita el restablecimiento con su DNI o correo registrado. La confirmación conserva el mismo mensaje exista o no la cuenta. Si los datos están registrados, recibe un enlace: cuando está vigente, abre Nueva contraseña y continúa en A; si venció o ya fue utilizado, solicita otro.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/user-flows/uf-w03a-diagrama.png" alt="User flow de SGT: UF-W03A. Solicitud del enlace de recuperación" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-W03A. Solicitud del enlace de recuperación.</figcaption>
</figure>

{{page_break}}

**Explicación:** Desde A, el usuario escribe y confirma la nueva clave. Si ambas entradas son válidas y coinciden, guarda el cambio y vuelve al inicio de sesión. Si difieren, corrige los valores y vuelve a guardar. Para acceder a las funciones del sistema debe iniciar sesión con la contraseña actualizada.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/user-flows/uf-w03b-diagrama.png" alt="User flow de SGT: UF-W03B. Definición de la nueva contraseña" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-W03B. Definición de la nueva contraseña.</figcaption>
</figure>

{{page_break}}

**UF-W06. Revisar y resolver una ficha**

**User goal.** Como asistente de gerencia general, quiero contrastar los datos extraídos con el PDF original para aprobar u observar la ficha con evidencia verificable.

**Explicación:** Desde la vista general, la asistente abre Fichas y busca el registro. Si no hay resultados, ajusta o limpia los filtros. Al seleccionar Validar, se comprueba la integridad del PDF. Si coincide con la registrada en la carga, se habilita la revisión y se continúa en B. Si no coincide, la ficha queda Alterada y su aprobación se bloquea; la bandeja conserva ese resultado.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/user-flows/uf-w06a-diagrama.png" alt="User flow de SGT: UF-W06A. Búsqueda y comprobación de integridad" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-W06A. Búsqueda y comprobación de integridad.</figcaption>
</figure>

{{page_break}}

**Explicación:** Desde B, la asistente compara los campos extraídos con el documento. Si los datos son correctos y completos, aprueba la ficha y comprueba el resultado en la bandeja. Si encuentra un valor que puede corregir con el PDF, lo edita y vuelve a comparar. Cuando falta evidencia o la diferencia no puede resolverse, registra un motivo y envía la observación. La ficha queda Observada para que el agente atienda la corrección.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/user-flows/uf-w06b-diagrama.png" alt="User flow de SGT: UF-W06B. Comparación de datos y resolución" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-W06B. Comparación de datos y resolución.</figcaption>
</figure>

{{page_break}}

**UF-W07. Actualizar los datos de la cuenta**

**User goal.** Como asistente de gerencia general, quiero actualizar mis datos de contacto para mantener vigente la información de mi cuenta institucional.

**Explicación:** El usuario abre Mi cuenta, selecciona Editar perfil y modifica los datos permitidos. Guardar cambios produce la confirmación de actualización. Si cierra antes de guardar, vuelve al mapa sin registrar la edición. La identidad, el rol y el área institucional se conservan como información de consulta.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/user-flows/uf-w07-diagrama.png" alt="User flow de SGT: UF-W07. Edición y guardado del perfil" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-W07. Edición y guardado del perfil.</figcaption>
</figure>

{{page_break}}

**UF-W08. Cerrar la sesión**

**User goal.** Como asistente de gerencia general, quiero cerrar mi sesión para impedir que otra persona utilice el sistema con mis credenciales.

**Explicación:** Desde Mi cuenta, el usuario selecciona Cerrar sesión. El sistema termina la sesión y muestra el formulario de acceso; volver a trabajar requiere ingresar las credenciales. Cerrar únicamente el panel con la X regresa al mapa y conserva la sesión activa.

<figure style="margin: 12px 0 18px; text-align: center; break-inside: avoid; page-break-inside: avoid;">
  <img src="./assets/ux_design/applications-design/app-web/user-flows/uf-w08-diagrama.png" alt="User flow de SGT: UF-W08. Cierre de sesión y cierre del panel" style="display: block; width: auto; height: auto; max-width: 100%; max-height: 160mm; object-fit: contain; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
  <figcaption style="font-size: 0.9em; margin-top: 6px;">UF-W08. Cierre de sesión y cierre del panel.</figcaption>
</figure>
