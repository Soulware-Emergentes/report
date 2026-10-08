La capa de interfaz de Plots es un controlador REST que atiende a la aplicación del agente de campo.

Todas las solicitudes llevan el token de acceso de una persona emitido por staff. El componente compartido CallerArgumentResolver entrega a cada controlador un Caller construido con el sujeto y los roles del token, y el mapper de cada contexto exige el rol con el que se ejecuta la operación; un llamador que no actúa en ese rol recibe una respuesta 403.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px;">
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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /api/v1/plots/{plotId}</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Devuelve un terreno por su identidad.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">field-agent</td>
        </tr>
    </tbody>
</table>
</div>

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 16%;">Clase</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 12%;">Categoría</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 28%;">Propósito</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 22%;">Atributos</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 22%;">Métodos</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlotController</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Controller</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Expone las operaciones de terrenos como recursos REST.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- plotCommandService: PlotCommandService<br>- plotQueryService: PlotQueryService</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ register(request, caller): PlotResponse<br>+ inRegion(region, caller): PlotsResponse<br>+ ofOwner(documentType, documentNumber, caller): PlotResponse<br>+ plot(plotId, caller): PlotResponse</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlotWireMapper</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Wire Mapper</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Traduce solicitudes en comandos y criterios, exige el rol del llamador y traduce resultados en respuestas.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ toRegisterPlot(request, caller): RegisterPlot<br>+ toPlotById(plotId, caller): PlotById<br>+ toPlotsInRegion(region, caller): PlotsInRegion<br>+ toPlotOfOwner(documentType, documentNumber, caller): PlotOfOwner<br>+ toPlotResponse(result): PlotResponse<br>+ toPlotsResponse(result): PlotsResponse</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">RegisterPlotRequest</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Cuerpo del registro de un terreno.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ ownerDocumentType, ownerDocumentNumber: String<br>+ ubigeo, utmZone: String<br>+ boundary: List&lt;VertexRequest&gt;</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">VertexRequest</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Vértice del perímetro en coordenadas UTM.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ easting: double<br>+ northing: double</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlotResponse</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Terreno registrado.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ id: UUID<br>+ ownerDocumentType, ownerDocumentNumber<br>+ ubigeo, utmZone<br>+ boundary: List&lt;VertexResponse&gt;<br>+ registrationDate</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PlotsResponse</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Listado de terrenos.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ plots: List&lt;PlotResponse&gt;</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">VertexResponse</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Vértice del perímetro en coordenadas UTM.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ easting: double<br>+ northing: double</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
    </tbody>
</table>
</div>
