Se presentan las historias de usuario priorizadas por dependencia técnica y valor de negocio.

El backlog se mantiene en YouTrack, donde cada historia está registrada como una issue del proyecto SGT. La siguiente captura muestra su estado actual, y el tablero completo puede consultarse en [soulware.youtrack.cloud](https://soulware.youtrack.cloud/issues/SGT).

![Backlog en YouTrack](backlog.assets/backlog.png)

A continuación se detalla el orden de implementación de cada historia.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px;">
    <thead>
        <tr>
            <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left;"># Orden</th>
            <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left;">User Story ID</th>
            <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Título</th>
            <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Descripción</th>
            <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Story Points</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">1</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">SGT-10</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Iniciar sesión con credenciales institucionales</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Como usuario del sistema, quiero iniciar sesión con mi usuario y contraseña, para acceder solo a las funciones correspondientes a mi rol.</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">5</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">2</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">SGT-11</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Cerrar sesión</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Como usuario del sistema, quiero cerrar mi sesión, para que nadie más pueda usar el sistema con mis credenciales si dejo el dispositivo desatendido.</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">3</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">3</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">SGT-2</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Visualizar con antelación los puntos capturados por la estación total durante la visita</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Como agente de campo georreferenciador, quiero visualizar en el dispositivo los puntos que ya fueron capturados por la estación total mientras recorro el terreno, para detectar y corregir errores de medición antes de finalizar la visita.</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">5</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">4</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">SGT-3</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Subir la ficha diligenciada para su almacenamiento y verificación de integridad</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Como agente de campo, quiero subir la ficha en formato PDF una vez finalizada la visita, para contar con un respaldo verificable de que quedó registrada tal como la firmé.</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">8</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">5</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">SGT-6</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Verificar la integridad del documento digitalizado al validar una ficha</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Como asistente de gerencia general, quiero saber si el documento presentado como evidencia de una tarea sigue siendo el mismo que se subió, para no aprobar uno que fue alterado después.</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">3</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">6</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">SGT-5</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Revisar los campos críticos extraídos al validar una ficha</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Como asistente de gerencia general, quiero revisar los campos que el sistema extrajo automáticamente de la ficha antes de aprobarla, para confirmar que coinciden con lo que el documento realmente dice.</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">3</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">7</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">SGT-7</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Consultar los datos del beneficiario durante la validación de una ficha</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Como asistente de gerencia general, quiero consultar los datos del beneficiario asociado a una ficha mientras la reviso, para tenerlos disponibles sin salir a otro sistema.</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">2</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">8</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">SGT-4</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Buscar y filtrar las fichas registradas</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Como asistente de gerencia general, quiero buscar y filtrar las fichas registradas por código de tarea, agente de campo, fecha o estado de aprobación, para ubicar rápido las que quedaron con alguna observación pendiente.</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">2</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">9</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">SGT-8</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Buscar y filtrar las tareas registradas</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Como asistente de gerencia general, quiero buscar y filtrar las tareas registradas por código de tarea, actividad, zona, estado de avance o el estado de su entrega, para ver todas las tareas planificadas según el POI y su estado.</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">2</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">10</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">SGT-9</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Consultar el avance del PEI y del POI según las tareas registradas</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Como asistente de gerencia general, quiero consultar el avance del POI y del PEI calculado a partir de las actividades y tareas registradas, para tener esa información disponible sin depender de armar el reporte manualmente cada quincena.</td>
            <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">2</td>
        </tr>
    </tbody>
</table>
</div>