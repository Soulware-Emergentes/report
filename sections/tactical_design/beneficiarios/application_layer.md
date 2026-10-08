La capa de aplicación tiene solo el lado de consulta: el registro no recibe comandos. BeneficiaryQueryService valida los criterios antes de pasarlos a la proyección: el tipo de documento, la columna y la dirección de orden, y el tamaño de la página.

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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryQueryService</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Service</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Responde las consultas que otros sistemas del programa hacen al registro.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- beneficiaryProjection: BeneficiaryProjection<br>- MAX_LOOKUP_SIZE: int = 100<br>- MAX_PAGE_SIZE: int = 100</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ page(BeneficiariesPage): BeneficiariesPageResult<br>+ lookup(BeneficiariesByDocument): BeneficiaryLookupResult</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiariesPage</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Página de beneficiarios, filtrada opcionalmente por nombres, apellidos y documento, y ordenada por la columna indicada.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ names, paternalSurname, maternalSurname<br>+ legalDocumentType, legalDocumentNumber<br>+ sort, direction<br>+ page, size: int</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiariesByDocument</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Beneficiarios que tienen alguno de varios documentos legales.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ documents: List&lt;BeneficiaryByDocument&gt;</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryByDocument</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Un beneficiario por su documento legal.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ type: String<br>+ number: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Beneficiario del registro.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ legalDocument: LegalDocumentResult<br>+ names, paternalSurname, maternalSurname<br>+ dateOfBirth: LocalDate<br>+ ubigeo: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">LegalDocumentResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Documento legal.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ type: String<br>+ number: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiariesPageResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Página de beneficiarios en el orden solicitado.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ content: List&lt;BeneficiaryResult&gt;<br>+ totalPages: int<br>+ totalElements: long<br>+ actualPage, pageSize: int</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryLookupResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Beneficiarios encontrados y documentos que nadie tiene en el registro.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ found: List&lt;BeneficiaryResult&gt;<br>+ notFound: List&lt;LegalDocumentResult&gt;</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Puerto de lectura de los beneficiarios almacenados.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findPage(BeneficiariesPage): BeneficiariesPageResult<br>+ findByDocuments(BeneficiariesByDocument): List&lt;BeneficiaryResult&gt;</td>
        </tr>
    </tbody>
</table>
</div>

Además de las reglas del dominio, la consulta paginada rechaza con excepciones del núcleo compartido una columna de orden no admitida (UnsortableColumnException), una dirección distinta de asc o desc (InvalidSortDirectionException) y una página fuera de rango (InvalidPageException). La búsqueda por documentos atiende la historia SGT-7 (consultar los datos del beneficiario durante la validación de una ficha), a través del módulo People de sgt.
