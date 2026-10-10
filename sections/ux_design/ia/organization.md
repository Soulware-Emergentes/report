La organización del contenido de SGT parte de los dos usuarios del sistema. El agente de campo necesita llegar rápido a sus terrenos y a la subida de fichas, y la asistente de gerencia general necesita revisar y aprobar fichas sin perder el rastro de cada dato. Por eso cada grupo de información se organiza con el sistema visual que mejor acompaña la tarea del usuario y con un esquema de categorización que permite encontrarlo sin esfuerzo.

**Organización visual del contenido**  
Se usan los tres sistemas de organización en casos distintos:
- Jerárquica (visual hierarchy): se aplica cuando hay un elemento principal y otros que lo apoyan. La pantalla del mapa se organiza así, con el mapa como elemento dominante y la barra lateral y los paneles subordinados a él, y el popup de un terreno coloca los datos del terreno arriba y sus fichas debajo. La Landing Page también la usa, con un título y una propuesta principal antes del detalle.
- Secuencial (step-by-step to accomplish): se aplica cuando el usuario debe completar pasos en un orden. Es el caso del envío del archivo en el móvil, que va de elegir el archivo a revisarlo y enviarlo, de la validación de una ficha, que va de verificar la integridad del documento a revisar los datos y aprobar, de los campos de los modales de creación de terreno y de subida de ficha, que siguen el orden en que se llenan, y de la sección Cómo funciona de la Landing Page.
- Matricial: se aplica cuando hay muchos registros con los mismos atributos que se comparan entre sí. Son las tablas de Beneficiarios, Agentes de campo, Fichas y Terrenos, donde cada fila es un registro y cada columna un atributo, y la pantalla dividida de validación, que pone lado a lado los datos de la IA y el documento.

**Esquemas de categorización**  
Se usan los cuatro esquemas según el grupo de información:
- Por tópicos: la barra lateral agrupa el sistema en Beneficiarios, Agentes de campo, Fichas y Terrenos, que son las cuatro entidades del dominio. La Landing Page agrupa su contenido en propósito, funcionamiento, perfiles y seguridad.
- Cronológico: las fichas y los terrenos se ordenan por fecha, con lo más reciente primero, porque el usuario busca casi siempre lo último que se registró. El desplegable de fichas del popup de un terreno sigue el mismo orden.
- Alfabético: Beneficiarios y Agentes de campo se ordenan por apellido y nombre, porque son listas de personas que se buscan por nombre.
- Según audiencia: el contenido se diferencia por rol. El agente de campo ve todos los terrenos, salvo los borradores de otros agentes, y solo ve los borradores que él guardó, mientras que la asistente revisa las fichas pendientes. La Landing Page presenta qué hace el sistema para cada perfil.

La siguiente tabla resume qué sistema se aplica a cada grupo de información.

<div style="width: 100%; font-family: Arial, sans-serif; font-size: 13px;">
    <table style="width: 100%; border-collapse: collapse; border: 1px solid #333;">
        <thead>
            <tr>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Grupo de información</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Organización visual</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Categorización</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Pantalla del mapa y barra lateral</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Jerárquica</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Por tópicos</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Listados de Beneficiarios y Agentes de campo</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Matricial</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Alfabético</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Listados de Fichas y Terrenos</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Matricial</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Cronológico y según audiencia</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Popup de terreno y desplegable de fichas</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Jerárquica</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Cronológico</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Validación de una ficha</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Secuencial y matricial</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Por tópicos (datos de la IA y documento)</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Modales de creación de terreno y de subida de ficha</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Secuencial</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Por tópicos</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Envío del archivo en la aplicación móvil</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Secuencial</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Por tópicos (estado del envío)</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Landing Page</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Jerárquica y secuencial</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Por tópicos y según audiencia</td>
            </tr>
        </tbody>
    </table>
</div>
