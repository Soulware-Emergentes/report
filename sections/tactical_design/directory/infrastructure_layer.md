La capa de infraestructura lee el directorio de la base de datos PostgreSQL de staff. Los puertos de proyección están separados por la pregunta que responden (credenciales, personas y grupos), de modo que cada uno puede pasar a leer de un directorio LDAP por separado.

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
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JpaPersonRepositoryAdapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Repository Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa PersonRepository con JPA.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- delegate: PersonJpaRepository<br>- publisher: ApplicationEventPublisher</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ save(person): Person<br>+ getById(id): Person</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PersonEntity</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JPA Entity</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Fila de la tabla people.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">id, username, displayName<br>jobTitle, department<br>passwordHash</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Getters</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">PersonJpaRepository</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Spring Data Repository</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Acceso JPA a people.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Ninguno</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Métodos derivados de JpaRepository</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JdbcCredentialProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Projection Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa CredentialProjection comparando la contraseña con el hash BCrypt guardado.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- jdbc: NamedParameterJdbcTemplate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ findAuthenticated(Credentials): Optional&lt;UUID&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JdbcPersonProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Projection Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa PersonProjection con SQL sobre people.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- jdbc: NamedParameterJdbcTemplate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ findPage(PeoplePage): PeoplePageResult<br>+ findByIds(PeopleById): List&lt;PersonResult&gt;</td>
        </tr>
        <tr>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">JdbcGroupMembershipProjection</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Projection Adapter</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">Implementa GroupMembershipProjection con SQL sobre group_members.</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">- jdbc: NamedParameterJdbcTemplate</td>
            <td style="border: 1px solid #333; padding: 6px 8px; vertical-align: top;">+ findGroupIds(GroupsOfPerson): List&lt;UUID&gt;</td>
        </tr>
    </tbody>
</table>
</div>
