La capa de aplicación del directorio es de solo lectura: las personas se cargan en el directorio y el servicio las consulta. Expone la interfaz DirectoryApi a los demás módulos de staff y tres servicios de consulta. Los puertos de proyección leen hoy de la base de datos y están definidos de forma que puedan leer de un directorio LDAP sin cambiar a sus consumidores.

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
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">DirectoryApi</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Module API</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Contrato que el directorio ofrece a los demás módulos.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ authenticate(username, password): Optional&lt;UUID&gt;<br>+ findPeople(ids): List&lt;PersonProfile&gt;<br>+ groupsOf(personId): List&lt;UUID&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">DirectoryApiService</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Application Service</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Implementa DirectoryApi a través de los servicios de consulta.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- accountQueryService<br>- personQueryService<br>- groupQueryService</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ authenticate(username, password): Optional&lt;UUID&gt;<br>+ findPeople(ids): List&lt;PersonProfile&gt;<br>+ groupsOf(personId): List&lt;UUID&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">AccountQueryService</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Service</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Verifica las credenciales con las que una persona inicia sesión.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- credentialProjection: CredentialProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ authenticate(Credentials): AuthenticationResult</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Credentials</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Usuario y contraseña ingresados; la contraseña nunca aparece en su representación textual.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ username: String<br>+ password: String</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ toString(): String</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">AuthenticationResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Resultado de verificar credenciales, con la identidad de la persona si son válidas.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ authenticated: boolean<br>+ personId: UUID</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">CredentialProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Puerto que verifica una contraseña contra el directorio.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findAuthenticated(Credentials): Optional&lt;UUID&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PersonQueryService</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Service</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Consulta personas por página con filtros, o por lotes de identidades.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- personProjection: PersonProjection<br>- MAX_LOOKUP_SIZE: int = 100</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ page(PeoplePage): PeoplePageResult<br>+ lookup(PeopleById): PeopleLookupResult</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PeoplePage</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Página de personas, opcionalmente filtrada por cargo, área, usuario o nombre, y ordenada por la columna indicada.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ jobTitle, department<br>+ username, displayName<br>+ sort, direction<br>+ page, size: int</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PeopleById</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Personas con los GUID indicados.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ ids: List&lt;UUID&gt;</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PersonResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Persona tal como la conocen otros servicios.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ id: UUID<br>+ username, displayName<br>+ jobTitle, department</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PeoplePageResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Página de personas en el orden solicitado.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ content: List&lt;PersonResult&gt;<br>+ totalPages: int<br>+ totalElements: long<br>+ page, size: int</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PeopleLookupResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Personas encontradas y GUID que nadie tiene en el directorio.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ found: List&lt;PersonResult&gt;<br>+ notFound: List&lt;UUID&gt;</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">PersonProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Puerto de lectura de las personas del directorio.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findPage(PeoplePage): PeoplePageResult<br>+ findByIds(PeopleById): List&lt;PersonResult&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GroupQueryService</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Service</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Consulta los grupos a los que pertenece una persona.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">- groupMembershipProjection: GroupMembershipProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ groupsOf(GroupsOfPerson): GroupMembershipResult</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GroupsOfPerson</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Criteria</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Grupos de una persona.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ personId: UUID</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GroupMembershipResult</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Query Result</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Identidades de los grupos de la persona.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ groupIds: List&lt;UUID&gt;</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">GroupMembershipProjection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Projection</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Puerto de lectura de la pertenencia a grupos.</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 10px; vertical-align: top;">+ findGroupIds(GroupsOfPerson): List&lt;UUID&gt;</td>
        </tr>
    </tbody>
</table>
</div>

El módulo atiende la historia SGT-10 (iniciar sesión con credenciales institucionales) junto con Identity Provider, que usa authenticate para validar a quien inicia sesión.
