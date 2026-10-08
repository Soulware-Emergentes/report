La capa de interfaz es un controlador REST que solo atiende a otros servicios. Toda ruta bajo /api exige un token de Staff de tipo servicio (token_use igual a service), dirigido a la API de beneficiarios y con el scope beneficiaries.read. El token de una persona recibe una respuesta 401, y un token sin el scope, una respuesta 403.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 40%;">Método y ruta</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 40%;">Operación</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 20%;">Token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /api/v1/beneficiaries</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Lista una página de beneficiarios con filtros y orden.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">beneficiaries.read</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/beneficiaries/lookup</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Resuelve hasta 100 documentos legales en beneficiarios, e informa los que nadie tiene.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">beneficiaries.read</td>
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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryController</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Controller</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Expone las consultas del registro como recursos REST.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- beneficiaryQueryService: BeneficiaryQueryService</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ page(names, paternalSurname, maternalSurname, legalDocumentType, legalDocumentNumber, sort, direction, page, size): BeneficiariesPageResponse<br>+ lookup(request): BeneficiaryLookupResponse</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryWireMapper</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Wire Mapper</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Traduce parámetros y solicitudes en criterios, y resultados en respuestas.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Métodos estáticos to*</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryLookupRequest</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Documentos a resolver.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ legalDocuments: List&lt;LegalDocumentRequest&gt;</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">LegalDocumentRequest</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Documento legal a resolver.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ type: String<br>+ number: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryResponse</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Beneficiario del registro.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ legalDocument: LegalDocumentResponse<br>+ names, paternalSurname, maternalSurname<br>+ dateOfBirth, ubigeo</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">LegalDocumentResponse</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Documento legal.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ type: String<br>+ number: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiariesPageResponse</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Página de beneficiarios.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ content: List&lt;BeneficiaryResponse&gt;<br>+ totalPages, totalElements<br>+ actualPage, pageSize</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryLookupResponse</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Beneficiarios encontrados y documentos sin beneficiario.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ found: List&lt;BeneficiaryResponse&gt;<br>+ notFound: List&lt;LegalDocumentResponse&gt;</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
    </tbody>
</table>
</div>

Una entrada inválida, como un tipo de documento desconocido o una página fuera de rango, recibe una respuesta 422 con el sobre de error común a los servicios.
