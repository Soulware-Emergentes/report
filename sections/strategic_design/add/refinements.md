Se refinan los Quality Attribute Scenarios de Primary Functionality, en orden de prioridad según el Architectural Drivers Backlog. Cada cuadro completa los campos del escenario y registra las preguntas que quedan abiertas.

Refinamiento 1: Seguridad

<div style="width: 100%; max-width: 680px; margin: 0 auto; font-family: Arial, sans-serif; font-size: 14px;">
    <table style="width: 100%; border-collapse: collapse; border: 1px solid #333;">
        <thead>
            <tr>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Campo</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Contenido</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Scenario(s)</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Intento de modificar una ficha ya subida.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Business Goals</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Que la ficha aprobada coincida con la que subió el agente de campo (SGT-3, SGT-6).</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Relevant Quality Attributes</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Seguridad</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Stimulus</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Se intenta modificar el PDF de una ficha después de su subida.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Stimulus Source</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Actor externo.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Environment</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Operación normal.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Artifact (if known)</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Repositorio de fichas y verificación de integridad.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Response</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">El sistema detecta la diferencia con el hash registrado y marca el documento como alterado.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Response Measure</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">0 modificaciones no detectadas.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Questions</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">¿Qué mecanismo respalda el registro de integridad: hash en base de datos o Blockchain?</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Issues</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">El escenario original nombra Blockchain como artefacto, y esa decisión sigue evaluándose en DRV-01.</td>
            </tr>
        </tbody>
    </table>
</div>

Refinamiento 2: Interoperabilidad

<div style="width: 100%; max-width: 680px; margin: 0 auto; font-family: Arial, sans-serif; font-size: 14px;">
    <table style="width: 100%; border-collapse: collapse; border: 1px solid #333;">
        <thead>
            <tr>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Campo</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Contenido</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Scenario(s)</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Consulta de información a otros sistemas.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Business Goals</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Reducir el traslado manual de información entre sistemas aislados.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Relevant Quality Attributes</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Interoperabilidad</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Stimulus</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">El sistema consulta información a otro sistema institucional.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Stimulus Source</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Sistema.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Environment</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Operación normal.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Artifact (if known)</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">API de integración.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Response</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">El sistema obtiene la información del sistema consultado.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Response Measure</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Más de un sistema con el que interopera.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Questions</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">¿Con qué sistemas institucionales debe interoperar y con qué formato de intercambio?</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Issues</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Las entrevistas indican que hoy no existe integración automática entre los sistemas.</td>
            </tr>
        </tbody>
    </table>
</div>

Refinamiento 3: Usabilidad

<div style="width: 100%; max-width: 680px; margin: 0 auto; font-family: Arial, sans-serif; font-size: 14px;">
    <table style="width: 100%; border-collapse: collapse; border: 1px solid #333;">
        <thead>
            <tr>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Campo</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Contenido</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Scenario(s)</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Primera consulta de los terrenos de los beneficiarios.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Business Goals</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Que el agente de campo detecte y corrija errores de medición durante la misma visita (SGT-2).</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Relevant Quality Attributes</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Usabilidad</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Stimulus</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Un usuario consulta los terrenos de los beneficiarios por primera vez.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Stimulus Source</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Usuario.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Environment</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Operación normal.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Artifact (if known)</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Mapa interactivo.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Response</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">El usuario comprende el flujo de consulta.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Response Measure</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Menos de 5 minutos.</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Questions</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">¿Cómo se determina que el usuario comprendió el flujo?</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Issues</td>
                <td style="border: 1px solid #333; padding: 10px; vertical-align: top; text-align: left;">Ninguna.</td>
            </tr>
        </tbody>
    </table>
</div>
