Durante el Sprint 1 se incorporó la documentación de los servicios web SGT, Staff y Beneficiarios con OpenAPI 3.1 mediante springdoc. Swagger UI permite consultar las rutas publicadas, las acciones HTTP, los parámetros y los esquemas de solicitud y respuesta. Las capturas de esta sección corresponden a la documentación disponible en el entorno local de los tres servicios.

La siguiente tabla reúne los accesos a la documentación y los repositorios de los servicios incluidos en esta evidencia.

<div style="width: 100%; margin: 14px auto 20px; font-family: Arial, sans-serif; font-size: 11px; line-height: 1.4;">
    <table style="width: 100%; table-layout: fixed; border-collapse: collapse; border: 1px solid #333; break-inside: auto; page-break-inside: auto;">
        <colgroup><col style="width: 16%;"><col style="width: 49%;"><col style="width: 35%;"></colgroup>
        <thead style="display: table-header-group;">
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Servicio</th>
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Documentación</th>
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Repositorio</th>
            </tr>
        </thead>
        <tbody>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">sgt</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><a href="http://localhost:8080/swagger-ui/index.html">http://localhost:8080/swagger-ui/index.html</a><br><a href="http://localhost:8080/v3/api-docs">OpenAPI JSON local</a><br><a href="./assets/product_impl/sprint-1/services/sgt-openapi.json">Especificación OpenAPI adjunta</a></td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><a href="https://github.com/Soulware-Emergentes/sgt">Soulware-Emergentes/sgt</a></td>
            </tr>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">staff</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><a href="http://localhost:8082/swagger-ui/index.html">http://localhost:8082/swagger-ui/index.html</a><br><a href="http://localhost:8082/v3/api-docs">OpenAPI JSON local</a><br><a href="./assets/product_impl/sprint-1/services/staff-openapi.json">Especificación OpenAPI adjunta</a></td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><a href="https://github.com/Soulware-Emergentes/staff">Soulware-Emergentes/staff</a></td>
            </tr>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">beneficiarios</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><a href="http://localhost:8081/swagger-ui/index.html">http://localhost:8081/swagger-ui/index.html</a><br><a href="http://localhost:8081/v3/api-docs">OpenAPI JSON local</a><br><a href="./assets/product_impl/sprint-1/services/beneficiarios-openapi.json">Especificación OpenAPI adjunta</a></td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><a href="https://github.com/Soulware-Emergentes/beneficiarios">Soulware-Emergentes/beneficiarios</a></td>
            </tr>
        </tbody>
    </table>
</div>

Los servicios utilizan autenticación Bearer con tokens JWT emitidos por Staff. Para explorar operaciones protegidas desde Swagger se emplea Authorize con un token de la audiencia y los permisos correspondientes. En SGT, la identidad del actor procede del token; el campo caller que aparece en la documentación generada representa ese contexto del servidor.

En SGT, la documentación del módulo de terrenos describe el registro de la medición y las consultas por región, identificador, propietario y área visible del mapa.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/services/03-sgt-openapi.jpg" alt="Figura 1. Swagger UI de SGT: operaciones publicadas para la gestión de terrenos." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
    <p style="margin: 8px 0 0; font-family: Arial, sans-serif; font-size: 12px; line-height: 1.4;">Figura 1. Swagger UI de SGT: operaciones publicadas para la gestión de terrenos.</p>
</div>

<div style="width: 100%; margin: 14px auto 20px; font-family: Arial, sans-serif; font-size: 11px; line-height: 1.4;">
    <table style="width: 100%; table-layout: fixed; border-collapse: collapse; border: 1px solid #333; break-inside: auto; page-break-inside: auto;">
        <colgroup><col style="width: 31%;"><col style="width: 41%;"><col style="width: 28%;"></colgroup>
        <thead style="display: table-header-group;">
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Acción HTTP y endpoint</th>
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Parámetros y solicitud</th>
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Respuesta documentada</th>
            </tr>
        </thead>
        <tbody>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">GET /api/v1/plots</code><br>Consulta de terrenos por región administrativa.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">region</code> (query, obligatorio).</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">200 OK</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">PlotsResponse</code><br>Colección de terrenos de la región solicitada.</td>
            </tr>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">POST /api/v1/plots</code><br>Registro de un terreno asociado a un beneficiario.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Cuerpo JSON <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">RegisterPlotRequest</code>: <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">ownerDocumentType</code>, <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">ownerDocumentNumber</code>, <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">utmZone</code>, <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">boundary</code>.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">201 Created</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">PlotResponse</code><br>Datos del terreno, propietario, distrito, zona UTM, perímetro y fecha de registro.</td>
            </tr>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">GET /api/v1/plots/{plotId}</code><br>Consulta de un terreno por su identificador.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">plotId</code> (path, obligatorio).</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">200 OK</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">PlotResponse</code><br>Datos del terreno, propietario, distrito, zona UTM, perímetro y fecha de registro.</td>
            </tr>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">GET /api/v1/plots/within</code><br>Consulta geográfica de terrenos dentro del área visible del mapa.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">bbox</code> (query, obligatorio).</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">200 OK</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">PlotFeatureCollectionResponse</code><br>Colección GeoJSON de polígonos y señal de resultados truncados.</td>
            </tr>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">GET /api/v1/plots/owner</code><br>Consulta de un terreno por el documento de su propietario.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">documentType</code> (query, obligatorio).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">documentNumber</code> (query, obligatorio).</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">200 OK</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">PlotResponse</code><br>Datos del terreno, propietario, distrito, zona UTM, perímetro y fecha de registro.</td>
            </tr>
        </tbody>
    </table>
</div>

El registro recibe el documento del propietario, la zona UTM y la lista de vértices del perímetro. El siguiente ejemplo de cuerpo JSON utiliza los datos de muestra presentados en el formulario web; ilustra la sintaxis de la solicitud.

<pre style="margin: 12px 0 18px; padding: 12px; border: 1px solid #ccc; font-size: 11px; line-height: 1.4; white-space: pre-wrap; overflow-wrap: anywhere; break-inside: avoid; page-break-inside: avoid;"><code>{
  &quot;ownerDocumentType&quot;: &quot;DNI&quot;,
  &quot;ownerDocumentNumber&quot;: &quot;49407359&quot;,
  &quot;utmZone&quot;: &quot;ZONE_18S&quot;,
  &quot;boundary&quot;: [
    {
      &quot;easting&quot;: 464210,
      &quot;northing&quot;: 9239812
    },
    {
      &quot;easting&quot;: 464310,
      &quot;northing&quot;: 9239812
    },
    {
      &quot;easting&quot;: 464310,
      &quot;northing&quot;: 9239912
    }
  ]
}</code></pre>

Para esta operación, OpenAPI documenta una respuesta 201 Created con el identificador del terreno, el documento del propietario, el ubigeo asignado, la zona UTM, el perímetro y la fecha de registro. Las consultas del mapa reciben bbox con los límites oeste, sur, este y norte, separados por comas, y devuelven una colección GeoJSON.

La documentación de fichas de campo reúne las operaciones de listado, entrega, revisión, reasignación y acceso al escaneo.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/services/07-sgt-fichas-openapi.jpg" alt="Figura 2. Swagger UI de SGT: operaciones publicadas para fichas de campo." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
    <p style="margin: 8px 0 0; font-family: Arial, sans-serif; font-size: 12px; line-height: 1.4;">Figura 2. Swagger UI de SGT: operaciones publicadas para fichas de campo.</p>
</div>

<div style="width: 100%; margin: 14px auto 20px; font-family: Arial, sans-serif; font-size: 11px; line-height: 1.4;">
    <table style="width: 100%; table-layout: fixed; border-collapse: collapse; border: 1px solid #333; break-inside: auto; page-break-inside: auto;">
        <colgroup><col style="width: 31%;"><col style="width: 41%;"><col style="width: 28%;"></colgroup>
        <thead style="display: table-header-group;">
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Acción HTTP y endpoint</th>
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Parámetros y solicitud</th>
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Respuesta documentada</th>
            </tr>
        </thead>
        <tbody>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">GET /api/v1/field-sheets</code><br>Listado paginado de fichas de campo.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">status</code> (query, opcional).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">code</code> (query, opcional).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">taskCode</code> (query, opcional).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">submittedFrom</code> (query, opcional).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">submittedTo</code> (query, opcional).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">sort</code> (query, opcional; valor por defecto: submittedAt).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">direction</code> (query, opcional; valor por defecto: desc).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">page</code> (query, opcional; valor por defecto: 0).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">size</code> (query, opcional; valor por defecto: 10).</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">200 OK</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">FieldSheetsPageResponse</code><br>Página de fichas con datos de paginación.</td>
            </tr>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">POST /api/v1/field-sheets</code><br>Envío de una ficha de campo asociada a una tarea.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Cuerpo JSON <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">SubmitFieldSheetRequest</code>: <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">taskCode</code>, <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">scanKey</code>.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">201 Created</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">FieldSheetResponse</code><br>Detalle de la ficha y sus datos asociados.</td>
            </tr>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">POST /api/v1/field-sheets/{fieldSheetId}/relink</code><br>Reasignación de la tarea vinculada a una ficha.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">fieldSheetId</code> (path, obligatorio).<br>Cuerpo JSON <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">RelinkFieldSheetRequest</code>: <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">taskCode</code>.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">200 OK</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">FieldSheetResponse</code><br>Detalle de la ficha y sus datos asociados.</td>
            </tr>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">POST /api/v1/field-sheets/{fieldSheetId}/rejection</code><br>Rechazo de una ficha entregada.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">fieldSheetId</code> (path, obligatorio).</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">200 OK</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">FieldSheetResponse</code><br>Detalle de la ficha y sus datos asociados.</td>
            </tr>
        </tbody>
    </table>
</div>

<div style="width: 100%; margin: 14px auto 20px; font-family: Arial, sans-serif; font-size: 11px; line-height: 1.4;">
    <table style="width: 100%; table-layout: fixed; border-collapse: collapse; border: 1px solid #333; break-inside: auto; page-break-inside: auto;">
        <colgroup><col style="width: 31%;"><col style="width: 41%;"><col style="width: 28%;"></colgroup>
        <thead style="display: table-header-group;">
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Acción HTTP y endpoint</th>
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Parámetros y solicitud</th>
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Respuesta documentada</th>
            </tr>
        </thead>
        <tbody>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">POST /api/v1/field-sheets/{fieldSheetId}/approval</code><br>Aprobación de una ficha entregada.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">fieldSheetId</code> (path, obligatorio).<br>Cuerpo JSON <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">ApproveFieldSheetRequest</code>: <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">beneficiaryDocumentType</code>, <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">beneficiaryDocumentNumber</code>, <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">usedSupplies</code>, <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">evaluationDate</code>, <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">securementDate</code>.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">200 OK</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">FieldSheetResponse</code><br>Detalle de la ficha y sus datos asociados.</td>
            </tr>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">POST /api/v1/field-sheets/scan-uploads</code><br>Obtención de un enlace firmado para cargar el escaneo de una ficha.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Sin cuerpo ni parámetros externos.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">200 OK</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">ScanLinkResponse</code><br>Enlace firmado del escaneo.</td>
            </tr>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">GET /api/v1/field-sheets/{fieldSheetId}</code><br>Consulta del detalle de una ficha.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">fieldSheetId</code> (path, obligatorio).</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">200 OK</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">FieldSheetResponse</code><br>Detalle de la ficha y sus datos asociados.</td>
            </tr>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">GET /api/v1/field-sheets/{fieldSheetId}/scan</code><br>Obtención de un enlace firmado para descargar el escaneo.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">fieldSheetId</code> (path, obligatorio).</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">200 OK</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">ScanLinkResponse</code><br>Enlace firmado del escaneo.</td>
            </tr>
        </tbody>
    </table>
</div>

Las operaciones de consulta y revisión de una ficha comparten el esquema FieldSheetResponse. La aprobación recibe el documento del beneficiario, los insumos utilizados y las fechas de evaluación y aseguramiento. Las operaciones de escaneo devuelven ScanLinkResponse con el enlace firmado para realizar la transferencia del archivo.

Staff documenta las consultas del directorio de personas. El listado admite filtros por puesto, departamento, usuario y nombre visible, además de orden y paginación. La búsqueda por identificadores recibe una colección ids y distingue las personas encontradas de los identificadores que no tienen coincidencia.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/services/04-staff-openapi.jpg" alt="Figura 3. Swagger UI de Staff: listado y búsqueda de personas del directorio." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
    <p style="margin: 8px 0 0; font-family: Arial, sans-serif; font-size: 12px; line-height: 1.4;">Figura 3. Swagger UI de Staff: listado y búsqueda de personas del directorio.</p>
</div>

<div style="width: 100%; margin: 14px auto 20px; font-family: Arial, sans-serif; font-size: 11px; line-height: 1.4;">
    <table style="width: 100%; table-layout: fixed; border-collapse: collapse; border: 1px solid #333; break-inside: auto; page-break-inside: auto;">
        <colgroup><col style="width: 31%;"><col style="width: 41%;"><col style="width: 28%;"></colgroup>
        <thead style="display: table-header-group;">
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Acción HTTP y endpoint</th>
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Parámetros y solicitud</th>
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Respuesta documentada</th>
            </tr>
        </thead>
        <tbody>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">POST /api/v3/people/lookup</code><br>Búsqueda de personas por sus identificadores.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Cuerpo JSON <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">PeopleLookupRequest</code>: <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">ids</code>.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">200 OK</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">PeopleLookupResponse</code><br>Personas encontradas e identificadores no encontrados.</td>
            </tr>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">GET /api/v3/people</code><br>Listado de personas del directorio con filtros y paginación.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">jobTitle</code> (query, opcional).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">department</code> (query, opcional).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">username</code> (query, opcional).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">displayName</code> (query, opcional).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">sort</code> (query, opcional; valor por defecto: displayName).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">direction</code> (query, opcional; valor por defecto: asc).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">page</code> (query, opcional; valor por defecto: 0).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">size</code> (query, opcional; valor por defecto: 10).</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">200 OK</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">PeoplePageResponse</code><br>Personas del directorio y datos de paginación.</td>
            </tr>
        </tbody>
    </table>
</div>

La interacción de ejemplo solicita dos personas de la primera página, ordenadas por nombre visible. Swagger muestra HTTP 200 y una respuesta con content, totalPages, totalElements, actualPage y pageSize. En el entorno de desarrollo, el directorio contiene 41 personas.

<pre style="margin: 12px 0 18px; padding: 12px; border: 1px solid #ccc; font-size: 11px; line-height: 1.4; white-space: pre-wrap; overflow-wrap: anywhere; break-inside: avoid; page-break-inside: avoid;"><code>GET http://localhost:8082/api/v3/people?sort=displayName&amp;direction=asc&amp;page=0&amp;size=2</code></pre>

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/services/05-staff-get-200.jpg" alt="Figura 4. Consulta del directorio desde Swagger: respuesta HTTP 200 con personas de muestra." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
    <p style="margin: 8px 0 0; font-family: Arial, sans-serif; font-size: 12px; line-height: 1.4;">Figura 4. Consulta del directorio desde Swagger: respuesta HTTP 200 con personas de muestra.</p>
</div>

Beneficiarios documenta el listado del padrón y la búsqueda por documentos legales. El listado incluye filtros por nombres, apellidos y documento, junto con orden y paginación. La búsqueda recibe legalDocuments, cuyos elementos contienen type y number, y devuelve las coincidencias y los documentos no encontrados.

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/services/01-beneficiarios-openapi.jpg" alt="Figura 5. Swagger UI de Beneficiarios: listado y búsqueda por documentos legales." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
    <p style="margin: 8px 0 0; font-family: Arial, sans-serif; font-size: 12px; line-height: 1.4;">Figura 5. Swagger UI de Beneficiarios: listado y búsqueda por documentos legales.</p>
</div>

<div style="width: 100%; margin: 14px auto 20px; font-family: Arial, sans-serif; font-size: 11px; line-height: 1.4;">
    <table style="width: 100%; table-layout: fixed; border-collapse: collapse; border: 1px solid #333; break-inside: auto; page-break-inside: auto;">
        <colgroup><col style="width: 31%;"><col style="width: 41%;"><col style="width: 28%;"></colgroup>
        <thead style="display: table-header-group;">
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Acción HTTP y endpoint</th>
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Parámetros y solicitud</th>
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Respuesta documentada</th>
            </tr>
        </thead>
        <tbody>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">POST /api/v1/beneficiaries/lookup</code><br>Búsqueda de beneficiarios por sus documentos legales.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Cuerpo JSON <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">BeneficiaryLookupRequest</code>: <code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">legalDocuments</code>.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">200 OK</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">BeneficiaryLookupResponse</code><br>Beneficiarios encontrados y documentos no encontrados.</td>
            </tr>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">GET /api/v1/beneficiaries</code><br>Listado de beneficiarios con filtros y paginación.</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">names</code> (query, opcional).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">paternalSurname</code> (query, opcional).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">maternalSurname</code> (query, opcional).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">legalDocumentType</code> (query, opcional).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">legalDocumentNumber</code> (query, opcional).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">sort</code> (query, opcional; valor por defecto: paternalSurname).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">direction</code> (query, opcional; valor por defecto: asc).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">page</code> (query, opcional; valor por defecto: 0).<br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">size</code> (query, opcional; valor por defecto: 10).</td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">200 OK</code><br><code style="font-size: inherit; white-space: normal; overflow-wrap: anywhere;">BeneficiariesPageResponse</code><br>Beneficiarios y datos de paginación.</td>
            </tr>
        </tbody>
    </table>
</div>

La consulta de ejemplo solicita dos beneficiarios de la primera página, ordenados por apellido paterno. La respuesta HTTP 200 contiene los datos de los beneficiarios y la información de paginación. El padrón de desarrollo utilizado en esta evidencia contiene 150 registros de muestra.

<pre style="margin: 12px 0 18px; padding: 12px; border: 1px solid #ccc; font-size: 11px; line-height: 1.4; white-space: pre-wrap; overflow-wrap: anywhere; break-inside: avoid; page-break-inside: avoid;"><code>GET http://localhost:8081/api/v1/beneficiaries?sort=paternalSurname&amp;direction=asc&amp;page=0&amp;size=2</code></pre>

<div style="margin: 18px 0; text-align: center; break-inside: avoid; page-break-inside: avoid;">
    <img src="./assets/product_impl/sprint-1/services/02-beneficiarios-get-200.jpg" alt="Figura 6. Consulta del padrón desde Swagger: respuesta HTTP 200 con beneficiarios de muestra." style="display: block; width: auto; height: auto; max-width: 100%; max-height: 105mm; margin: 0 auto; break-inside: avoid; page-break-inside: avoid;">
    <p style="margin: 8px 0 0; font-family: Arial, sans-serif; font-size: 12px; line-height: 1.4;">Figura 6. Consulta del padrón desde Swagger: respuesta HTTP 200 con beneficiarios de muestra.</p>
</div>

Los siguientes ejemplos resumen la sintaxis de los cuerpos JSON de búsqueda y la estructura de una respuesta paginada. El campo content contiene los registros de la página solicitada; totalElements indica la cantidad total de coincidencias, totalPages el número de páginas, actualPage la página devuelta y pageSize el tamaño de página.

<pre style="margin: 12px 0 18px; padding: 12px; border: 1px solid #ccc; font-size: 11px; line-height: 1.4; white-space: pre-wrap; overflow-wrap: anywhere; break-inside: avoid; page-break-inside: avoid;"><code>POST /api/v3/people/lookup
{&quot;ids&quot;:[&quot;0463d8c5-5b64-47a4-8c74-d63c36a55078&quot;]}

POST /api/v1/beneficiaries/lookup
{&quot;legalDocuments&quot;:[{&quot;type&quot;:&quot;DNI&quot;,&quot;number&quot;:&quot;49407359&quot;}]}</code></pre>

<pre style="margin: 12px 0 18px; padding: 12px; border: 1px solid #ccc; font-size: 11px; line-height: 1.4; white-space: pre-wrap; overflow-wrap: anywhere; break-inside: avoid; page-break-inside: avoid;"><code>{
  &quot;content&quot;: [
    {
      &quot;legalDocument&quot;: {
        &quot;type&quot;: &quot;DNI&quot;,
        &quot;number&quot;: &quot;49407359&quot;
      },
      &quot;names&quot;: &quot;Jesús&quot;,
      &quot;paternalSurname&quot;: &quot;Acevedo&quot;,
      &quot;maternalSurname&quot;: &quot;Rendón&quot;,
      &quot;dateOfBirth&quot;: &quot;1998-08-30&quot;,
      &quot;ubigeo&quot;: &quot;295134&quot;
    }
  ],
  &quot;totalPages&quot;: 150,
  &quot;totalElements&quot;: 150,
  &quot;actualPage&quot;: 0,
  &quot;pageSize&quot;: 1
}</code></pre>

El último JSON ilustra una página de un elemento a partir del esquema documentado; las capturas de las consultas ejecutadas utilizan un tamaño de dos elementos. Los valores completos y los esquemas anidados se encuentran en las especificaciones OpenAPI adjuntas.

Los commits relacionados con la configuración de la documentación se presentan a continuación. En los tres servicios incorporan ApiDocsConfiguration y la documentación de la API mediante springdoc.

<div style="width: 100%; margin: 14px auto 20px; font-family: Arial, sans-serif; font-size: 11px; line-height: 1.4;">
    <table style="width: 100%; table-layout: fixed; border-collapse: collapse; border: 1px solid #333; break-inside: auto; page-break-inside: auto;">
        <colgroup><col style="width: 34%;"><col style="width: 16%;"><col style="width: 50%;"></colgroup>
        <thead style="display: table-header-group;">
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Repositorio</th>
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Commit Id</th>
                <th scope="col" style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">Commit Message</th>
            </tr>
        </thead>
        <tbody>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><a href="https://github.com/Soulware-Emergentes/sgt">Soulware-Emergentes/sgt</a></td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><a href="https://github.com/Soulware-Emergentes/sgt/commit/4bd4b83ffa4321ec9d2cbca9d0a7ce8665f2e5c9">4bd4b83</a></td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">feat(shared): document the API with springdoc</td>
            </tr>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><a href="https://github.com/Soulware-Emergentes/staff">Soulware-Emergentes/staff</a></td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><a href="https://github.com/Soulware-Emergentes/staff/commit/34526e510cccba8668b5dbc4e18a9e92453771ec">34526e5</a></td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">feat(shared): document the API with springdoc</td>
            </tr>
            <tr style="break-inside: avoid; page-break-inside: avoid;">
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><a href="https://github.com/Soulware-Emergentes/beneficiarios">Soulware-Emergentes/beneficiarios</a></td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;"><a href="https://github.com/Soulware-Emergentes/beneficiarios/commit/69c72e9882c88565a79d17f4b5b9a43f6aa4afdf">69c72e9</a></td>
                <td style="border: 1px solid #333; padding: 8px 10px; text-align: left; vertical-align: top; overflow-wrap: anywhere; word-break: normal;">feat(shared): document the API with springdoc</td>
            </tr>
        </tbody>
    </table>
</div>

Las tablas describen las 17 operaciones publicadas en estos tres servicios. Las imágenes de Swagger presentan tanto la documentación de las rutas como ejemplos de interacción con datos de desarrollo, complementando la evidencia de las pantallas de la aplicación web.
