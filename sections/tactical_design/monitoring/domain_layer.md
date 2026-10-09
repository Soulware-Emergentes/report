El núcleo del módulo es el agregado FieldSheet. Guarda la evidencia de la visita, que no cambia una vez enviada, y registra quién la envió, qué respondió poi a su entrega y, cuando se revisa, quién la revisó, cuándo y con qué resultado. Lo que el PDF dice (el beneficiario, los insumos usados y las fechas) solo se almacena al aprobar la ficha, porque es el revisor quien lo confirma.

Además de su identidad técnica, cada ficha recibe al enviarse un código de negocio con el formato FI-0032-2026: su número entre las fichas enviadas en el año y ese año. La numeración vuelve a empezar en 1 cada año y llega hasta 9999. El agregado calcula el código a partir de la última ficha enviada en el mismo año, que recibe como parámetro.

El ciclo de vida avanza en un solo sentido. Una ficha se envía (SUBMITTED); si poi acepta la entrega pasa a DELIVERED, y si la rechaza porque la tarea no existe o ya tiene una entrega queda anulada (VOIDED). Solo una ficha entregada se aprueba (APPROVED) o se rechaza (REJECTED), y una ficha rechazada no se reabre: una evaluación corregida se envía como una ficha nueva.

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
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheet</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Aggregate Root</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Representa la evaluación de un beneficiario enviada por un agente de campo y la revisión que recibe.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- id: FieldSheetId<br>- code: FieldSheetCode<br>- taskCode: TaskCode<br>- status: FieldSheetStatus<br>- beneficiaryLegalDocument: BeneficiaryLegalDocument<br>- usedSupplies: List&lt;Supply&gt;<br>- evaluationDate: EvaluationDate<br>- securementDate: SecurementDate<br>- scan: FieldSheetScan<br>- submittedBy: FieldAgentId<br>- submissionDate: SubmissionDate<br>- reviewedBy: GeneralManagementAssistantId<br>- reviewDate: ReviewDate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ submit(id, taskCode, scan, submittedBy, submissionDate, lastOfYear): FieldSheet<br>+ reconstitute(...): FieldSheet<br>+ approve(reviewer, reviewDate, beneficiaryLegalDocument, usedSupplies, evaluationDate, securementDate): void<br>+ reject(reviewer, reviewDate): void<br>+ recordDeliveryAccepted(): void<br>+ recordDeliveryRefused(): void<br>+ relinkTo(taskCode): void</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetId</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Aggregate Id</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Identifica una ficha; forma parte del lenguaje publicado del módulo.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: UUID</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetSubmitted</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Domain Event</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Anuncia que se envió una ficha y que su entrega debe llegar a poi.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ fieldSheetId: FieldSheetId<br>+ occurredOn: Instant</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetApproved</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Domain Event</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Anuncia que se aprobó una ficha; forma parte del lenguaje publicado del módulo.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ fieldSheetId: FieldSheetId<br>+ occurredOn: Instant</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetRejected</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Domain Event</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Anuncia que se rechazó una ficha y que su tarea necesita una nueva entrega.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ fieldSheetId: FieldSheetId<br>+ occurredOn: Instant</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetCode</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Identidad de negocio de la ficha: su número en el año y el año, con el formato FI-0032-2026.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ number: int<br>+ year: SubmissionYear</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ first(year): FieldSheetCode<br>+ parse(text): FieldSheetCode<br>+ next(): FieldSheetCode<br>+ value(): String</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">SubmissionYear</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Año de envío de la ficha, dentro del cual se numera su código.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: int</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ of(submissionDate): SubmissionYear</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">TaskCode</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Código de la tarea del POI a la que corresponde la ficha, con el formato 2025-2030-01-03-0032.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetScan</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PDF escaneado que sirve de evidencia, tal como lo guarda el almacén de objetos.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ key: ScanKey<br>+ sizeInBytes: long</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ScanKey</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ubicación del PDF en el almacén de objetos.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetStatus</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object (enum)</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Etapa de la revisión en la que se encuentra la ficha.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">SUBMITTED<br>DELIVERED<br>APPROVED<br>REJECTED<br>VOIDED</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Supply</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Insumo agrícola usado por el beneficiario y su cantidad.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ name: SupplyName<br>+ quantity: Quantity</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">SupplyName</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Nombre del insumo según lo denomina el programa.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Quantity</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Cantidad no negativa de un insumo y su unidad.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: BigDecimal<br>+ unit: MeasurementUnit</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">MeasurementUnit</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object (enum)</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Unidad en la que se expresa una cantidad.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">KILOGRAM<br>LITER<br>UNIT</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">SubmissionDate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Momento en que el agente de campo envió la ficha.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: LocalDateTime</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">EvaluationDate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Momento en que el agente de campo realizó la evaluación.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: LocalDateTime</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">SecurementDate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Momento de aseguramiento que consigna la ficha.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: LocalDateTime</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ReviewDate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Momento en que el asistente de gerencia general revisó la ficha.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: LocalDateTime</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ExecutionDate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Día en que se realizó el trabajo que la entrega reporta a poi.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ value: LocalDate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">DeliveryOutcome</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object (enum)</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Respuesta de poi a la entrega registrada para una tarea.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ACCEPTED<br>REFUSED</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">RelinkOutcome</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Respuesta de poi a una reasignación, con la ficha intercambiada cuando corresponde.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ result: RelinkResult<br>+ swappedWith: FieldSheetId</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">RelinkResult</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Value Object (enum)</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Acción que tomó poi con una entrega reasignada a otra tarea.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">MOVED<br>SWAPPED<br>REFUSED</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetRepository</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Repository</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Persiste y recupera agregados FieldSheet.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ save(fieldSheet): FieldSheet<br>+ getById(id): FieldSheet<br>+ getAllByIds(ids): List&lt;FieldSheet&gt;<br>+ delete(fieldSheet): void<br>+ findLastSubmittedIn(year): Optional&lt;FieldSheet&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ScanStore</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Domain Service</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Consulta el almacén de objetos al que el agente de campo sube el PDF.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ inspect(key): FieldSheetScan</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">TaskLedger</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Domain Service</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Registro de poi sobre qué tareas tienen entrega y cómo se revisó cada una.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ registerDelivery(taskCode, fieldSheetId, executionDate): DeliveryOutcome<br>+ relink(taskCode, fromTaskCode, fieldSheetId): RelinkOutcome<br>+ complete(taskCode, fieldSheetId): void<br>+ reopen(taskCode, fieldSheetId): void</td>
        </tr>
    </tbody>
</table>
</div>

FieldSheet referencia a las personas por las identidades que publica People: BeneficiaryLegalDocument para el beneficiario, FieldAgentId para quien envía la ficha y GeneralManagementAssistantId para quien la revisa. Esas clases se detallan en el contexto People.

TaskLedger y ScanStore son interfaces del dominio que la capa de infraestructura implementa. TaskLedger trata la negativa de poi como una respuesta válida, y cada operación identifica a la ficha que hizo la entrega, de modo que repetir un paso que ya llegó a poi no cambia nada.

Las reglas de negocio del módulo se protegen con las siguientes excepciones. Todas heredan de BusinessRuleViolationException, salvo FieldSheetNotFoundException, que hereda de EntityNotFoundException.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px; table-layout: fixed; overflow-wrap: anywhere; word-break: break-word;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 35%;">Excepción</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 65%;">Regla de negocio que protege</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingFieldSheetCodeException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda ficha tiene código.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">InvalidFieldSheetCodeException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">El código de ficha tiene el formato FI-número-año, con un número de 1 a 9999.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">InvalidSubmissionYearException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">El año de envío tiene cuatro dígitos.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">FieldSheetNumbersExhaustedException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Un año numera como máximo 9999 fichas.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingTaskCodeException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda ficha se envía para una tarea, y una reasignación siempre indica la tarea de destino.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">InvalidTaskCodeException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">El código de tarea sigue el formato de años del plan, objetivo, actividad y número de tarea.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingScanException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda ficha tiene un PDF escaneado como evidencia.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BlankScanKeyException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">La ubicación del PDF en el almacén de objetos no está vacía.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">EmptyScanException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">El PDF enviado tiene contenido.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ScanNotUploadedException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">El PDF existe en el almacén de objetos antes de registrar la ficha.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingSubmitterException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda ficha registra al agente de campo que la envió.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingSubmissionDateException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda ficha registra cuándo se envió.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingReviewerException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda revisión registra al asistente de gerencia general que la hizo.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingReviewDateException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda revisión registra cuándo se hizo.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ReviewBeforeSubmissionException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Una ficha no se revisa antes de su envío.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ReviewerIsSubmitterException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Nadie revisa una ficha que envió.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingBeneficiaryException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Una ficha aprobada identifica al beneficiario evaluado.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingEvaluationDateException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Una ficha aprobada indica cuándo se realizó la evaluación.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingSecurementDateException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Una fecha de aseguramiento, cuando se indica, tiene valor.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingExecutionDateException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Una entrega a poi indica el día en que se realizó el trabajo.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BlankSupplyNameException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Todo insumo tiene nombre.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">NegativeQuantityException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">La cantidad de un insumo no es negativa.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingMeasurementUnitException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda cantidad indica su unidad.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">FieldSheetNotSubmittedException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">La respuesta de poi a una entrega se registra una sola vez, sobre una ficha enviada.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">FieldSheetNotDeliveredException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Solo se revisa o reasigna una ficha cuya entrega aceptó poi.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">FieldSheetAlreadyReviewedException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Una ficha aprobada o rechazada no se vuelve a revisar ni se reasigna.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">InvalidRelinkOutcomeException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">La respuesta de poi a una reasignación nombra otra ficha solo cuando hubo intercambio.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">RelinkRefusedException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Una reasignación que poi rechaza no cambia la tarea de la ficha.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">MissingFieldSheetIdException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Toda ficha tiene identidad.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">UnknownFieldSheetStatusException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Un filtro por estado nombra un estado que existe.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">InvalidSubmissionDayException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Un día de envío para filtrar se escribe como fecha, por ejemplo 2026-10-01.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">InvertedSubmissionRangeException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Un rango de días de envío no termina antes de empezar.</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">FieldSheetNotFoundException</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Las operaciones sobre una ficha se refieren a una ficha registrada.</td>
        </tr>
    </tbody>
</table>
</div>
