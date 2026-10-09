Como parte del proceso de EventStorming, paralelamente se fueron barajando los posibles contextos a desarrollar. Debido a la naturaleza del SGT y su alcance acotado, los contextos candidatos se determinaron rápidamente: SGT como contexto central, Beneficiarios y POI como sistemas con los que se integra, e IA como apoyo a la revisión de las fichas.

Al pasar al diseño táctico, los contextos se refinaron en los siguientes, que son los que implementa la solución:

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 22%;">Contexto</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 50%;">Responsabilidad</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 28%;">Implementación</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Monitoring</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Envío, entrega y revisión de las fichas de evaluación.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Módulo del servicio sgt</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Plots</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Registro de los terrenos de los beneficiarios.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Módulo del servicio sgt</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">People</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Resolución de beneficiarios y personal desde los sistemas que los administran.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Módulo del servicio sgt</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Planning</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Planes, objetivos, actividades y tareas del POI, y el registro de sus entregas.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Servicio poi</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Directory</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Directorio del personal de la organización.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Módulo del servicio staff</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Identity Provider</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Autenticación de personas y servicios, y emisión de tokens.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Módulo del servicio staff</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Beneficiarios</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Registro institucional de beneficiarios.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Servicio beneficiarios</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">IA</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Extracción automática de los campos de la ficha.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Planificado (DRV-04)</td>
        </tr>
    </tbody>
</table>
</div>

El contexto SGT se divide en tres módulos de un monolito modular, porque fichas, terrenos y personas cambian por razones distintas pero comparten despliegue y base de datos. Staff reúne el directorio y el proveedor de identidad que usan todos los servicios para autenticar a las personas según su rol (EP-05).
