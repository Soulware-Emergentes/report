La capa de aplicación separa la escritura de la lectura. FieldSheetCommandService recibe las intenciones de cambio y delega cada una en su Command Handler, que carga el agregado, ejecuta la regla de dominio y lo guarda en la misma transacción. FieldSheetQueryService responde las consultas a través de puertos de proyección, sin pasar por el agregado.

SubmitFieldSheetHandler se ejecuta con aislamiento SERIALIZABLE, porque el código de la ficha sale de la última ficha del año: si dos envíos concurrentes leen la misma última ficha, la base de datos rechaza uno de ellos al confirmar.

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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">FieldSheetCommandService</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Service</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Punto de entrada de escritura del módulo.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- submitFieldSheetHandler<br>- approveFieldSheetHandler<br>- rejectFieldSheetHandler<br>- relinkFieldSheetHandler<br>- deliverFieldSheetHandler<br>- completeTaskHandler<br>- reopenTaskHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ submit(SubmitFieldSheet): FieldSheetId<br>+ approve(ApproveFieldSheet): void<br>+ reject(RejectFieldSheet): void<br>+ relink(RelinkFieldSheet): void<br>+ deliver(DeliverFieldSheet): void<br>+ completeTask(CompleteTask): void<br>+ reopenTask(ReopenTask): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">SubmitFieldSheet</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Envía una ficha para una tarea del POI en nombre del agente de campo.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ taskCode: TaskCode<br>+ scanKey: ScanKey<br>+ submittedBy: FieldAgentId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ApproveFieldSheet</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Aprueba una ficha entregada y confirma lo que dice su PDF.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ fieldSheetId: FieldSheetId<br>+ reviewer: GeneralManagementAssistantId<br>+ beneficiary: BeneficiaryLegalDocument<br>+ usedSupplies: List&lt;Supply&gt;<br>+ evaluationDate: EvaluationDate<br>+ securementDate: SecurementDate</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">RejectFieldSheet</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Rechaza la evaluación de una ficha entregada.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ fieldSheetId: FieldSheetId<br>+ reviewer: GeneralManagementAssistantId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">RelinkFieldSheet</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Reasigna una ficha en revisión a la tarea a la que corresponde su evidencia.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ fieldSheetId: FieldSheetId<br>+ taskCode: TaskCode</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">DeliverFieldSheet</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Entrega una ficha enviada a poi y registra su respuesta.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ fieldSheetId: FieldSheetId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">CompleteTask</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Completa la tarea del POI de una ficha aprobada.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ fieldSheetId: FieldSheetId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ReopenTask</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Devuelve a pendientes la tarea del POI de una ficha rechazada.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ fieldSheetId: FieldSheetId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">SubmitFieldSheetHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Verifica que el PDF esté subido y registra la ficha con el código siguiente a la última ficha del año.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- fieldSheetRepository: FieldSheetRepository<br>- scanStore: ScanStore</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(SubmitFieldSheet): FieldSheetId</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ApproveFieldSheetHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Registra la aprobación con los datos que confirmó el revisor.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- fieldSheetRepository: FieldSheetRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(ApproveFieldSheet): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">RejectFieldSheetHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Registra el rechazo de la ficha.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- fieldSheetRepository: FieldSheetRepository</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(RejectFieldSheet): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">RelinkFieldSheetHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Consulta a poi la reasignación y reasigna la ficha, junto con la ficha intercambiada cuando poi las intercambia.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- fieldSheetRepository: FieldSheetRepository<br>- taskLedger: TaskLedger</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(RelinkFieldSheet): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">DeliverFieldSheetHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Registra la entrega en poi y marca la ficha como entregada o anulada según la respuesta.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- fieldSheetRepository: FieldSheetRepository<br>- taskLedger: TaskLedger</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(DeliverFieldSheet): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">CompleteTaskHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Completa en poi la tarea de la ficha aprobada.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- fieldSheetRepository: FieldSheetRepository<br>- taskLedger: TaskLedger</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(CompleteTask): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ReopenTaskHandler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Command Handler</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Reabre en poi la tarea de la ficha rechazada.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- fieldSheetRepository: FieldSheetRepository<br>- taskLedger: TaskLedger</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ handle(ReopenTask): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">FieldSheetQueryService</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Service</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Punto de entrada de lectura sobre fichas y sus PDF.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- fieldSheetProjection: FieldSheetProjection<br>- scanLinkProjection: ScanLinkProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ page(FieldSheetsPage): FieldSheetsPageResult<br>+ byId(FieldSheetById): FieldSheetResult<br>+ uploadSlot(ScanUploadSlot): ScanLinkResult<br>+ scan(ScanOfFieldSheet): ScanLinkResult</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">FieldSheetsPage</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Página de fichas, filtrada opcionalmente por estado, código, código de tarea y rango de días de envío, y ordenada por la columna indicada.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ status, code, taskCode: String<br>+ submittedFrom, submittedTo: String<br>+ sort, direction: String<br>+ page, size: int</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">FieldSheetById</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Una ficha por su identidad.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ id: UUID</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ScanOfFieldSheet</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PDF de una ficha, para descargarlo.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ fieldSheetId: UUID</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ScanUploadSlot</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Espacio en el almacén de objetos para subir el PDF de una ficha nueva.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">FieldSheetResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Detalle de una ficha con lo que confirmó su revisión.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ id, code, taskCode, status<br>+ beneficiaryDocumentType, beneficiaryDocumentNumber<br>+ usedSupplies: List&lt;SupplyResult&gt;<br>+ evaluationDate, securementDate<br>+ submittedBy, submissionDate<br>+ reviewedBy, reviewDate</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">FieldSheetSummaryResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ficha dentro de un listado.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ id, code, taskCode, status<br>+ submittedBy, submissionDate</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">FieldSheetsPageResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Página de fichas en el orden solicitado.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ content: List&lt;FieldSheetSummaryResult&gt;<br>+ totalPages: int<br>+ totalElements: long<br>+ actualPage, pageSize: int</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">SupplyResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Insumo confirmado por el revisor.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ name: String<br>+ amount: BigDecimal<br>+ unit: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ScanLinkResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Enlace firmado y temporal a un PDF en el almacén de objetos.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ key: String<br>+ url: String<br>+ expiresAt: Instant</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">FieldSheetProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Puerto de lectura de las fichas almacenadas.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findPage(FieldSheetsPage): FieldSheetsPageResult<br>+ findById(FieldSheetById): Optional&lt;FieldSheetResult&gt;<br>+ findScanKey(ScanOfFieldSheet): Optional&lt;String&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ScanLinkProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Puerto que emite enlaces firmados al almacén de objetos.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ uploadLink(ScanUploadSlot): ScanLinkResult<br>+ downloadLink(key): ScanLinkResult</td>
        </tr>
    </tbody>
</table>
</div>

Tres comandos se ejecutan como reacción a los eventos del agregado, a través de los consumidores de eventos del módulo. FieldSheetSubmitted desencadena DeliverFieldSheet, FieldSheetApproved desencadena CompleteTask y FieldSheetRejected desencadena ReopenTask. Así, la comunicación con poi ocurre después de confirmar la transacción que cambió la ficha, y una falla de poi se reintenta sin deshacer el envío ni la revisión.

Las capacidades del módulo atienden las siguientes historias de usuario:

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 50%;">Capacidad</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 50%;">Historia de usuario</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ScanUploadSlot y SubmitFieldSheet</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">SGT-3: subir la ficha diligenciada</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">FieldSheetsPage y FieldSheetById</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">SGT-4: buscar y filtrar las fichas registradas</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ApproveFieldSheet, RejectFieldSheet y RelinkFieldSheet</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">EP-03: validación y aprobación de fichas</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ScanOfFieldSheet</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">SGT-6: verificar el documento digitalizado</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">DeliverFieldSheet, CompleteTask y ReopenTask</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">EP-04: seguimiento de objetivos estratégicos institucionales</td>
        </tr>
    </tbody>
</table>
</div>
