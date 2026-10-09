La capa de interfaz de Monitoring tiene dos tipos de entrada: un controlador REST que atiende a la aplicación web y a la aplicación móvil, y tres consumidores de eventos que reaccionan a los eventos del agregado FieldSheet.

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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/field-sheets/scan-uploads</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Entrega un enlace firmado para subir el PDF de una ficha nueva.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">field-agent</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/field-sheets</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Envía una ficha para una tarea, con el PDF ya subido.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">field-agent</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /api/v1/field-sheets</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Lista una página de fichas con filtros y orden.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Cualquier rol</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /api/v1/field-sheets/{fieldSheetId}</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Devuelve el detalle de una ficha.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Cualquier rol</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /api/v1/field-sheets/{fieldSheetId}/scan</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Entrega un enlace firmado para descargar el PDF.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Cualquier rol</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/field-sheets/{fieldSheetId}/approval</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Aprueba la ficha con los datos confirmados.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">general-management-assistant</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/field-sheets/{fieldSheetId}/rejection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Rechaza la ficha.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">general-management-assistant</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/field-sheets/{fieldSheetId}/relink</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Reasigna la ficha a otra tarea.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Cualquier rol</td>
        </tr>
    </tbody>
</table>
</div>

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
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetController</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Controller</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Expone las operaciones de fichas como recursos REST.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- fieldSheetCommandService: FieldSheetCommandService<br>- fieldSheetQueryService: FieldSheetQueryService</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ scanUpload(): ScanLinkResponse<br>+ submit(request, caller): FieldSheetResponse<br>+ page(status, code, taskCode, submittedFrom, submittedTo, sort, direction, page, size): FieldSheetsPageResponse<br>+ fieldSheet(fieldSheetId): FieldSheetResponse<br>+ scan(fieldSheetId): ScanLinkResponse<br>+ approve(fieldSheetId, request, caller): FieldSheetResponse<br>+ reject(fieldSheetId, caller): FieldSheetResponse<br>+ relink(fieldSheetId, request): FieldSheetResponse</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetWireMapper</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Wire Mapper</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Traduce solicitudes en comandos y criterios, exige el rol del llamador y traduce resultados en respuestas.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ toSubmitFieldSheet(request, caller): SubmitFieldSheet<br>+ toApproveFieldSheet(...): ApproveFieldSheet<br>+ toRejectFieldSheet(fieldSheetId, caller): RejectFieldSheet<br>+ toRelinkFieldSheet(fieldSheetId, request): RelinkFieldSheet<br>+ toFieldSheetsPage(...): FieldSheetsPage<br>+ toFieldSheetResponse(result): FieldSheetResponse<br>+ toFieldSheetsPageResponse(result): FieldSheetsPageResponse<br>+ toScanLinkResponse(result): ScanLinkResponse</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">SubmitFieldSheetRequest</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Cuerpo del envío de una ficha.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ taskCode: String<br>+ scanKey: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ApproveFieldSheetRequest</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Cuerpo de la aprobación con los datos confirmados.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ beneficiaryDocumentType, beneficiaryDocumentNumber: String<br>+ usedSupplies: List&lt;SupplyRequest&gt;<br>+ evaluationDate, securementDate: LocalDateTime</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">RelinkFieldSheetRequest</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Cuerpo de la reasignación.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ taskCode: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">SupplyRequest</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Insumo confirmado por el revisor.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ name: String<br>+ amount: BigDecimal<br>+ unit: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Detalle de una ficha.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ id, code, taskCode, status<br>+ beneficiaryDocumentType, beneficiaryDocumentNumber<br>+ usedSupplies: List&lt;SupplyResponse&gt;<br>+ evaluationDate, securementDate<br>+ submittedBy, submissionDate, reviewedBy, reviewDate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetSummaryResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ficha dentro de una página.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ id, code, taskCode, status<br>+ submittedBy, submissionDate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetsPageResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Página de fichas.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ content: List&lt;FieldSheetSummaryResponse&gt;<br>+ totalPages, totalElements<br>+ actualPage, pageSize</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">SupplyResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Insumo de una ficha aprobada.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ name: String<br>+ amount: BigDecimal<br>+ unit: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ScanLinkResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Enlace firmado al PDF y su vencimiento.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ key: String<br>+ url: String<br>+ expiresAt: Instant</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetSubmittedHandler</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Event Handler</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Al enviarse una ficha, ejecuta su entrega a poi.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- fieldSheetCommandService: FieldSheetCommandService</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ on(FieldSheetSubmitted): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetApprovedHandler</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Event Handler</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Al aprobarse una ficha, completa su tarea en poi.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- fieldSheetCommandService: FieldSheetCommandService</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ on(FieldSheetApproved): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetRejectedHandler</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Event Handler</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Al rechazarse una ficha, reabre su tarea en poi.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- fieldSheetCommandService: FieldSheetCommandService</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ on(FieldSheetRejected): void</td>
        </tr>
    </tbody>
</table>
</div>

Los consumidores de eventos se registran con @ApplicationModuleListener de Spring Modulith. El evento se guarda en la tabla de publicación de eventos dentro de la misma transacción que cambió la ficha, y el consumidor se ejecuta después de confirmarla; si falla, la publicación queda pendiente y se vuelve a intentar.
