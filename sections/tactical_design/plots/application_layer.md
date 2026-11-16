La capa de aplicación expone el registro de terrenos y cuatro consultas. RegisterPlotHandler se ejecuta con aislamiento SERIALIZABLE, porque las reglas de superposición y de titular único abarcan varios agregados: si dos registros concurrentes leen los mismos vecinos, la base de datos rechaza uno de ellos al confirmar, y al reintentarlo se encuentra el terreno ya registrado y se informa la superposición.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 12px; table-layout: fixed; overflow-wrap: anywhere; word-break: break-word;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 6px 8px; text-align: left; width: 21%;">Clase</th>
            <th style="border: 1px solid #333; padding: 6px 8px; text-align: left; width: 13%;">Categoría</th>
            <th style="border: 1px solid #333; padding: 6px 8px; text-align: left; width: 16%;">Propósito</th>
            <th style="border: 1px solid #333; padding: 6px 8px; text-align: left; width: 25%;">Atributos</th>
            <th style="border: 1px solid #333; padding: 6px 8px; text-align: left; width: 25%;">Métodos</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotCommandService</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Command Service</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Punto de entrada de escritura del módulo.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- registerPlotHandler: RegisterPlotHandler</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ register(RegisterPlot): PlotId</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">RegisterPlot</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Registra un terreno levantado a nombre de un beneficiario.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ owner: BeneficiaryLegalDocument<br>+ boundary: PlotBoundary</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">RegisterPlotHandler</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Carga el terreno del titular y los vecinos que intersecan el perímetro, obtiene el distrito del terreno y registra el terreno nuevo.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- plotRepository: PlotRepository<br>- plotGeometry: PlotGeometry<br>- plotDistricts: PlotDistricts</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ handle(RegisterPlot): PlotId</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotQueryService</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Service</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Punto de entrada de lectura sobre terrenos.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- plotProjection: PlotProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ byId(PlotById): PlotResult<br>+ inRegion(PlotsInRegion): PlotsResult<br>+ ofOwner(PlotOfOwner): PlotResult<br>+ inView(PlotsInView): PlotsInViewResult</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotById</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Un terreno por su identidad.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ id: UUID</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotsInRegion</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Terrenos ubicados en un departamento, provincia o distrito.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ region: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotsInView</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Terrenos que tocan una vista del mapa, dada como un rectángulo en grados WGS84.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ west, south, east, north: double</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotOfOwner</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Terreno registrado a nombre de un beneficiario.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ documentType: String<br>+ documentNumber: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotResult</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Terreno registrado, con su perímetro en coordenadas UTM.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ id: UUID<br>+ ownerDocumentType, ownerDocumentNumber<br>+ ubigeo, utmZone<br>+ boundary: List&lt;VertexResult&gt;<br>+ registrationDate: LocalDateTime</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotsResult</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Terrenos ordenados por ubigeo y fecha de registro.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ plots: List&lt;PlotResult&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">VertexResult</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Vértice de un perímetro en coordenadas de su zona UTM.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ easting: double<br>+ northing: double</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotsInViewResult</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Terrenos de una vista del mapa, e indicación de si la vista contenía más de los que se devuelven.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ plots: List&lt;PlotFootprintResult&gt;<br>+ truncated: boolean</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotFootprintResult</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Terreno dibujado en el mapa: su identidad, su ubigeo y su contorno en WGS84.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ id: UUID<br>+ ubigeo: String<br>+ footprint: List&lt;CoordinateResult&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">CoordinateResult</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Punto del contorno en longitud y latitud.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ longitude: double<br>+ latitude: double</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Projection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Puerto de lectura de los terrenos almacenados.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ findById(PlotById): Optional&lt;PlotResult&gt;<br>+ findInRegion(PlotsInRegion): List&lt;PlotResult&gt;<br>+ findOfOwner(PlotOfOwner): Optional&lt;PlotResult&gt;<br>+ findInView(PlotsInView, limit): List&lt;PlotFootprintResult&gt;</td>
        </tr>
    </tbody>
</table>
</div>

La consulta por región compara el ubigeo por prefijo, de modo que una misma consulta sirve para los tres niveles de la división administrativa.

La consulta por vista del mapa devuelve como máximo 1000 terrenos. PlotQueryService pide a la proyección uno más que ese límite: si lo recibe, responde los 1000 primeros e indica que la vista contenía más, para que el cliente acerque el mapa en lugar de dibujar una vista incompleta como si estuviera completa.
