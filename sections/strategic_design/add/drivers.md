El backlog de drivers se construyó a partir de las User Stories de Primary Functionality, los Quality Attribute Scenarios y los Constraints. Cada driver se calificó según su importancia para los stakeholders y su impacto en la complejidad técnica de la arquitectura, y la tabla ordena primero los de importancia e impacto altos.

<div style="width: 100%; max-width: 680px; margin: 0 auto; font-family: Arial, sans-serif; font-size: 14px;">
    <table style="width: 100%; border-collapse: collapse; border: 1px solid #333;">
        <thead>
            <tr>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Driver ID</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Título de Driver</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Descripción</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Importancia para Stakeholders</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Impacto en Architecture Technical Complexity</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">DRV-01</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Integridad de las fichas subidas</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Detectar cualquier modificación de una ficha después de su subida (SGT-3, SGT-6, escenario de Seguridad).</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">High</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">High</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">DRV-02</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Datos de beneficiarios dentro de la institución</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Procesar y almacenar los datos de beneficiarios sin usar servicios en la nube (TS-01).</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">High</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">High</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">DRV-03</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Interoperabilidad con otros sistemas</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Consultar información de más de un sistema institucional mediante una API de integración (escenario de Interoperabilidad).</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">High</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">High</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">DRV-04</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Extracción automática de campos de la ficha</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Extraer los campos críticos de la ficha para su revisión y corrección por el asistente (SGT-5).</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">High</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">High</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">DRV-05</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Acceso según el rol del usuario</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Restringir las funciones disponibles según el rol de cada usuario (SGT-10).</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">High</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Medium</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">DRV-06</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Visualización de puntos capturados</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Mostrar en un mapa interactivo los puntos enviados por la estación total (SGT-2, escenario de Usabilidad).</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Medium</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Medium</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">DRV-07</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Conservación de la ficha oficial</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Conservar el PDF de la ficha firmada como respaldo del expediente (TS-02).</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Medium</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Low</td>
            </tr>
        </tbody>
    </table>
</div>
