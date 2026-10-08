People no tiene capa de interfaz propia: los demás módulos lo usan a través de PeopleApi. Su capa de infraestructura implementa los dos puertos de proyección como clientes HTTP de los sistemas que administran a las personas. Ambos clientes se autentican con un token de servicio que sgt obtiene de staff con el flujo client credentials, y piden los datos por lotes.

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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">HttpBeneficiaryProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection Adapter</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Implementa BeneficiaryProjection contra el registro de beneficiarios.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- client: RestClient</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findByDocuments(BeneficiariesByDocument): List&lt;BeneficiaryResult&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">HttpPersonProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection Adapter</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Implementa PersonProjection contra el directorio de staff.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- client: RestClient</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findByIds(ids): List&lt;StaffMemberResult&gt;</td>
        </tr>
    </tbody>
</table>
</div>

<div style="width: 100%; overflow-x: auto;">
<table style="width: 100%; border-collapse: collapse; border: 1px solid #333; font-family: Arial, sans-serif; font-size: 14px;">
    <thead>
        <tr>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 40%;">Puerto</th>
            <th style="border: 1px solid #333; padding: 8px 10px; text-align: left; width: 60%;">Llamada</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">BeneficiaryProjection.findByDocuments</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v1/beneficiaries/lookup (beneficiarios)</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PersonProjection.findByIds</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">POST /api/v3/people/lookup (staff)</td>
        </tr>
    </tbody>
</table>
</div>

Una falla de red o una respuesta sin cuerpo se traduce en una InfrastructureException.
