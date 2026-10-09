La capa de infraestructura implementa los puertos del dominio y de la aplicación contra tres sistemas: la base de datos PostgreSQL de sgt, el almacén de objetos compatible con S3 que guarda los PDF y la API REST de poi.

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
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JpaFieldSheetRepositoryAdapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Repository Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa FieldSheetRepository con JPA, traduciendo entre el agregado y su entidad.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- jpaRepository: FieldSheetJpaRepository</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ save(fieldSheet): FieldSheet<br>+ getById(id): FieldSheet<br>+ findLastSubmittedIn(year): Optional&lt;FieldSheet&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetEntity</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JPA Entity</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Fila de la tabla field_sheets con sus insumos.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">id, code, taskCode, status<br>beneficiaryDocumentType, beneficiaryDocumentNumber<br>evaluationDate, securementDate<br>scanKey, scanSize<br>submittedBy, submissionDate, reviewedBy, reviewDate<br>supplies: List&lt;SupplyRow&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Getters</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">SupplyRow</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JPA Embeddable</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Fila de la tabla field_sheet_supplies.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">name: String<br>amount: BigDecimal<br>unit: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Getters</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">FieldSheetJpaRepository</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Spring Data Repository</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Acceso JPA a field_sheets.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Métodos derivados de JpaRepository</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JdbcFieldSheetProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Projection Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa FieldSheetProjection con consultas SQL sobre field_sheets y field_sheet_supplies.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- jdbc: NamedParameterJdbcTemplate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ findPage(FieldSheetsPage): FieldSheetsPageResult<br>+ findById(FieldSheetById): Optional&lt;FieldSheetResult&gt;<br>+ findScanKey(ScanOfFieldSheet): Optional&lt;String&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ObjectStoreConfiguration</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Configuration</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Crea el cliente S3 y el firmador de enlaces hacia el almacén de objetos.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ scanStoreClient(): S3Client<br>+ scanStorePresigner(): S3Presigner</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ObjectStoreScanStore</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Domain Service Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa ScanStore consultando los metadatos del objeto subido.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- client: S3Client<br>- bucket: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ inspect(key): FieldSheetScan</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">ObjectStoreScanLinkProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Projection Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa ScanLinkProjection con enlaces firmados de subida y descarga válidos por 15 minutos.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- presigner: S3Presigner<br>- bucket: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ uploadLink(ScanUploadSlot): ScanLinkResult<br>+ downloadLink(key): ScanLinkResult</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">HttpTaskLedger</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Domain Service Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa TaskLedger contra la API de tareas de poi, autenticándose con un token de servicio.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- client: RestClient</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ registerDelivery(taskCode, fieldSheetId, executionDate): DeliveryOutcome<br>+ relink(taskCode, fromTaskCode, fieldSheetId): RelinkOutcome<br>+ complete(taskCode, fieldSheetId): void<br>+ reopen(taskCode, fieldSheetId): void</td>
        </tr>
    </tbody>
</table>
</div>

HttpTaskLedger traduce las negativas de poi en respuestas del dominio (REFUSED) y cualquier otra falla en una InfrastructureException, de modo que el paso se reintenta. Las llamadas a poi usan un token obtenido de staff con el flujo client credentials, a través del componente compartido OAuth2ServiceTokens, y nunca reenvían el token de la persona que originó la solicitud.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px; table-layout: fixed; overflow-wrap: anywhere; word-break: break-word;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 40%;">Operación de TaskLedger</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 60%;">Llamada a poi</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">registerDelivery</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/tasks/{taskCode}/delivery</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">relink</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/tasks/{taskCode}/delivery/relink</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">complete</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/tasks/{taskCode}/completion</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">reopen</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/tasks/{taskCode}/reopening</td>
        </tr>
    </tbody>
</table>
</div>
