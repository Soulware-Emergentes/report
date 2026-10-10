La capa de aplicación ofrece a los demás módulos la interfaz PeopleApi, que resuelve identidades en perfiles. Las búsquedas reciben un lote, para que un listado resuelva a todas sus personas en una sola llamada, y una identidad que el sistema dueño no conoce simplemente no aparece en la respuesta.

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
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PeopleApi</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Module API</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Contrato con el que otros módulos resuelven identidades en datos personales.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ findBeneficiaries(documents): List&lt;BeneficiaryProfile&gt;<br>+ findFieldAgents(ids): List&lt;FieldAgentProfile&gt;<br>+ findGeneralManagementAssistants(ids): List&lt;GeneralManagementAssistantProfile&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PeopleApiService</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Application Service</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa PeopleApi traduciendo identidades a criterios y resultados a perfiles.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- beneficiaryQueryService: BeneficiaryQueryService<br>- staffQueryService: StaffQueryService</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ findBeneficiaries(documents): List&lt;BeneficiaryProfile&gt;<br>+ findFieldAgents(ids): List&lt;FieldAgentProfile&gt;<br>+ findGeneralManagementAssistants(ids): List&lt;GeneralManagementAssistantProfile&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">BeneficiaryQueryService</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Service</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Busca beneficiarios por documento legal, sin repetir documentos.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- beneficiaryProjection: BeneficiaryProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ byDocument(BeneficiariesByDocument): BeneficiariesResult</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">BeneficiariesByDocument</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Beneficiarios a buscar por documento legal.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ documents: List&lt;BeneficiaryByDocument&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">BeneficiaryByDocument</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Un beneficiario a buscar por documento legal.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ type: String<br>+ number: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">BeneficiaryResult</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Beneficiario según lo devolvió el registro.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ documentType, documentNumber<br>+ names, paternalSurname, maternalSurname<br>+ dateOfBirth: LocalDate<br>+ ubigeo: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">BeneficiariesResult</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Beneficiarios encontrados.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ beneficiaries: List&lt;BeneficiaryResult&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">BeneficiaryProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Projection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Puerto de lectura del registro de beneficiarios.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ findByDocuments(BeneficiariesByDocument): List&lt;BeneficiaryResult&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">StaffQueryService</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Service</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Busca miembros del personal por la identidad de su cuenta.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- personProjection: PersonProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ fieldAgentsById(StaffMembersById): StaffMembersResult<br>+ generalManagementAssistantsById(StaffMembersById): StaffMembersResult</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">StaffMembersById</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Miembros del personal a buscar por GUID de cuenta.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ ids: List&lt;UUID&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">StaffMemberResult</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Miembro del personal según lo devolvió el directorio.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ id: UUID<br>+ username: String<br>+ displayName: String</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">StaffMembersResult</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Miembros del personal encontrados.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ staffMembers: List&lt;StaffMemberResult&gt;</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PersonProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Projection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Puerto de lectura de las personas del directorio.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ findByIds(ids): List&lt;StaffMemberResult&gt;</td>
        </tr>
    </tbody>
</table>
</div>

StaffQueryService resuelve a los agentes de campo y a los asistentes de gerencia general de la misma forma, porque el directorio registra a las personas sin las funciones que cumplen en sgt. Los dos métodos existen para que el rol con el que sgt registró a cada persona se lea en cada llamada. El módulo atiende la historia SGT-7 (consultar los datos del beneficiario durante la validación de una ficha).
