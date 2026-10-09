La capa de interfaz del directorio es un controlador REST que otros servicios llaman con un token de servicio emitido por Identity Provider. Todas sus rutas exigen el scope people.read.

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px; table-layout: fixed; overflow-wrap: anywhere; word-break: break-word;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 40%;">Método y ruta</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 40%;">Operación</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 20%;">Token</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GET /api/v3/people</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Lista una página de personas con filtros y orden.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">people.read</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v3/people/lookup</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Resuelve hasta 100 identidades en personas, e informa las que nadie tiene.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">people.read</td>
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
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PersonController</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Controller</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Expone las consultas del directorio como recursos REST.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- personQueryService: PersonQueryService</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ page(jobTitle, department, username, displayName, sort, direction, page, size): PeoplePageResponse<br>+ lookup(request): PeopleLookupResponse</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PersonWireMapper</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Wire Mapper</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Traduce parámetros y solicitudes en criterios, y resultados en respuestas.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Métodos estáticos to*</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PeopleLookupRequest</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Request</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Identidades a resolver.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ ids: List&lt;UUID&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PersonResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Persona del directorio.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ id: UUID<br>+ username, displayName<br>+ jobTitle, department</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PeoplePageResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Página de personas.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ content: List&lt;PersonResponse&gt;<br>+ totalPages, totalElements<br>+ page, size</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PeopleLookupResponse</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Response</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Personas encontradas e identidades sin persona.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ found: List&lt;PersonResponse&gt;<br>+ notFound: List&lt;UUID&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
    </tbody>
</table>
</div>
