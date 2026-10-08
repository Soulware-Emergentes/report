La capa de aplicación del proveedor de identidad define los puertos de lectura que usa el servidor de autorización. No tiene comandos: los registros de aplicaciones y API, y las asignaciones de roles y scopes, se cargan en la base de datos. El flujo de autenticación lo conduce el servidor de autorización de la capa de infraestructura, que consulta estos puertos y la interfaz DirectoryApi del módulo Directory.

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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ClientProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Puerto de lectura de las aplicaciones registradas.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findByClientId(ClientByClientId): Optional&lt;ClientResult&gt;<br>+ findById(ClientById): Optional&lt;ClientResult&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ClientByClientId</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Aplicación por su nombre público.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ clientId: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ClientById</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Aplicación por la identidad de su registro.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ id: UUID</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ClientResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Aplicación registrada con todo lo que el servidor de autorización verifica en sus solicitudes.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ id: UUID<br>+ clientId, kind, secretHash<br>+ loginRedirectUris, logoutRedirectUris<br>+ resources, roles, grantedScopes</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GrantProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Puerto de lectura de lo que otorga el proveedor: roles a grupos y scopes a aplicaciones.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findRoles(RolesOfGroups): List&lt;String&gt;<br>+ findScopes(ScopesOfClient): List&lt;String&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">RolesOfGroups</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Roles que un conjunto de grupos tiene en una API.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ resource: String<br>+ groupIds: List&lt;UUID&gt;</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">ScopesOfClient</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Scopes otorgados a una aplicación en una API, para los tokens que obtiene para sí misma.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ clientId: String<br>+ resource: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
    </tbody>
</table>
</div>
