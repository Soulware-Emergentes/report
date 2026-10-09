La búsqueda de SGT existe para que el usuario no se pierda entre el volumen de registros. Se resuelve con grillas de búsqueda con filtros en la web, y la aplicación móvil no tiene búsqueda, porque su flujo es lineal y el archivo se elige con el selector del sistema.

**Opciones de búsqueda de la web**  
Cada una de las cuatro secciones de la barra lateral abre una grilla con sus propios filtros. Los filtros se pueden combinar entre sí, y el usuario lanza la búsqueda con el botón Buscar y los reinicia con Limpiar filtros. Los filtros de cada sección son los siguientes.

<div style="width: 100%; font-family: Arial, sans-serif; font-size: 13px;">
    <table style="width: 100%; border-collapse: collapse; border: 1px solid #333;">
        <thead>
            <tr>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Sección</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Filtros</th>
                <th style="border: 1px solid #333; padding: 8px 10px; text-align: left;">Columnas del resultado</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">DNI, nombre</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">DNI, nombre, cantidad de terrenos</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Agentes de campo</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">DNI, nombre</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">DNI, nombre, cantidad de fichas</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Fichas</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Código de ficha, código de tarea, DNI del agente, estado, fecha de llenado</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Código, DNI del agente, fecha de llenado, fecha de validación, terreno, estado y acción</td>
            </tr>
            <tr>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Terrenos</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Código, DNI del beneficiario, estado</td>
                <td style="border: 1px solid #333; padding: 8px 10px; vertical-align: top;">Código, DNI del beneficiario, número de vértices, fecha de actualización, estado y acciones</td>
            </tr>
        </tbody>
    </table>
</div>

Los filtros de Fichas responden a la necesidad de la asistente de ubicar rápido las fichas que quedaron con una observación pendiente, combinando código de tarea, agente, fecha y estado. Los filtros se aplican siempre sobre lo que el rol del usuario puede ver, por lo que el agente de campo no encuentra borradores de otros agentes aunque los busque.

**Cómo se muestran los resultados**  
Los resultados se presentan en una tabla con los atributos del registro en columnas, el estado con el Status chip y, en la última columna, la acción disponible, como Validar. El orden predeterminado es cronológico, con lo más reciente primero, salvo en Beneficiarios y Agentes de campo, que se ordenan alfabéticamente. Debajo de la tabla se indica cuántos registros se muestran sobre el total, por ejemplo Mostrando 3 de 3 fichas, y cuando hay más resultados de los que caben en una página, se pagina.

Si ningún registro coincide, la tabla muestra el mensaje No se encontraron resultados con esos filtros y la acción Limpiar filtros, para que el usuario pueda recuperarse en un paso y no quede frente a una tabla vacía sin explicación.

Además de la grilla, el mapa ofrece una forma visual de llegar a un registro: el usuario se desplaza por él y pulsa un terreno, y el popup muestra sus datos y sus fichas.
