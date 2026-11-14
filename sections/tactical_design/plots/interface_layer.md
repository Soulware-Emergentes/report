La capa de interfaz de Plots es un controlador REST que atiende al agente de campo, tanto en la aplicación móvil como en la aplicación web. La aplicación web llama a la API desde el navegador, por lo que la API admite solicitudes CORS solo desde el origen configurado para esa aplicación.

Todas las solicitudes llevan el token de acceso de una persona emitido por staff. El componente compartido CallerArgumentResolver entrega a cada controlador un Caller construido con el sujeto y los roles del token, y el mapper de cada contexto exige el rol con el que se ejecuta la operación; un llamador que no actúa en ese rol recibe una respuesta 403.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px; table-layout: fixed; overflow-wrap: anywhere; word-break: break-word;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 38%;">Método y ruta</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 42%;">Operación</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 20%;">Rol</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/plots</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Registra un terreno.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">field-agent</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /api/v1/plots?region=</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Lista los terrenos de un departamento, provincia o distrito.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">field-agent</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /api/v1/plots/owner?documentType=&amp;documentNumber=</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Devuelve el terreno de un beneficiario.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">field-agent</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /api/v1/plots/within?bbox=</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Devuelve como GeoJSON los terrenos que tocan una vista del mapa, dada como oeste, sur, este y norte en grados.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">field-agent</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /api/v1/plots/{plotId}</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Devuelve un terreno por su identidad.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">field-agent</td>
        </tr>
    </tbody>
</table>
</div>

{{page_break}}

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
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotController</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Controller</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Expone las operaciones de terrenos como recursos REST.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- plotCommandService: PlotCommandService<br>- plotQueryService: PlotQueryService</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ register(request, caller): PlotResponse<br>+ inRegion(region, caller): PlotsResponse<br>+ ofOwner(documentType, documentNumber, caller): PlotResponse<br>+ inView(bbox, caller): PlotFeatureCollectionResponse<br>+ plot(plotId, caller): PlotResponse</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotWireMapper</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Wire Mapper</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Traduce solicitudes en comandos y criterios, exige el rol del llamador y traduce resultados en respuestas.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ toRegisterPlot(request, caller): RegisterPlot<br>+ toPlotById(plotId, caller): PlotById<br>+ toPlotsInRegion(region, caller): PlotsInRegion<br>+ toPlotOfOwner(documentType, documentNumber, caller): PlotOfOwner<br>+ toPlotsInView(bbox, caller): PlotsInView<br>+ toPlotResponse(result): PlotResponse<br>+ toPlotsResponse(result): PlotsResponse<br>+ toPlotFeatureCollectionResponse(result): PlotFeatureCollectionResponse</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">RegisterPlotRequest</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Cuerpo del registro de un terreno.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ ownerDocumentType, ownerDocumentNumber: String<br>+ utmZone: String<br>+ boundary: List&lt;VertexRequest&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">VertexRequest</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Vértice del perímetro en coordenadas UTM.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ easting: double<br>+ northing: double</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Terreno registrado.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ id: UUID<br>+ ownerDocumentType, ownerDocumentNumber<br>+ ubigeo, utmZone<br>+ boundary: List&lt;VertexResponse&gt;<br>+ registrationDate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotsResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Listado de terrenos.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ plots: List&lt;PlotResponse&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">VertexResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Vértice del perímetro en coordenadas UTM.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ easting: double<br>+ northing: double</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotFeatureCollectionResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Terrenos de una vista del mapa como FeatureCollection de GeoJSON, con la indicación de si la vista contenía más.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ type: String<br>+ features: List&lt;PlotFeatureResponse&gt;<br>+ truncated: boolean</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotFeatureResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Un terreno como Feature de GeoJSON.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ type: String<br>+ id: UUID<br>+ geometry: PolygonGeometryResponse<br>+ properties: PlotPropertiesResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PolygonGeometryResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Contorno del terreno como Polygon de GeoJSON, en longitud y latitud.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ type: String<br>+ coordinates: List&lt;List&lt;List&lt;Double&gt;&gt;&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PlotPropertiesResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Datos del terreno que acompañan a su contorno en el mapa.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ ubigeo: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
    </tbody>
</table>
</div>

El registro no recibe el ubigeo, porque el dominio lo deduce del perímetro. La respuesta de GET /api/v1/plots/within se puede guardar en la caché privada del navegador durante un minuto y varía según el token, de modo que mover el mapa sobre una zona ya vista no repite la consulta.

Cuando el dominio rechaza una operación, la respuesta lleva el sobre de error común a los servicios con dos campos más. El campo code contiene la clave del mensaje de la excepción, como error.plots.overlapping-plot, para que el cliente distinga los rechazos sin leer el mensaje traducido. El campo details aparece solo en las excepciones que tienen algo más que el mensaje: el rechazo por superposición nombra en details.overlappingPlots los terrenos registrados con los que se superpone el terreno nuevo, y la aplicación web los resalta en el mapa.
